<cfsetting requestTimeout="9000">
<cfset dsn="abod" />
<cfset dbug = "N" />

<!--- Step 1: Query the database for the file details to process --->
<cfquery name="getQueryFiles" datasource="#dsn#">
    SELECT 
        t.id,
        t.path,
        t.filename,
        t.function_id,
        f.function_name,
        f.function_code_final AS function_details,
        c.component_name,
        c.filename AS component_filename
    FROM tao_files t
    INNER JOIN functions f ON f.id = t.function_id
    INNER JOIN components c ON c.id = f.component_id
    WHERE t.path = '/include/qry' AND isfetch = 0
    LIMIT 100
</cfquery>

<!--- Define paths for reading and saving files --->
<cfset path_to_read = "C:/home/theactorsoffice.com/optimized">
<cfset path_to_save = "C:/home/theactorsoffice.com/extracted">

<!--- Step 2: Loop through each query file record --->
<cfloop query="getQueryFiles">
    <!--- Construct the full file path to read --->
    <cfset fullFilePath = "#path_to_read##getQueryFiles.path#/#getQueryFiles.filename#">

    <!--- Open and read the file content --->
    <cffile action="read" file="#fullFilePath#" variable="fileContent">

    <!--- Step 3: Create the prompt for ChatGPT API to transform the query --->
    <cfsavecontent variable="generatedPrompt"><cfoutput>
<html>
    <body>
        <h2>Goal:</h2>
        <p>Replace the <code>&lt;cfquery&gt;</code> block in the provided ColdFusion query file with a fetch statement written in coldfusion standard code that seamlessly integrates by calling the respective function from its component. Make sure to read the function code and component path/name to properly write the fetch details.</p>

        <h3>Query File Content:</h3>
        <pre>
        #htmlEditFormat(fileContent)#
        </pre>

        <h3>Function Details:</h3>
        <p>Function Name: <code>#getQueryFiles.function_name#</code></p>
        <pre>
        #htmlEditFormat(getQueryFiles.function_details)#
        </pre>

        <h3>Component Details:</h3>
        <p>Component Name: <code>#getQueryFiles.component_name#</code></p>
        <p>Component Path: <code>#getQueryFiles.component_filename#</code></p>

        <h3>Instructions:</h3>
        <ul>
            <li>Replace the <code>&lt;cfquery&gt;</code> block with coldfusion code to fetch the function named <code>#getQueryFiles.function_name#</code> from the component <code>#getQueryFiles.component_name#</code>.</li>
            <li>Ensure that any additional code outside of the <code>&lt;cfquery&gt;</code> block is preserved as-is.</li>
            <li>The fetch statement should properly reference the component and function path for seamless integration.</li>
            <li>Retain any other code that's in the original file but not the cfquery</li>
            <li>Save the modified file and update the database to set <code>isfetch = 1</code> once the conversion is complete.</li>
            <li>Wrap it in a cfcatch with errors going to *errorLog* saying "[Error in #getQueryFiles.filename#], etc."</li>
              <li>Only write the code [nov verbose]</li>
        </ul>
    </body>
</html></cfoutput>
    </cfsavecontent>

    <!--- Step 4: Prepare the payload for the ChatGPT API --->
    <cfset payload = {
        "model": "gpt-4o-2024-08-06",
        "messages": [
            {"role": "system", "content": "You are a ColdFusion expert that helps convert cfquery code into fetch statements."},
            {"role": "user", "content": generatedPrompt}
        ],
        "max_tokens": 5000,
        "temperature": 0.3,
        "top_p": 0.8,
        "frequency_penalty": 0.2,
        "presence_penalty": 0.2,
        "stop": ["</cffunction>"]
    }>

    <!--- Step 5: Call the ChatGPT API to transform the query file --->
    <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="apiResponse" timeout="9000" charset="utf-8">
        <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#serializeJSON(payload)#">
    </cfhttp>

    <!--- Step 6: Deserialize the API response to extract the modified content --->
    <cfset responseData = deserializeJSON(apiResponse.fileContent)>
    <cfif structKeyExists(responseData, "choices")>
        <cfset modifiedFileContent = responseData.choices[1].message.content>

                    <!--- Remove backticks from the response --->
            <cfset modifiedFileContent = replace(modifiedFileContent, "```coldfusion", "", "all")>
            <cfset modifiedFileContent = replace(modifiedFileContent, "```", "", "all")>




        <!--- Construct the full file path to save the modified file --->
        <cfset fullSavePath = "#path_to_save##getQueryFiles.path#/#getQueryFiles.filename#">
<Cfif #dbug# is "Y"><Cfoutput>
        <table width="100%">
<TR><th>Prompt</th><th>old file</th><th>new file</th></TR>
<TR><TD>#generatedPrompt#</td><td  >#fileContent#</td><td ><pre>#modifiedFileContent#</pre></td></TR>
</table></cfoutput>
</cfif>

        <!--- Step 7: Save the new query file in the specified directory --->
        <cffile action="write" file="#fullSavePath#" output="#modifiedFileContent#" addNewLine="no">

        <!--- Step 8: Update the record in the database to indicate it's been processed --->
        <cfquery datasource="#dsn#">
            UPDATE tao_files
            SET isfetch = 1,
            fetch_details = <cfqueryparam value="#modifiedFileContent#" cfsqltype="cf_sql_longvarchar">
            WHERE id = <cfqueryparam value="#getQueryFiles.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfoutput>File #getQueryFiles.filename# has been successfully processed and saved.<br></cfoutput>
    <cfelse>
        <cfoutput>Error processing file #getQueryFiles.filename#: No content returned from API.<br></cfoutput>
    </cfif>
</cfloop>