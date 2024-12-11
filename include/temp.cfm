<cffunction name="findOrphanedFiles" access="public" output="true">
    <cfset var qryDir = "C:\home\theactorsoffice.com\wwwroot\new-subdomain\include\qry\">
    <cfset var parentDir = "C:\home\theactorsoffice.com\wwwroot\new-subdomain\">
    <cfset var filesWithQuery = []>
    <cfset var orphanedFiles = []>

    <!--- Step 1: Find all files in the qry directory with <cfquery> --->
    <cfdirectory action="list" directory="#qryDir#" name="qryFiles" filter="*.cfm">
    
    <cfloop query="qryFiles">
        <cffile action="read" file="#qryDir##qryFiles.name#" variable="fileContent">
        
        <cfif FindNoCase("<cfquery", fileContent)>
            <!--- Add file to the list if it contains <cfquery> --->
            <cfset arrayAppend(filesWithQuery, qryFiles.name)>
        </cfif>
    </cfloop>

    <!--- Step 2: Check parent directory for <cfinclude> references --->
    <cfloop array="#filesWithQuery#" index="fileName">
        <cfset var fileFound = false>

        <!--- Search for cfinclude in all files in the parent directory --->
        <cfdirectory action="list" directory="#parentDir#" name="parentFiles" recurse="true" filter="*.cfm">
        
        <cfloop query="parentFiles">
            <cffile action="read" file="#parentDir##parentFiles.name#" variable="parentFileContent">

            <!--- Look for the fileName in cfinclude --->
            <cfif FindNoCase("<cfinclude template=" & Chr(34) & fileName, parentFileContent)>
                <cfset fileFound = true>
                <cfbreak>
            </cfif>
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
