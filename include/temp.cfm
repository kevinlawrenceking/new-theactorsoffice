<cffunction output="false" name="findOrphanedFilesInBatches" access="public" returntype="void">
    <!--- Define directories --->
    <cfset var qryDir = "C:\home\theactorsoffice.com\wwwroot\new-subdomain\include\qry\">
    <cfset var parentDir = "C:\home\theactorsoffice.com\wwwroot\new-subdomain\">
    <cfset var batchSize = 1> <!--- Number of files to process per batch --->
    <cfset var filesWithQuery = []>
    <cfset var orphanedFiles = []>
    <cfset var currentBatch = []>
    <cfset var totalBatches = 0>

    <!--- Step 1: Find all files in qryDir --->
    <cfdirectory action="list" directory="#qryDir#" name="qryFiles" filter="*.cfm">
    <cfset totalBatches = ceiling(qryFiles.recordCount / batchSize)>

    <!--- Step 2: Process files in batches --->
    <cfloop from="1" to="#totalBatches#" index="batchNumber">
        <!--- Get the current batch --->
        <cfset currentBatch = querySliced(qryFiles, batchSize, batchNumber)>

        <!--- Loop through the current batch --->
        <cfloop array="#currentBatch#" index="fileName">
            <cfset var fileFound = false>

            <!--- Check parentDir for filename occurrences --->
            <cfdirectory action="list" directory="#parentDir#" name="parentFiles" recurse="true" filter="*.cfm">

            <cfloop query="parentFiles">
                <!--- Wrap file reading in error handling --->
                <cftry>
                    <cffile action="read" file="#parentDir##parentFiles.name#" variable="parentFileContent">

                    <!--- Look for the filename anywhere in the file --->
                    <cfif FindNoCase(fileName, parentFileContent)>
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

<!--- Helper function to slice queries into batches --->
<cffunction name="querySliced" access="private" returntype="array">
    <cfargument name="query" type="query" required="true">
    <cfargument name="batchSize" type="numeric" required="true">
    <cfargument name="batchNumber" type="numeric" required="true">

    <cfset var startRow = ((arguments.batchNumber - 1) * arguments.batchSize) + 1>
    <cfset var endRow = min(startRow + arguments.batchSize - 1, arguments.query.recordCount)>
    <cfset var batch = []>

    <cfloop from="#startRow#" to="#endRow#" index="rowIndex">
        <cfset arrayAppend(batch, arguments.query.name[rowIndex])>
    </cfloop>

    <cfreturn batch>
</cffunction>

<cfscript>
    findOrphanedFilesInBatches();
</cfscript>
