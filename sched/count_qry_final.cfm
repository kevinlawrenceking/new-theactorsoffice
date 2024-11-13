<!--- Get a list of files in the /include/qry/qry directory --->
<cfdirectory action="list" directory="C:/home/theactorsoffice.com/optimized/include/qry" name="fileList">

<cfloop query="fileList">
    <!--- Read the file content --->
    <cfset fullFilePath = "C:/home/theactorsoffice.com/optimized/include/qry/#fileList.name#">
    <cfif fileExists(fullFilePath)>
        <cfset fileContent = fileRead(fullFilePath)>

        <!--- Count the number of <cfquery> blocks --->
        <cfset cfqueryCount = REFindNoCaseCount("<cfquery result="result" ", fileContent)>

        <!--- Output the file name and number of queries found --->
        <cfoutput>
            File: #fileList.name#<br>
            Number of queries: #cfqueryCount#<br>
        </cfoutput>

        <!--- Update the number of queries in tao_files --->
        <cfquery result="result" datasource="abod">
            UPDATE tao_files
            SET qry_no = <cfqueryparam value="#cfqueryCount#" cfsqltype="cf_sql_integer">
            WHERE filename = <cfqueryparam value="#fileList.name#" cfsqltype="cf_sql_varchar">
            AND path = '/include/qry'
        </cfquery>
    </cfif>
</cfloop>





<!--- Get a list of files in the /include/qry/qry directory --->
<cfdirectory action="list" directory="C:/home/theactorsoffice.com/optimized/include" name="fileList">

<cfloop query="fileList">
    <!--- Read the file content --->
    <cfset fullFilePath = "C:/home/theactorsoffice.com/optimized/include#fileList.name#">
    <cfif fileExists(fullFilePath)>
        <cfset fileContent = fileRead(fullFilePath)>

        <!--- Count the number of <cfquery> blocks --->
        <cfset cfqueryCount = REFindNoCaseCount("<cfquery result="result" ", fileContent)>

        <!--- Output the file name and number of queries found --->
        <cfoutput>
            File: #fileList.name#<br>
            Number of queries: #cfqueryCount#<br>
        </cfoutput>

        <!--- Update the number of queries in tao_files --->
        <cfquery result="result" datasource="abod">
            UPDATE tao_files
            SET qry_no = <cfqueryparam value="#cfqueryCount#" cfsqltype="cf_sql_integer">
            WHERE filename = <cfqueryparam value="#fileList.name#" cfsqltype="cf_sql_varchar">
            AND path = '/include/qry'
        </cfquery>
    </cfif>
</cfloop>





<!--- Function to count the number of occurrences of <cfquery result="result"  --->
<cffunction name="REFindNoCaseCount" returnType="numeric">
    <cfargument name="searchString" required="true">
    <cfargument name="content" required="true">
    
    <cfset var count = 0>
    <cfset var startPos = 1>
    
    <cfloop condition="startPos LTE len(arguments.content)">
        <cfset startPos = REFindNoCase(arguments.searchString, arguments.content, startPos)>
        <cfif startPos GT 0>
            <cfset count++>
            <cfset startPos++>
        <cfelse>
            <cfbreak>
        </cfif>
    </cfloop>
    
    <cfreturn count>
</cffunction>
