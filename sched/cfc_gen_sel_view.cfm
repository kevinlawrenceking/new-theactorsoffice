<cfsetting requestTimeout="9000">
<cfset dbug = "Y" />

<!--- Start timing the script ---> 
<cfset startTime = getTickCount()>

<!--- Fetch the function data for SELECT queries from the database ---> 
<cfquery name="getSelectFunctions" datasource="abod" maxrows="5">
    SELECT t.id, f.id as function_id, f.function_name, f.component_id, f.qry_type, 
           f.returntype, f.hint, c.component_name, c.related_table, 
           t.qry_table, t.qry_view, t.qry_details, t.qry_name, f.function_code
    FROM tao_files t 
    INNER JOIN functions f ON f.id = t.function_id 
    INNER JOIN components c ON c.id = f.component_id
    WHERE t.qry_source = 'view' 
    AND f.function_code is null
</cfquery>

<!--- API Key Setup ---> 
<cfset apiKey = "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">


<cfquery name="find_conditions" datasource="abod" maxrows="1">
    SELECT trimmed_qry_details 
    FROM view_conditions_final 
    WHERE qry_view = <cfqueryparam value="#getSelectFunctions.qry_view#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfset viewconditions = iif(find_conditions.recordcount EQ 1, find_conditions.trimmed_qry_details, "")>

<!--- Loop through each function query result ---> 
<cfloop query="getSelectFunctions">

    <!--- Get the table metadata for the specific table (including primary key) ---> 
    <cfquery name="getTableMetadata" datasource="abod">
        SELECT c.COLUMN_NAME, c.DATA_TYPE, c.COLUMN_DEFAULT, c.EXTRA, c.COLUMN_KEY, m.CF_PARAM_TYPE
        FROM information_schema.columns c
        LEFT JOIN cfqueryparam_matrix m ON c.DATA_TYPE = m.DATA_TYPE
        WHERE c.table_schema = 'new_development'
        AND c.table_name = <cfqueryparam value="#getSelectFunctions.qry_view#" cfsqltype="cf_sql_varchar">
    </cfquery>

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
            <h2>Goal:</h2>
            <p>Generate a ColdFusion function to process a select query based on the following requirements.</p>

            <h3>Function Details:</h3>
            <p>The function should be created with the following considerations:</p>
            <ul>
                <li><strong>Ensure Secure Parameterization:</strong>
                    <ul>
                        <li>Implement parameterized queries using <code>cfqueryparam</code> with <code>?</code> placeholders to avoid SQL injection.</li>
                        <li>Loop through parameters efficiently to ensure secure binding of values, and avoid direct concatenation of user input in the SQL statements.</li>
                        <li>Use the appropriate <code>cfqueryparam</code> data types as specified by the column schema details to ensure compatibility with the database.</li>
                    </ul>
                </li>

                <li><strong>Dynamic SQL Query Construction:</strong>
                    <ul>
                        <li>Maintain a clear and structured approach to building dynamic SQL queries with <code>WHERE</code> clauses based on provided arguments.</li>
                        <li>Ensure that the query logic properly handles cases where no conditions are passed to avoid empty or ineffective queries.</li>
                        <li>If no arguments are provided, consider returning an empty query set instead of executing an unfiltered query.</li>
                    </ul>
                </li>

                <li><strong>Error Handling and Logging:</strong>
                    <ul>
                        <li>Utilize a <code>cftry</code>/<code>cfcatch</code> block to handle errors gracefully and log both the error message and detailed information.</li>
                        <li>Include comprehensive error logging using <code>cflog</code> with <code>cfcatch</code> to capture all necessary details for debugging.</li>
                    </ul>
                </li>

                <li><strong>SQL Statement Optimization:</strong>
                    <ul>
                        <li>Refine the SQL statement construction to ensure it's concise and optimized, avoiding unnecessary clauses or logic.</li>
                        <li>Use the explicit column names from the table metadata instead of using <code>*</code> in the select statement.</li>
                    </ul>
                </li>

                <li><strong>Data Type Mapping Considerations:</strong>
                    <p>The function should dynamically determine the <code>cf_sqltype</code> based on the data type of each argument, rather than hardcoding it as <code>cf_sql_varchar</code>. Use a mapping strategy that aligns with the schema information to ensure accurate SQL type binding.</p>
                </li>

                <li><strong>Validation for WHERE and ORDER BY Clauses:</strong>
                    <p>Ensure that both clauses only use valid columns as specified in a whitelist to prevent SQL injection attacks.</p>
                </li>

                <h3>View:</h3>
                <p>The function should select values from the view <strong>#getSelectFunctions.qry_view#</strong>.</p>
                <p><strong>Fields:</strong></p>
                <ul>
                    <cfloop query="getTableMetadata">
                        <li><strong>#getTableMetadata.COLUMN_NAME#</strong>: #getTableMetadata.DATA_TYPE#</li>
                    </cfloop>
                </ul>

                <h3>Conditions:</h3>
                <p>Conditions: #viewconditions#</p>

                <h3>Instructions:</h3>
                <p>Generate the ColdFusion function <strong>#getSelectFunctions.function_name#</strong> based on the above requirements using the traditional ColdFusion tag-based syntax (not cfscript).</p>
            </body>
        </html>
    </cfoutput></cfsavecontent>

    <!--- Build the payload for the ChatGPT API --->
    <cfset payload = {
        "model": "gpt-4o-2024-08-06",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant that generates ColdFusion functions."},
            {"role": "user", "content": generatedPrompt}
        ],
        "max_tokens": 5000,
        "temperature": 0.3,
        "top_p": 0.8,
        "frequency_penalty": 0.2,
        "presence_penalty": 0.2,
        "stop": ["</cffunction>"]
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
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```coldfusion", "", "all")>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```", "", "all")>
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

        <cfoutput>Function for #getSelectFunctions.qry_view# saved successfully.<br></cfoutput>
    <cfelse>
                <cfoutput>Error generating function for #getSelectFunctions.qry_view#.<br></cfoutput>
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
