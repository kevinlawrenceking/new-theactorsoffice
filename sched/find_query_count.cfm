<!--- Get a list of files in the /include/qry directory --->
<cfdirectory action="list" directory="C:/home/theactorsoffice.com/extracted/include/qry" name="fileList">

<cfloop query="fileList">
    <!--- Read the file content --->
    <cfset fullFilePath = "C:/home/theactorsoffice.com/extracted/include/qry/#fileList.name#">
    <cfif fileExists(fullFilePath)>
        <cfset fileContent = fileRead(fullFilePath)>

        <!--- Count the number of <cfquery result="result" > blocks --->
        <cfset cfqueryCount = ListLen(fileContent, "<cfquery result="result"  ")>

        <!--- Output the file name and number of queries found --->
        <cfoutput>
            File: #fileList.name#<br>
            Number of queries: #cfqueryCount#<br>
        </cfoutput>

        <!--- Update the number of queries in tao_files --->
        <cfquery result="result"  datasource="abod">
            UPDATE tao_files
            SET qry_no = <cfquery result="result" param value="#cfqueryCount#" cfsqltype="cf_sql_integer">
            WHERE filename = <cfquery result="result" param value="#fileList.name#" cfsqltype="cf_sql_varchar">
            AND path = '/include/qry'
        </cfquery>
    </cfif>
</cfloop>
