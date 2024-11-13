<cfquery result="result"  name="getAllIncludeFiles" datasource="abod">
    SELECT id, `filename`, `path`
    FROM tao_files
    WHERE path = '/include'
</cfquery>

<cfloop query="getAllIncludeFiles">
    <cfset fullFilePath = "C:/home/theactorsoffice.com/optimized/include/#getAllIncludeFiles.filename#">

    <cfif fileExists(fullFilePath)>

        <cfset fileContent = ToString(fileRead(fullFilePath))>


        <cfset qryCount = ArrayLen(REMatchNoCase("<cfquery result="result" \b[^>]*>", fileContent))>


        <cfquery result="result"  datasource="abod">
            UPDATE tao_files
            SET qry_no = <cfquery result="result" param value="#qryCount#" cfsqltype="cf_sql_integer">
            WHERE id = <cfquery result="result" param value="#getAllIncludeFiles.id#" cfsqltype="cf_sql_integer">
        </cfquery>

  
        <cfoutput>
            File: #getAllIncludeFiles.filename# | Number of Queries: #qryCount#<br>
        </cfoutput>
    </cfif>
</cfloop>
