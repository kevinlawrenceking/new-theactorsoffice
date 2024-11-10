<cfquery name="getFiles" datasource="abod">
    SELECT `id`, `path`, `filename` 
    FROM `tao_files` 
    WHERE `function_id` IS NOT NULL AND `qry_no` = 1;
</cfquery>

<cfloop query="getFiles">
    <cfset fullFilePath = "C:/home/theactorsoffice.com/optimized" & path & "/" & filename>
    
    <cfif fileExists(fullFilePath)>
        <cfset fileContent = fileRead(fullFilePath)>
        Processing file: <cfoutput>#filename#</cfoutput><br>
        
        <cfset queryNameMatch = REMatchNoCase("name\s*=\s*['\"]([a-zA-Z0-9_-]+)['\"]", fileContent)>
        Found Matches: <cfoutput>#arrayLen(queryNameMatch)#</cfoutput> for file: <cfoutput>#filename#</cfoutput><br>
        
        <!--- If a match is found, extract and update the qry_name field --->
        <cfif arrayLen(queryNameMatch) GT 0>
            <cfset extractedQueryName = queryNameMatch[1]>
            <cfset extractedQueryName = trim(replace(replace(extractedQueryName, "name=", "", "ALL"), '"', "", "ALL"))>
            File: <cfoutput>#filename#</cfoutput><br>
            
            <cfquery datasource="abod">
                UPDATE tao_files 
                SET qry_name = <cfqueryparam value="#extractedQueryName#" cfsqltype="cf_sql_varchar" maxlength="255"> 
                WHERE id = <cfqueryparam value="#getFiles.id#" cfsqltype="cf_sql_integer">
            </cfquery>
        <cfelse>
            No query name found for file: <cfoutput>#filename#</cfoutput><br>
        </cfif>
    <cfelse>
        File not found: <cfoutput>#fullFilePath#</cfoutput><br>
    </cfif>
</cfloop>

<!--- Changes made: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Removed `cftry` and `cfcatch` blocks entirely.
6. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->