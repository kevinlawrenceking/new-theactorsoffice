<!--- Set the request timeout to handle long-running processes --->
<cfsetting requestTimeout="9000">

<!--- Set debugging flag and initialize API key --->
<cfset dbug = "Y">
<cfset dsn = "abod">
<cfset apiKey = "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">




<!--- Start timing the script --->
<cfset startTime = getTickCount()>

<!--- Fetch the function data for SELECT queries from the database --->
<cfquery name="getSelectFunctions" datasource="#dsn#" maxrows="10">
 SELECT f.id as function_id, f.function_name, f.component_id, f.qry_type, 
           f.hint, c.component_name, c.related_table, c.related_table as qry_table,
           f.function_code,q.returnTYpe,q.example
    FROM  functions f
    INNER JOIN components c ON c.id = f.component_id
    INNER JOIN qry_types q on f.qry_type = q.name
    WHERE f.function_code IS NULL 

</cfquery>

    



<!--- Ensure that viewconditions is properly initialized before outputting --->
<cfquery name="find_conditions" datasource="abod" maxrows="1">
    SELECT trimmed_qry_details 
    FROM view_conditions_final 
    WHERE qry_view = <cfqueryparam value="#getSelectFunctions.qry_table#" cfsqltype="cf_sql_varchar">
</cfquery>
<cfset viewconditions = ""> 
<Cfif find_conditions.recordcount EQ 1>
   


 
    <cfset viewconditions = find_conditions.trimmed_qry_details>
</cfif>


<!--- Check if there are records to process --->
<cfif getSelectFunctions.recordcount EQ 0>
    <cfoutput>No functions found to process.<br></cfoutput>
    <cfabort>
</cfif>

<!--- Loop through each function query result --->
<cfloop query="getSelectFunctions">

    <!--- Fetch schema details related to the function's table(s) --->
    <cfquery name="getTableMetadata" datasource="#dsn#">
        SELECT c.COLUMN_NAME, c.DATA_TYPE, c.COLUMN_DEFAULT, c.EXTRA, c.COLUMN_KEY, m.CF_PARAM_TYPE
        FROM information_schema.columns c
        LEFT JOIN cfqueryparam_matrix m ON c.DATA_TYPE = m.DATA_TYPE
        WHERE c.table_schema = 'new_development'
        AND c.table_name = <cfqueryparam value="#getSelectFunctions.qry_table#" cfsqltype="cf_sql_varchar">
    </cfquery>


        <!--- Fetch schema details related to the function's table(s) --->
    <cfquery name="schemas" datasource="#dsn#">
        SELECT distinct tableschema 
        FROM tao_files 
        WHERE function_id = <cfqueryparam value="#getSelectFunctions.function_id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <cfsavecontent variable="columnDetails">
        <cfoutput query="schemas">
            #schemas.tableschema#
        </cfoutput>
    </cfsavecontent>



    <!--- Build the prompt to be sent to ChatGPT API --->
    <cfsavecontent variable="generatedPrompt"><cfoutput>
<html>
    <body>
        <h2>Goal:</h2>
        <p>Generate a ColdFusion function to process a select query based on the following requirements.</p>
        <p><strong>Function Name:</strong> #getSelectFunctions.function_name#<BR>
        <strong>Function Type:</strong> #getSelectFunctions.qry_type#<BR>
        <strong>Return Type:</strong> #getSelectFunctions.returntype#<BR>


