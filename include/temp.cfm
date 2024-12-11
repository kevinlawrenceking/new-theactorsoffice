<cffunction output="false" name="findOrphanedFiles" access="public" returntype="void">
    <!--- Define directories --->
    <cfset var qryDir = "C:\home\theactorsoffice.com\wwwroot\new-subdomain\include\qry\">
    <cfset var parentDir = "C:\home\theactorsoffice.com\wwwroot\new-subdomain\">
    <cfset var filesWithQuery = []>
    <cfset var orphanedFiles = []>

    <!--- Step 1: Find all files in qryDir containing <cfquery> --->
    <cfdirectory action="list" directory="#qryDir#" name="qryFiles" filter="*.cfm">

    <cfloop query="qryFiles">
        <cffile action="read" file="#qryDir##qryFiles.name#" variable="fileContent">

        <!--- Check if the file contains <cfquery> --->
        <cfif FindNoCase("<cfquery", fileContent)>
            <cfset arrayAppend(filesWithQuery, qryFiles.name)>
        </cfif>
    </cfloop>

    <!--- Step 2: Check parentDir for references to filesWithQuery --->
    <cfloop array="#filesWithQuery#" index="fileName">
        <cfset var fileFound = false>

        <!--- Search for <cfinclude> references in all files in parentDir --->
        <cfdirectory action="list" directory="#parentDir#" name="parentFiles" recurse="true" filter="*.cfm">

        <cfloop query="parentFiles">
            <!--- Wrap file reading in error handling --->
            <cftry>
                <cffile action="read" file="#parentDir##parentFiles.name#" variable="parentFileContent">

                <!--- Look for the fileName in <cfinclude> --->
                <cfif FindNoCase("<cfinclude template=" & Chr(34) & "include/qry/" & fileName & Chr(34), parentFileContent)>
                    <cfset fileFound = true>
                    <cfbreak>
                </cfif>

            <cfcatch type="any">
                <!--- Skip missing or inaccessible files --->
                <cfset fileFound = fileFound>
            </cfcatch>
            </cftry>
        </cfloop>

        <!--- If not found, add to orphaned list --->
        <cfif NOT fileFound>
            <cfset arrayAppend(orphanedFiles, fileName)>
        </cfif>
    </cfloop>

    <!--- Step 3: Display orphaned files --->
    <cfoutput>
        <h2>Orphaned Files:</h2>
        <cfif arrayLen(orphanedFiles) EQ 0>
            <p>No orphaned files found.</p>
        <cfelse>
            <ul>
                <cfloop array="#orphanedFiles#" index="fileName">
                    <li>#fileName#</li>
                </cfloop>
            </ul>
        </cfif>
    </cfoutput>
</cffunction>

<cfscript>
    findOrphanedFiles();
</cfscript>
