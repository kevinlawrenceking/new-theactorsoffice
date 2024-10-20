<cfset apiUrl = "https://api.openai.com/v1/chat/completions">

<cfsavecontent variable="optimizationRules">
Beautify the ColdFusion code. Extract all `cfquery` blocks, save each as a new file in `/include/qry/` with the name of the query. Replace the `cfquery` block with a `cfinclude` statement. Ensure query file names are unique; if a conflict exists, append an increment number (e.g., `queryname_1.cfm`). Return only the optimized code without any comments, explanations, or metadata.
</cfsavecontent>

<cfquery name="getFiles" datasource="abod">
    SELECT id, `filename`, `path`
    FROM tao_files
    WHERE qry_removed_yn = 0 
    AND `path` = '/include'
    ORDER BY `filename`
    LIMIT 5
</cfquery>

<cffunction name="generateUniqueQueryFilename" returntype="string">
    <cfargument name="baseName" type="string" required="true">
    <cfquery name="checkExistingFiles" datasource="abod">
        SELECT filename
        FROM tao_files
        WHERE PATH = '/include/qry'
        AND filename LIKE '#arguments.baseName#%'
    </cfquery>
    <cfset counter = 0>
    <cfset newFileName = arguments.baseName & ".cfm">
    <cfif checkExistingFiles.recordcount GT 0>
        <cfloop condition="checkExistingFiles.recordcount GT 0">
            <cfset counter++>
            <cfset newFileName = arguments.baseName & "_" & counter & ".cfm">
        </cfloop>
    </cfif>
    <cfreturn newFileName>
</cffunction>

<cfloop query="getFiles">
    <cfset fullFilePath = "C:/home/theactorsoffice.com/wwwroot/kevin-subdomain#trim(getFiles.path)#/#trim(getFiles.filename)#">
    <cfset fileNameOnly = getFiles.filename>

    <cfoutput>Processing file: #fullFilePath#</cfoutput>

    <cfif fileExists(fullFilePath)>
        <cfoutput>File found: #fullFilePath#</cfoutput>
        <cfset fileContent = fileRead(fullFilePath)>
        <cfset chatGPTMessage = optimizationRules & chr(13) & chr(10) & "Optimize this ColdFusion code:" & chr(13) & chr(10) & fileContent>

        <cfset payload = {
            "model": "gpt-4o-mini",
            "messages": [
                {"role": "system", "content": "You are a helpful assistant that optimizes ColdFusion code."},
                {"role": "user", "content": chatGPTMessage}
            ],
            "max_tokens": 5000,
            "temperature": 0.5
        }>

    
        <cfhttp method="POST" url="#apiUrl#" result="httpResponse" charset="utf-8" timeout="900">
            <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
            <cfhttpparam type="header" name="Content-Type" value="application/json">
            <cfhttpparam type="body" value="#serializeJSON(payload)#">
        </cfhttp>

        <cfset responseData = deserializeJSON(httpResponse.fileContent)>

        <cfif structKeyExists(responseData, "error")>
            <cfoutput>Error: #responseData.error.message#</cfoutput>
        <cfelseif structKeyExists(responseData, "choices")>
            <cfset optimizedContent = responseData.choices[1].message.content>

            <!-- Save the optimized main file -->
            <cfset newFilePath = "C:/home/theactorsoffice.com/optimized/include/#fileNameOnly#">
            <cffile action="write" file="#newFilePath#" output="#optimizedContent#">
            <cfoutput>Optimized file saved: #newFilePath#</cfoutput>

            <!-- Extract query using regex and save to `/qry` folder, ensuring it's saved only once -->
            <cfset regexPattern = "<cfquery(.*?)<\/cfquery>">
            <cfset extractedQuery = refind(regexPattern, optimizedContent)>

            <cfif extractedQuery>
                <cfset queryBaseName = listFirst(fileNameOnly, ".") & "_query">
                <cfset queryFileName = generateUniqueQueryFilename(queryBaseName)>
                <cfset queryFilePath = "C:/home/theactorsoffice.com/optimized/include/qry/#queryFileName#">
                <cffile action="write" file="#queryFilePath#" output="#mid(optimizedContent, extractedQuery.pos, extractedQuery.len)#">
                <cfoutput>Query saved: #queryFilePath#</cfoutput>
            </cfif>

            <!-- Mark the file as processed -->
            <cfquery datasource="abod">
                UPDATE tao_files
                SET qry_removed_yn = 1
                WHERE id = #getFiles.id#
            </cfquery>
        </cfif>
    <cfelse>
        <cfoutput>File does not exist: #fullFilePath#</cfoutput>
    </cfif>
</cfloop>
