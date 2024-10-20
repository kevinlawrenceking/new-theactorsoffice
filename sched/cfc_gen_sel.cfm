<cfsetting requestTimeout="9000">

<!--- Start timing the script ---> 
<cfset startTime = getTickCount()>

<!--- Fetch the function data for SELECT queries from the database ---> 
<cfquery name="getSelectFunctions" datasource="abod" maxrows="10">
    SELECT t.id, f.id as function_id, f.function_name, f.component_id, f.qry_type, 
           f.returntype, f.hint, c.component_name, c.related_table, 
           t.qry_table, t.qry_details, t.qry_name, f.function_code
    FROM tao_files t 
    INNER JOIN functions f ON f.id = t.function_id 
    INNER JOIN components c ON c.id = f.component_id
    WHERE t.qry_type = 'sel' 
    AND t.qry_source = 'table' 
    AND (f.function_code IS NULL OR f.function_code = '')
</cfquery>

<!--- API Key Setup ---> 
<cfset apiKey = "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">

<!--- Loop through each function query result ---> 
<cfloop query="getSelectFunctions">

    <!--- Get the table metadata for the specific table (including primary key) ---> 
    <cfquery name="getTableMetadata" datasource="abod">
        SELECT c.COLUMN_NAME, c.DATA_TYPE, c.COLUMN_DEFAULT, c.EXTRA, c.COLUMN_KEY, m.CF_PARAM_TYPE
        FROM information_schema.columns c
        LEFT JOIN cfqueryparam_matrix m ON c.DATA_TYPE = m.DATA_TYPE
        WHERE c.table_schema = 'new_development'
        AND c.table_name = <cfqueryparam value="#getSelectFunctions.qry_table#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <!--- Fetch the primary key of the table ---> 
    <cfquery name="getPrimaryKey" datasource="abod">
        SELECT COLUMN_NAME 
        FROM information_schema.columns
        WHERE table_schema = 'new_development'
        AND table_name = <cfqueryparam value="#getSelectFunctions.qry_table#" cfsqltype="cf_sql_varchar">
        AND COLUMN_KEY = 'PRI'
    </cfquery>

    <cfset primaryKey = getPrimaryKey.COLUMN_NAME>

    <!--- Initialize variables for column names and parameter types ---> 
    <cfset columnNames = "">
    <cfset paramTypes = {}>

    <cfloop query="getTableMetadata">
        <!--- Append the column name to the list of columns --->
        <cfset columnNames = listAppend(columnNames, getTableMetadata.COLUMN_NAME)>

        <!--- Add the CF_PARAM_TYPE for each column dynamically --->
        <cfset paramTypes[getTableMetadata.COLUMN_NAME] = getTableMetadata.CF_PARAM_TYPE>
    </cfloop>

    <!--- Build the prompt to be sent to ChatGPT API ---> 
    <cfsavecontent variable="generatedPrompt"><cfoutput>
   <html>
    <body>
        <p><strong>Goal:</strong> Generate a ColdFusion function to process a flexible select query.</p>
        <p>The function should select values from the table <strong>#getSelectFunctions.qry_table#</strong>.</p>
        <p>The function name should be <strong>#getSelectFunctions.function_name#</strong>.</p>

        <p><strong>Table:</strong> #getSelectFunctions.qry_table#</p>

        <p><strong>Primary Key:</strong> #primaryKey#</p>

        <p><strong>Fields:</strong></p>
        <ul>
            <cfloop query="getTableMetadata">
                <li><strong>#getTableMetadata.COLUMN_NAME#</strong>: #getTableMetadata.DATA_TYPE#</li>
            </cfloop>
        </ul>

        <p><strong>The function should:</strong></p>
        <ul>
<li>Select all columns from the table explicitly, such as `id`, `name`, `email`, avoiding the use of `*` for better clarity and performance.</li>
<li>Build a dynamic `WHERE` clause that applies conditions based on provided arguments, only including fields where corresponding arguments are passed.</li>
<li>Support multiple comparison operators within the `WHERE` clause (e.g., "=", "<>", "IS NULL", "IS NOT NULL"), determining the operator based on the argument's value or type.</li>
<li>Use `cfqueryparam` for SQL parameterization for each argument. Ensure that `CF_SQL_TYPE` matches the field's `DATA_TYPE`, using a matrix like `cfqueryparam_matrix` to determine the correct type.</li>
<li>Dynamically build the `WHERE` clause by iterating over provided arguments and appending each condition with `AND` when multiple conditions exist.</li>
<li>Always include an explicit `ORDER BY` clause (e.g., `ORDER BY id`) to ensure consistent result sorting, and apply it after all applicable `WHERE` conditions.</li>
<li>Execute the dynamically built SQL statement using `cfquery`, ensuring all arguments are securely passed through `cfqueryparam`.</li>
<li>Return the query result as a structure, ensuring all explicitly selected columns are part of the result set.</li>
<li>Use traditional ColdFusion tag-based syntax (not `cfscript`) when writing the function.</li>
<li>Wrap the SQL query execution in a `cftry`/`cfcatch` block to handle errors gracefully. Use `cflog` to log error details (`cfcatch.message`, `cfcatch.detail`) and return error messages in the result structure.</li>
<li>Handle nullable arguments appropriately in `cfqueryparam` by using the `null` attribute where necessary to avoid runtime errors.</li>
<li>Ensure the SQL statement contains no redundant clauses, such as an empty `WHERE` clause when no conditions are applied.</li>
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
        "max_tokens": 800,
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
            WHERE id = <cfqueryparam value="#getSelectFunctions.function_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- Mark the function as processed ---> 
        <cfquery datasource="abod">
            UPDATE tao_files
            SET isfetch = 1
            WHERE id = <cfqueryparam value="#getSelectFunctions.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfoutput>Function for #getSelectFunctions.qry_table# saved successfully.<br></cfoutput>
    <cfelse>
        <cfoutput>Error generating function for #getSelectFunctions.qry_table#.<br></cfoutput>
    </cfif>

</cfloop>

<!--- End timing the script ---> 
<cfset endTime = getTickCount()>

<!--- Calculate the time taken in milliseconds ---> 
<cfset timeTakenMilliseconds = endTime - startTime>

<!--- Convert to minutes (divide by 1000 to get seconds, then divide by 60 for minutes) ---> 
<cfset timeTakenMinutes =
 timeTakenMilliseconds / 1000 / 60>

<!--- Output the time taken ---> 
<cfoutput>
    Time taken to process: #timeTakenMinutes# minutes
</cfoutput>
