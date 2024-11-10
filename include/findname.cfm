<cfquery name="getFiles" datasource="abod">
    SELECT `id`, `path`, `filename` 
    FROM `tao_files` 
    WHERE `function_id` IS NOT NULL AND `qry_no` = 1;
</cfquery>

<cfloop query="getFiles">
    <cfset fullFilePath = "C:/home/theactorsoffice.com/optimized/" & path & "/" & filename>

    <cfif fileExists(fullFilePath)>
        <cfset fileContent = fileRead(fullFilePath)>
        Processing file: <cfoutput>#filename#</cfoutput><br>

  
      <cfset queryNameMatch = REMatchNoCase("name\\s*=\\s*['\"][a-zA-Z0-9_-]+['\"]", fileContent)>



        <cfoutput>Found Matches: #arrayLen(queryNameMatch)# for file: #filename#<br></cfoutput>

   
        <cfif arrayLen(queryNameMatch) GT 0>
            <cfset extractedQueryName = trim(replace(replace(queryNameMatch[1], "name=", "", "ALL"), '"', "", "ALL"))>
            
            <cfquery datasource="abod">
                UPDATE tao_files 
                SET qry_name = <cfqueryparam value="#extractedQueryName#" cfsqltype="cf_sql_varchar" maxlength="255"> 
                WHERE id = <cfqueryparam value="#getFiles.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfoutput>Updated qry_name for file: #filename#<br></cfoutput>
        <cfelse>
            <cfoutput>No query name found for file: #filename#<br></cfoutput>
        </cfif>
    <cfelse>
        <cfoutput>File not found: #fullFilePath#<br></cfoutput>
    </cfif>
</cfloop>
