<cfsetting requestTimeout="900">


<!--- Step 1: Query the Functions Table --->
<cfquery name="functionList" datasource="abod" maxrows="50">
SELECT f.id, f.function_code, t.qry_details, f.function_name
    FROM functions f
    INNER JOIN tao_files t ON t.function_id = f.id
    WHERE 
       f.function_code_final IS NULL
</cfquery>
<cfset apikey = "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" />
<!--- Step 2: Query Data Type Mapping Matrix --->
<cfquery name="getParamTypes" datasource="abod">
    SELECT data_type, cf_param_type 
    FROM cfqueryparam_matrix;
</cfquery>

<!--- Step 3: Create HTML Table for Data Type Mapping Matrix --->
<cfsavecontent variable="matrix">
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Data Type</th>
        <th>CF Param Type</th>
    </tr>
    <cfoutput query="getParamTypes">
        <tr>
            <td>#getParamTypes.data_type#</td>
            <td>#getParamTypes.cf_param_type#</td>
        </tr>
    </cfoutput>
</table>
</cfsavecontent>

<!--- Step 4: Loop through Each Record in functionList --->
<cfloop query="functionList">
    <cfsavecontent variable="generatedPrompt"><cfoutput>
    <html>
    <body>
        <h2>Goal:</h2>
        <p>Generate a ColdFusion function that dynamically recreates a query-based function based on the details of the query below. [NO VERBOSE]. No other additional text, just the code.</p>
        <p><strong>Query:</strong> <pre>#functionList.qry_details#</pre></p>
        <h3>Function Details:</h3>
        <ul>
            <li><strong>Use Existing Query Structure:</strong>
                <ul>
                    <li>Retrieve the structure, columns, and conditions of a previously executed query to dynamically build a ColdFusion function specific to that query.</li>
                    <li>The generated function should include the same fields, view or table source, and conditions as the previous query</li>
                    <li>Ensure that any <code>ORDER BY</code> or grouping clauses from the previous query are respected and implemented in the new function.</li>
                </ul>
            </li>
            <li><strong>Parameterization and Secure Query Execution:</strong>
                <ul>
                    <li>Implement parameterized queries using <code>cfqueryparam</code> with <code>?</code> placeholders to avoid SQL injection.</li>
                    <li>Loop through parameters to secure binding of values based on the previous query's <code>WHERE</code> clauses, avoiding direct concatenation of user input in SQL statements.</li>
                    <li>Use the appropriate <code>cfqueryparam</code> data types dynamically based on the column types found in the previous query to ensure compatibility with the database.</li>
                </ul>
            </li>
            <h3>Data Type Mapping Matrix:</h3>
            #matrix#
            <li><strong>Dynamic SQL Query Construction:</strong>
                <ul>
                    <li>Maintain a clear and structured approach to building dynamic SQL queries with <code>WHERE</code> clauses based on arguments provided, matching the previous query's conditions.</li>
                    <li>When no conditions are passed, avoid executing an unfiltered query, and consider returning an empty query set instead.</li>
                </ul>
            </li>
            <li><strong>Error Handling and Logging:</strong>
                <ul>
                    <li>Include a <code>cftry</code>/<code>cfcatch</code> block to gracefully handle errors and log them with detailed information about the query and parameters.</li>
                    <li>Use <code>cflog</code> in the <code>cfcatch</code> block to capture necessary details for debugging.</li>
                </ul>
            </li>
            <li><strong>SQL Optimization:</strong>
                <ul>
           
                    <li>Optimize the query by avoiding unnecessary clauses or logic, following the structure of the original query.</li>
                </ul>
            </li>
            <li><strong>Data Type Mapping:</strong>
                <p>The function should dynamically determine the <code>cf_sqltype</code> based on the data types found in the previous query's schema, aligning with its structure to ensure accurate SQL type binding.</p>
            </li>
            <li><strong>Validation for WHERE and ORDER BY Clauses:</strong>
                <p>Ensure that both clauses only use valid columns specified in the previous query, following a whitelist approach to prevent SQL injection attacks.</p>
            </li>
        </ul>
    </body>
    </html>
    </cfoutput></cfsavecontent>

    <!--- Step 5: API Call to OpenAI --->
 
    <cfset payload = {
        "model": "gpt-4o-2024-08-06",
        "messages": [
            {"role": "system", "content": "You are an expert ColdFusion developer that reviews and corrects code."},
            {"role": "user", "content": generatedPrompt}
        ],
        "max_tokens": 5000,
        "temperature": 0.3,
        "top_p": 0.8,
        "frequency_penalty": 0.2,
        "presence_penalty": 0.2
    }>
    
    <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="httpResponse" timeout="60" charset="utf-8">
        <cfhttpparam type="header" name="Authorization" value="Bearer #apikey#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#serializeJSON(payload)#">
    </cfhttp>

    <!--- Step 6: Process OpenAI Response --->
    <cfset responseData = deserializeJSON(httpResponse.fileContent)>
    <cfif structKeyExists(responseData, "choices") AND arrayLen(responseData.choices) GT 0>
        <cfset generatedFunctionCode = responseData.choices[1].message.content>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```coldfusion", "", "all")>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```", "", "all")>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "yourDataSourceName", "abod", "all")>
        
        <!--- Step 7: Update functions Table with Generated Code --->
        <cfquery datasource="abod">
            UPDATE functions
            SET function_code_final = <cfqueryparam value="#generatedFunctionCode#" cfsqltype="cf_sql_longvarchar">
            WHERE id = <cfqueryparam value="#functionList.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cfif>
</cfloop>