</p>
        <h3>Function Details:</h3>

        
                <cfif schemas.recordcount is not "0">
                    <h3>Table Column Details:</h3>
                    <p>Below is the schema information for the relevant table(s) used in this function:</p>
                    #columnDetails#
                    <p>Use the above table schema information to ensure proper handling of each column's data type, nullability, and constraints. This information should guide how you construct SQL statements and use <code>cfqueryparam</code> types.</p>
                </cfif>



        <p>The function should be created with the following considerations:</p>
        <ul>
            <li><strong>Ensure Secure Parameterization:</strong>
                <ul>
                    <li>Implement parameterized queries using <code>cfqueryparam</code> with <code>?</code> placeholders to avoid SQL injection.</li>
                    <li><strong>Directly use the <code>cfqueryparam</code> data types specified by the column schema details provided below. Do NOT use generic functions like <code>getSQLType()</code> to determine data types.</strong></li>
                    <li>For example, if the column name is "id" and its data type is "CF_SQL_INTEGER" according to the schema, use:
                        <pre><code>&lt;cfqueryparam value="#chr(35)#param.value#chr(35)#" cfsqltype="CF_SQL_INTEGER" null="#chr(35)#isNull(param.value)#chr(35)#"&gt;</code></pre>
                    </li>
                </ul>
            </li>

            <li><strong>Dynamic SQL Query Construction:</strong>
                <ul>
                    <li>Explicitly list all column names in the <code>SELECT</code> clause instead of using <code>*</code> for better clarity and performance.</li>
                    <li>Maintain a structured approach to building dynamic SQL queries with <code>WHERE</code> clauses based on provided arguments.</li>
                    <li>Build the <code>WHERE</code> clause dynamically, appending conditions that have valid values only.</li>
                    <li>If no arguments are provided, return an empty query set instead of executing an unfiltered query.</li>
                    <li>Support multiple comparison operators within the <code>WHERE</code> clause (e.g., <code>=</code>, <code>&lt;&gt;</code>, <code>IS NULL</code>, <code>IS NOT NULL</code>), depending on the argument's value or type.</li>
                </ul>
            </li>

            <li><strong>Error Handling and Logging:</strong>
                <ul>
                    <li>Utilize a <code>cftry</code>/<code>cfcatch</code> block to handle errors gracefully and log necessary details.</li>
                    <li>Use <code>cflog</code> to log error information including <code>cfcatch.message</code>, <code>cfcatch.detail</code>, and the SQL query that caused the error.</li>
                </ul>
            </li>

            <li><strong>SQL Statement Optimization:</strong>
                <ul>
                    <li>Refine the SQL statement to ensure it's concise and optimized, removing any unnecessary clauses or logic.</li>
                    <li>Include an explicit <code>ORDER BY</code> clause to ensure consistent result sorting.</li>
                    <li>Validate the <code>ORDER BY</code> column against a whitelist of safe columns to prevent SQL injection.</li>
                </ul>
            </li>

            <li><strong>Handling Special Characters in Column Names:</strong>
                <ul>
                    <li>Ensure that column names containing special characters or spaces are handled properly using backticks <code>`</code> in MySQL.</li>
                    <li>Avoid using non-standard column names with special characters whenever possible to maintain code readability.</li>
                </ul>
            </li>

            <li><strong>Data Type Mapping Considerations:</strong>
                <ul>
                    <li><strong>Always use the specific <code>cf_sqltype</code> values directly from the schema details provided. Do NOT use or implement any logic that tries to guess or infer the data type.</strong></li>
                    <li>Ensure the correct SQL data type for each parameter by referencing the exact data type from the schema details in the examples provided below.</li>
                </ul>
            </li>

            <li><strong>Validation for WHERE and ORDER BY Clauses:</strong>
                <ul>
                    <li>Ensure that both the <code>WHERE</code> and <code>ORDER BY</code> clauses only use valid columns from a predefined whitelist to prevent SQL injection attacks.</li>
                    <li>Verify that any fields specified in the <code>ORDER BY</code> clause exist in the result set and are explicitly selected.</li>
                </ul>
            </li>

            <li><strong>Handling Missing Function Termination:</strong>
                <ul>
                    <li>If the generated ColdFusion function is missing the closing <code>&lt;/cffunction&gt;</code> tag, manually add it to prevent errors and ensure proper function structure.</li>
                </ul>
            </li>
        </ul>

 
                        <h3>table:</h3>
                <p>The function should select values from the table <strong>#getSelectFunctions.qry_table#</strong>.</p>
                <p><strong>Fields:</strong></p>
                <ul>
                    <cfloop query="getTableMetadata">
                        <li><strong>#getTableMetadata.COLUMN_NAME#</strong>: #getTableMetadata.DATA_TYPE#</li>
                    </cfloop>
                </ul>

                <h3>Conditions:</h3>
                <p>Conditions: #viewconditions#</p>

 


        <h3>Examples of Expected Function Structures:</h3>
        <p>Below are examples of different types of functions that clearly illustrate how to use <code>cfqueryparam</code> with specific data types from the schema:</p>

        <h4>Example: #getSelectFunctions.qry_type# Function</h4>
        <pre>
   #getSelectFunctions.example#
        </pre>

        <h3>Dynamic SQL Query Construction:</h3>
        <ul>
            <li><strong>Avoid using the <code>getSQLType()</code> method or any equivalent function that attempts to guess the SQL data type. Instead, explicitly use the data types listed in the schema details to avoid mismatches and ensure query compatibility.</strong></li>
        </ul>

        <h3>Important Notes:</h3>
        <ul>
            <li>Do NOT add a component tag. Just the function.</li>
            <li>Do NOT remove "_" from anything in column names, function names, or variables.</li>
            <li>The output should only include the generated ColdFusion function code, without additional</li>
            <li>cfqueryparam data types should come directly from the schema and not use any dynamic determination method like getSQLType().</li>
       <li>When you create an empty query on error using queryNew, make sure the column names and types match the actual schema to avoid discrepancies.</li>
       
       </ul>


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

    <!--- Call the ChatGPT API --->
    <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="httpResponse" timeout="9000" charset="utf-8">
        <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#serializeJSON(payload)#">
    </cfhttp>

    <!--- Deserialize the response and handle errors --->
    <cfif isJSON(httpResponse.fileContent)>
        <cfset responseData = deserializeJSON(httpResponse.fileContent)>
        <cfif structKeyExists(responseData, "choices")>
            <cfset generatedFunctionCode = responseData.choices[1].message.content>
            <cfset generatedFunctionCode = replace(generatedFunctionCode, "```coldfusion", "", "all")>
            <cfset generatedFunctionCode = replace(generatedFunctionCode, "```", "", "all")>
            <cfset generatedFunctionCode = replace(generatedFunctionCode, "yourDataSourceName", "abod", "all")>

            <!--- Check if the </cffunction> tag is present in the function code --->
<cfif not findNoCase("</cffunction>", generatedFunctionCode)>
    <!--- If the closing tag is missing, append it to the function code --->
    <cfset generatedFunctionCode = generatedFunctionCode & "</cffunction>">
</cfif>



            <!--- Save the generated function to the database --->
            <cfquery datasource="#dsn#">
                UPDATE functions
                SET function_code = <cfqueryparam value="#generatedFunctionCode#" cfsqltype="cf_sql_longvarchar">,
                prompt = <cfqueryparam value="#generatedprompt#" cfsqltype="cf_sql_longvarchar">
                WHERE id = <cfqueryparam value="#getSelectFunctions.function_id#" cfsqltype="cf_sql_integer">
            </cfquery>


            <cfoutput>Function for #getSelectFunctions.qry_table# saved successfully.<br></cfoutput>
        <cfelse>
            <cfoutput>Error generating function for #getSelectFunctions.qry_table#.<br></cfoutput>
        </cfif>
    <cfelse>
        <cfoutput>Error calling ChatGPT API: Invalid JSON response.<br></cfoutput>
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
