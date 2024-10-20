<cfsetting requestTimeout="900">
<cfset use_path = "/include">
<cfset path_prefix = "C:/home/theactorsoffice.com/extracted">

<cfset apiUrl = "https://api.openai.com/v1/chat/completions">

<cfsavecontent variable="optimizationRules">
Goal: This ColdFusion page should be beautified for readability, with code commented out using three hyphens (<!--- like this --->) and formatted to improve visual clarity. No changes should affect the functionality of the code.

Specific Instructions:

Beautify: Reformat the ColdFusion code for readability by adding appropriate indentation, spacing, and alignment.

Comment out:
Add ColdFusion comments using three hyphens (&lt;!--- like this ---&gt;) for each block of code (such as &lt;cfif&gt;, &lt;cfloop&gt;, and functions) to describe the purpose of the block. The comments should summarize the action or logic of the block.

Header comment: Add a comment at the top of the file using three hyphens (&lt;!--- ---&gt;) summarizing the purpose of the page or what the page does.

No verbose output: The output should only contain the updated ColdFusion code without extra explanations, comments, or any markup like "```".
</cfsavecontent>


<cfquery name="getFiles" datasource="abod">
    SELECT id, `filename`, `path`
    FROM tao_files
    WHERE optimized_yn = 0 AND path = '#use_path#'
    ORDER BY `filename` DESC
    LIMIT 10  
</cfquery>

<cfloop query="getFiles">
    <cfset fullFilePath = "C:/home/theactorsoffice.com/optimized#use_path#/#getFiles.filename#">
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

        <cfset apiKey = "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">

        <cftry>
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

                    <cfset saveFilePath = "#path_prefix##use_path#/#getFiles.filename#">
                    <cffile action="write" file="#saveFilePath#" output="#optimizedContent#">

                    <cfoutput>
                        Optimized file saved: #saveFilePath#<br>
                    </cfoutput>

                    <cfquery datasource="abod">
                        UPDATE tao_files
                        SET optimized_yn = 1
                        WHERE id = #getFiles.id#
                    </cfquery>
                <cfelse>
                    <cfoutput>Error optimizing file: #fileNameOnly#<br>No choices returned in response.<br></cfoutput>
                </cfif>
         
        <cfcatch>
            <cfoutput>Error occurred while calling the API for file: #fileNameOnly#<br>#cfcatch.message#<br></cfoutput>
        </cfcatch>
        </cftry>
    <cfelse>
        <cfoutput>File not found: #fullFilePath#<br></cfoutput>
    </cfif>
</cfloop>
