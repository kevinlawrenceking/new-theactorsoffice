<cfsetting requestTimeout="900">


<cfset apiUrl = "https://api.openai.com/v1/chat/completions">

<cfsavecontent variable="optimizationRules">
Review the Coldfusion page and ***VERY IMPORTANT*** to do the following: Comment out the code, optimize minimally for readability, and beautify the ColdFusion code. Do not modify cfquery blocks. If a pound sign is inside a cfoutput plug (like hex color or jquery id) and it needs to be treated as a pound sign, make sure to make it double. Don't add "```coldfusion" to beginning or "```" at the end of file. No verbose output. [NO VERBOSE]
</cfsavecontent>

<cfquery name="getFiles" datasource="abod">
    SELECT id, `filename`, `path`
    FROM tao_files
    WHERE qry_removed_yn = 0   and path ='/include/qry'
    ORDER BY `filename` DESC
    LIMIT 20   
</cfquery>

<cfloop query="getFiles">
    <cfset fullFilePath = expandPath("#getFiles.path#/#getFiles.filename#")>
    <cfset fileNameOnly = getFiles.filename>

    <cfif fileExists(fullFilePath)>
        <cfset fileContent = fileRead(fullFilePath)>
        <cfset chatGPTMessage = optimizationRules & chr(13) & chr(10) & fileContent>

        <cfset payload = {
            "model": "gpt-4o-mini",
            "messages": [
                {"role": "system", "content": "You are a helpful assistant that optimizes ColdFusion code."},
                {"role": "user", "content": chatGPTMessage}
            ],
            "max_tokens": 5000,
            "temperature": 0.3
        }>

        <cfhttp method="POST" url="#apiUrl#" result="httpResponse" timeout="9000" charset="utf-8">
            <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
            <cfhttpparam type="header" name="Content-Type" value="application/json">
            <cfhttpparam type="body" value="#serializeJSON(payload)#">
        </cfhttp>

        <cfset responseData = deserializeJSON(httpResponse.fileContent)>

        <cfif structKeyExists(responseData, "choices")>
            <cfset optimizedContent = responseData.choices[1].message.content>
 
            <cfset optimizedContent = replace(optimizedContent, "```coldfusion", "", "all")>
            <cfset optimizedContent = replace(optimizedContent, "```", "", "all")>

            <cfset newFilePath = "C:/home/theactorsoffice.com/optimized/include/qry/" & fileNameOnly>
            <cffile action="write" file="#newFilePath#" output="#optimizedContent#">

            <cfoutput>
                Optimized file saved: #newFilePath#<BR>
            </cfoutput>

            <cfquery datasource="abod">
                UPDATE tao_files
                SET qry_removed_yn = 1
                WHERE id = #getFiles.id#
            </cfquery>
        <cfelse>
            <cfoutput>Error optimizing file: #fileNameOnly#<BR></cfoutput>
        </cfif>
    <cfelse>
        <cfoutput>File not found: #fullFilePath#<BR></cfoutput>
    </cfif>
</cfloop>
