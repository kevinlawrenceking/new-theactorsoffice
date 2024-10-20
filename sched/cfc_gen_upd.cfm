
<cfsetting requestTimeout="9000">

<!--- Start timing the script ---> 
<cfset startTime = getTickCount()>

<!--- Fetch the function data from the database ---> 
<cfquery name="getInsertFunctions" datasource="abod" maxrows="5">
SELECT t.id, f.id as function_id, f.function_name, f.component_id, f.qry_type, 
           f.returntype, f.hint, c.component_name, c.related_table, 
           t.qry_table, t.qry_details, t.qry_name,f.function_code
    FROM tao_files t 
    INNER JOIN functions f ON f.id = t.function_id 
    INNER JOIN components c ON c.id = f.component_id
    WHERE t.qry_type = 'upd' and (f.function_code is null or f.function_code = '')
</cfquery>

 <!--- API Key Setup ---> 


<!--- Loop through each function query result ---> 
<cfloop query="getInsertFunctions">

    <!--- Get the table metadata for the specific table (including primary key) ---> 
    <cfquery name="getTableMetadata" datasource="abod">
        SELECT COLUMN_NAME, DATA_TYPE, COLUMN_DEFAULT, EXTRA, COLUMN_KEY
        FROM information_schema.columns
        WHERE table_schema = 'new_development'
        AND table_name = <cfqueryparam value="#getInsertFunctions.qry_table#" cfsqltype="cf_sql_varchar">
        AND EXTRA NOT LIKE '%auto_increment%'  
        AND (COLUMN_DEFAULT IS NULL OR COLUMN_DEFAULT != 'CURRENT_TIMESTAMP') 
    </cfquery>

    <!--- Fetch the primary key of the table ---> 
    <cfquery name="getPrimaryKey" datasource="abod">
        SELECT COLUMN_NAME 
        FROM information_schema.columns
        WHERE table_schema = 'new_development'
        AND table_name = <cfqueryparam value="#getInsertFunctions.qry_table#" cfsqltype="cf_sql_varchar">
        AND COLUMN_KEY = 'PRI'
    </cfquery>

    <cfset primaryKey = getPrimaryKey.COLUMN_NAME>

    <!--- Initialize variables for column names and parameter types ---> 
    <cfset columnNames = "">
    <cfset paramTypes = "">

    <cfloop query="getTableMetadata">
        <cfset columnNames = listAppend(columnNames, getTableMetadata.COLUMN_NAME)>
        <cfset paramTypes = listAppend(paramTypes, getTableMetadata.DATA_TYPE)>
    </cfloop>

    <!--- Build the prompt to be sent to ChatGPT API ---> 
    <cfsavecontent variable="generatedPrompt"><cfoutput>
   <html>
    <body>
        <p><strong>Goal:</strong> Generate a ColdFusion function to process an update query.</p>
        <p>The function should update values in the table <strong>#getInsertFunctions.qry_table#</strong>.</p>
        <p>The function name should be <strong>#getInsertFunctions.function_name#</strong>.</p>

        <p><strong>Table:</strong> #getInsertFunctions.qry_table#</p>

        <p><strong>Primary Key:</strong> #primaryKey#</p>

        <p><strong>Fields:</strong></p>
        <ul>
            <cfloop query="getTableMetadata">
                <li><strong>#getTableMetadata.COLUMN_NAME#</strong>: #getTableMetadata.DATA_TYPE#</li>
            </cfloop>
        </ul>

        <p><strong>The function should:</strong></p>
        <ul>
            <li>Use appropriate data types (e.g., integer, varchar, date, decimal).</li>
            <li>Wrap each field in `cfqueryparam` for proper SQL parameterization.</li>
            <li>If arguments are not provided in the CFC, those fields should be omitted from the update operation.</li>
            <li>Support flexible updates by conditionally adding fields based on the provided arguments.</li>
            <li>Use the primary key for the `WHERE` clause to update the correct record.</li>
            <li>Concatenate the `SET` clauses using `arrayToList(updates, ", ")` for multiple updates.</li>
            <li>Ensure the SQL string is properly constructed and not cut off prematurely.</li>
            <li>If no fields are updated (i.e., `arrayLen(updates) EQ 0`), return `0` to indicate no rows were affected.</li>
            <li>Execute the SQL update query using `cfquery`, and set the datasource to `abod`.</li>
            <li>Use `query.affectedRows` to return the number of affected rows (instead of `recordCount`).</li>
            <li>Ensure proper error handling using `cftry` and `cfcatch`, and return `0` if an error occurs.</li>
            <li>Log any errors encountered in the `cfcatch` block using `cflog`, capturing the `cfcatch.message` and error details for troubleshooting.</li>
            <li>Close the function by returning the `affectedRows` only once at the end, and avoid redundant `cfreturn` statements.</li>
        </ul>

        <p>The output should only include the ColdFusion function code, with no additional explanations or comments.</p>
    </body>
</html>

    </cfoutput></cfsavecontent>

    <!--- Build the payload for the ChatGPT API ---> 
    <cfset payload = {
        "model": "gpt-4o-mini",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant that generates ColdFusion functions."},
            {"role": "user", "content": generatedPrompt}
        ],
        "max_tokens": 3500,
        "temperature": 0.3
    }>

    <!--- Call ChatGPT API ---> 
    <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="httpResponse" timeout="9000" charset="utf-8">
        <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#serializeJSON(payload)#">
    </cfhttp>

    <!--- Deserialize the response ---> 
    <cfset responseData = deserializeJSON(httpResponse.fileContent)>

    <!--- Process the API response: Replace backticks, and add the correct datasource ---> 
    <cfif structKeyExists(responseData, "choices")>
        <cfset generatedFunctionCode = responseData.choices[1].message.content>

        <!--- Remove backticks from the response ---> 
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```coldfusion", "", "all")>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```", "", "all")>

        <!--- Replace placeholder for datasource ---> 
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "yourDataSourceName", "abod", "all")>

        <!--- Modify to return the number of affected rows if returntype is "numeric" ---> 
        <cfif getInsertFunctions.returntype EQ "numeric">
            <cfset generatedFunctionCode &= chr(13) & '<cfreturn affectedRows>'>
        </cfif>

        <!--- Save the generated function to the database ---> 
        <cfquery datasource="abod">
            UPDATE functions
            SET function_code = <cfqueryparam value="#generatedFunctionCode#" cfsqltype="cf_sql_longvarchar">
            WHERE id = <cfqueryparam value="#getInsertFunctions.function_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- Mark the function as processed ---> 
        <cfquery datasource="abod">
            UPDATE tao_files
            SET isfetch = 1
            WHERE id = <cfqueryparam value="#getInsertFunctions.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfoutput>Function for #getInsertFunctions.qry_table# saved successfully.<br></cfoutput>
    <cfelse>
        <cfoutput>Error generating function for #getInsertFunctions.qry_table#.<br></cfoutput>
    </cfif>

</cfloop>

<!--- End timing the script ---> 
<cfset endTime = getTickCount()>

<!--- Calculate the time taken in milliseconds ---> 
<cfset timeTakenMilliseconds = endTime - startTime>

<!--- Convert to minutes (divide by 1000 to get seconds, then divide by 60 for minutes) ---> 
<cfset timeTakenMinutes = timeTakenMilliseconds / 1000 / 60>

<!--- Output the time taken ---> 
<cfoutput>
    Time taken to process: #timeTakenMinutes# minutes
</cfoutput>
