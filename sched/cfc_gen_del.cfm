<cfsetting requestTimeout="9000">

<!--- Start timing the script ---> 
<cfset startTime = getTickCount()>

<!--- Fetch the function data for delete queries from the database ---> 
<cfquery name="getDeleteFunctions" datasource="abod" maxrows="5">
    SELECT t.id, f.id as function_id, f.function_name, f.component_id, f.qry_type, 
           f.returntype, f.hint, c.component_name, c.related_table, 
           t.qry_table, t.qry_details, t.qry_name
    FROM tao_files t 
    INNER JOIN functions f ON f.id = t.function_id 
    INNER JOIN components c ON c.id = f.component_id
    WHERE t.qry_type = 'del' AND t.isfetch = 0
</cfquery>



<!--- Loop through each function query result ---> 
<cfloop query="getDeleteFunctions">

    <!--- Get the table metadata for the specific table ---> 
    <cfquery name="getTableMetadata" datasource="abod">
        SELECT COLUMN_NAME, DATA_TYPE
        FROM information_schema.columns
        WHERE table_schema = 'new_development'
        AND table_name = <cfqueryparam value="#getDeleteFunctions.qry_table#" cfsqltype="cf_sql_varchar">
    </cfquery>

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
        <p><strong>Goal:</strong> Generate a ColdFusion function to process a flexible delete query.</p>
        <p>The function should delete records from the table <strong>#getDeleteFunctions.qry_table#</strong>.</p>
        <p>The function name should be <strong>#getDeleteFunctions.function_name#</strong>.</p>

        <p><strong>Table:</strong> #getDeleteFunctions.qry_table#</p>

        <p><strong>Fields:</strong></p>
        <ul>
            <cfloop query="getTableMetadata">
                <li><strong>#getTableMetadata.COLUMN_NAME#</strong>: #getTableMetadata.DATA_TYPE#</li>
            </cfloop>
        </ul>

        <p><strong>The function should:</strong></p>
        <ul>
     <li>Accept each table field as an argument in the function, using appropriate data types (e.g., numeric, varchar, boolean).</li>
<li>Wrap each field in `cfqueryparam` for proper SQL parameterization to prevent SQL injection.</li>
<li>Construct the `WHERE` clause dynamically, only including conditions for the fields where arguments are provided.</li>
<li>Ensure that if no arguments are provided, the function returns `0` and avoids performing any delete operation (to prevent full table deletion).</li>
<li>Support deleting by one or more fields flexibly, based on the arguments passed in.</li>
<li>Concatenate the `WHERE` clauses dynamically using `arrayToList(whereClauses, " AND ")` for multiple conditions.</li>
<li>Execute the SQL `DELETE` query using `cfquery`, and ensure the datasource is set to `abod`.</li>
<li>Check the `affectedRows` from the query execution and return `1` if rows were deleted, or `0` if no rows were affected.</li>
<li>Handle errors properly using `cftry` and `cfcatch`. If an error occurs during query execution, log the error using `cflog` with both `cfcatch.message` and `cfcatch.detail` for troubleshooting, and return `0`.</li>
<li>Ensure the function closes by returning the result of the `affectedRows` check (either `1` for success or `0` for failure) without redundant `cfreturn` statements.</li>
<li>Make sure nullable parameters are handled correctly using the `null` attribute in `cfqueryparam` when arguments are not provided.</li>
<li>Capture the number of affected rows by assigning the result of the `cfquery` to the variable `affectedRows`, and use this to determine the return value.</li>
<li>Ensure each argument passed is properly checked for null or non-null values before including it in the `WHERE` clause by using `isNull()` function for each argument.</li>
<li>Define `affectedRows` after executing the query and use it to determine if rows were affected. Use `updateQuery.affectedRows` to store the result of the query execution.</li>
<li>Avoid using the `IIF()` construct and instead directly return the `affectedRows` to indicate if rows were deleted (return `1` if rows were deleted, otherwise return `0`).</li>
<li>Ensure that all conditions inside the `WHERE` clause wrap the field in `cfqueryparam` for proper SQL parameterization.</li>
<li>Log both `cfcatch.message` and `cfcatch.detail` in the `cfcatch` block to capture detailed error information for troubleshooting.</li>
<li>Ensure that `affectedRows` captures the result of the delete query by assigning it from `deleteQuery.affectedRows` and returning this value at the end of the function.</li>
<li>If no conditions are provided (i.e., no arguments are passed), ensure the function returns `0` without running the delete operation to avoid accidental full-table deletion.</li>
<li>Wrap each field in `cfqueryparam` to ensure SQL injection protection and proper parameter binding.</li>
<li>Ensure that all conditions in the `WHERE` clause dynamically check for non-null values before appending them to the query.</li>
<li>Return `affectedRows` after the query execution to indicate whether any records were deleted (`> 0`) or not (`0`).</li>
<li>Use `cftry` and `cfcatch` to handle errors gracefully, logging both `cfcatch.message` and `cfcatch.detail` for troubleshooting purposes.</li>

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

        <!--- Save the generated function to the database ---> 
        <cfquery datasource="abod">
            UPDATE functions
            SET function_code = <cfqueryparam value="#generatedFunctionCode#" cfsqltype="cf_sql_longvarchar">
            WHERE id = <cfqueryparam value="#getDeleteFunctions.function_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- Mark the function as processed ---> 
        <cfquery datasource="abod">
            UPDATE tao_files
            SET isfetch = 1
            WHERE id = <cfqueryparam value="#getDeleteFunctions.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfoutput>Function for #getDeleteFunctions.qry_table# saved successfully.<br></cfoutput>
    <cfelse>
        <cfoutput>Error generating function for #getDeleteFunctions.qry_table#.<br></cfoutput>
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
