
<!--- Set the request timeout to handle long-running processes --->
<cfsetting requestTimeout="9000">
<cfset dsn="abod" />
<cfset dbug = "Y" />

<!--- Track the start time of the script --->
<cfset startTime = getTickCount()>

<!--- API Key remains as is, as requested --->
<cfset apiKey = "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">

<!--- Query to fetch functions that need code review and correction --->
<cfquery name="getSelectFunctions" datasource="#dsn#" maxrows="25">
    SELECT f.id as function_id, f.function_name, f.function_code, f.function_code_final
    FROM functions f
    INNER JOIN components c ON c.id = f.component_id
    WHERE f.function_code <> '' 
    AND f.function_code IS NOT NULL 
    AND f.function_code_final IS NULL
</cfquery>

<!--- Loop through the retrieved functions --->
<cfloop query="getSelectFunctions">

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

    <!--- Generate the prompt for the ChatGPT API, including the existing function code --->
    <cfsavecontent variable="generatedPrompt">
        <cfoutput>
       <html>
    <body>
        <h2>Goal:</h2>
        <p>Review and enhance the provided ColdFusion function to meet the following requirements based on best practices for dynamic SQL construction, error handling, and optimized database interaction.</p>

        <h3>Function Details:</h3>
        <p>The function should be refined with the following considerations:</p>
        <ul>
            <li><strong>Ensure Secure Parameterization:</strong> 
                <ul>
                    <li>Implement parameterized queries using <code>cfqueryparam</code> with <code>?</code> placeholders to avoid SQL injection.</li>
                    <li>Loop through parameters efficiently to ensure secure binding of values, and avoid direct concatenation of user input in the SQL statements.</li>
                    <li>Use the appropriate <code>cfqueryparam</code> data types as specified by the column schema details to ensure compatibility with the database.k</li>
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
                    <li>Ensure that the error handling gracefully handles both SQL-related errors and logical errors in the ColdFusion function.</li>
                </ul>
            </li>

            <li><strong>SQL Statement Optimization:</strong>
                <ul>
                    <li>Refine the SQL statement construction to ensure it's concise and optimized, avoiding unnecessary clauses or logic.</li>
                    <li>Move the <code>ORDER BY</code> clause to the ColdFusion function to take advantage of database-level sorting, ensuring efficient query execution.</li>
                    <li>Allow the <code>ORDER BY</code> clause to be dynamically controlled by the fetch page when required for additional flexibility.</li>
                </ul>
            </li>

            <li><strong>DataSource and Code Readability:</strong>
                <ul>
                    <li>Ensure that the DataSource variable is properly set to use <code>##DSN##</code> for database interactions.</li>
                    <li>Improve code readability by following consistent naming conventions and clean code practices.</li>
                    <li>Ensure that the function follows clear logic with comments <!--- coldfusion style ---> for important steps.</li>
                </ul>
            </li>

            <li><strong>Additional Considerations for Flexibility:</strong>
                <ul>
                    <li>Design the function to allow future enhancements, such as additional filtering options or sorting logic.</li>
                    <li>Ensure that the SQL query construction can handle new columns being added without requiring a complete function rewrite.</li>
                </ul>
            </li>

            <h3>Data Type Mapping Considerations:</h3>
            <p>The function should use a helper method to dynamically determine the <code>cf_sqltype</code> based on the data type of each argument, rather than hardcoding it as <code>cf_sql_varchar</code>. Use a mapping strategy that aligns with the schema information to ensure accurate SQL type binding.</p>

<p>Use the provided table schema information to ensure that each parameter's data type is handled accurately in the query using <code>cfqueryparam</code>. If possible, dynamically determine the correct <code>cfsqltype</code> based on the database schema.</p>
<p>Ensure that the function dynamically determines the <code>cf_sqltype</code> for each column by using a data type mapping from the schema or a reference table (e.g., <code>cfqueryparam_matrix</code>). The function should not hardcode <code>cf_sql_varchar</code>; instead, it should correctly use the data type associated with each column.</p>

<h3>Validation for Order By Clause:</h3>
<p>Ensure that the <code>ORDER BY</code> clause is only applied if the column name is validated against a whitelist of safe columns to prevent SQL injection vulnerabilities.</p>
<p>The <code>ORDER BY</code> clause should only allow column names that are explicitly listed in a safe whitelist of valid columns. This will help prevent SQL injection attacks and ensure that only known columns are used for sorting.</p>

<h3>Edge Case Handling:</h3>
<p>Consider scenarios where no valid conditions are provided in the query and ensure that the function returns an empty dataset instead of executing an unfiltered query.</p>

<h3>Error Logging Enhancements:</h3>
<p>Improve error handling by logging comprehensive error messages and details using <code>cflog</code> with both the error message and the stack trace information to aid in debugging.</p>
<p>The function should include comprehensive error handling and logging to capture not only the error message but also detailed information about what caused the error. Use <code>cfcatch</code> to log errors with <code>cflog</code> for better traceability.</p>
<p>Include the SQL query in the error log to assist with debugging in case of failures. Use a <code>cftry</code>/<code>cfcatch</code> block to log both the error message and detailed information in the <code>cflog</code>.</p>

<h3>Validation for WHERE and ORDER BY Clauses:</h3>
<p>Ensure that both the <code>WHERE</code> and <code>ORDER BY</code> clauses only use valid columns as specified in a whitelist to prevent SQL injection attacks. The function should validate that columns in the <code>args</code> struct and the <code>sortColumn</code> argument exist in this whitelist before adding them to the SQL statement.</p>

 

        </ul>


        <h3>Instructions:</h3>
        <p>Please analyze and modify the provided ColdFusion function according to the above requirements. Ensure that it follows best practices for SQL query construction, parameter binding, and error handling, while maintaining the function's original purpose of data retrieval. Make sure that the use of the <code>ORDER BY</code> clause is optimally placed based on performance considerations.</p>

        <h3>Important Notes:</h3>
        <ul>
            <li>Do NOT add a component tag. Just the function.</li>
            <li>The output should only include the corrected ColdFusion function code, without additional explanations or comments.</li>
            <li>Ensure that all code follows the standards mentioned in the guidelines, using ColdFusion style comments <code>&lt;!--- coldfusion style ---&gt;</code>.</li>
            <li>Do not add any <code>&lt;pre&gt;</code> tags or other HTML elements around the code block.</li>
            <li>Make sure the function handles all edge cases, including null or empty arguments, and builds the SQL query accordingly.</li>
            <li>Correct any syntax errors and make the DataSource variable <code>##DSN##</code> where applicable.</li>
            <li>Ensure that the use of parameterized queries is consistent and secure, and that <code>cfqueryparam</code> types match the data types in the schema details provided.</li>
      <li>NOTHING except the code [no verbose]. There should be nothing before or after the function code.</li>
        </ul>

                <h3>Existing Function Code:</h3>
                <pre>
                    <code>#xmlFormat(getSelectFunctions.function_code)#</code>
                </pre>

                <cfif schemas.recordcount is not "0">
                    <h3>Table Column Details:</h3>
                    <p>Below is the schema information for the relevant table(s) used in this function:</p>
                    #columnDetails#
                    <p>Use the above table schema information to ensure proper handling of each column's data type, nullability, and constraints. This information should guide how you construct SQL statements and use <code>cfqueryparam</code> types.</p>
                </cfif>

                <h3>Instructions:</h3>
                <p>Please analyze and modify the provided ColdFusion function according to the above requirements. Ensure that it follows best practices for SQL query construction, parameter binding, and error handling, while maintaining the function's original purpose of data retrieval.</p>
            </body>
        </html>
        </cfoutput>
    </cfsavecontent>

    <!--- Build the payload for the API call --->
    <cfset payload = {
        "model": "gpt-4o-2024-08-06",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant that reviews and corrects ColdFusion functions."},
            {"role": "user", "content": generatedPrompt}
        ],
        "max_tokens": 5000,
        "temperature": 0.3,
        "top_p": 0.8,
        "frequency_penalty": 0.2,
        "presence_penalty": 0.2,
        "stop": ["</cffunction>"]
    }>

    <!--- Call ChatGPT API with proper headers and API key --->
    <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="httpResponse" timeout="9000" charset="utf-8">
        <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#serializeJSON(payload)#">
    </cfhttp>

    <!--- Deserialize the JSON response --->
    <cfset responseData = deserializeJSON(httpResponse.fileContent)>

    <!--- Use cftry/cfcatch block for error handling during function correction --->
    <cftry>
        <cfif structKeyExists(responseData, "choices")>
            <cfset correctedFunctionCode = responseData.choices[1].message.content>

            <!--- Remove backticks from the response --->
            <cfset correctedFunctionCode = replace(correctedFunctionCode, "```coldfusion", "", "all")>
            <cfset correctedFunctionCode = replace(correctedFunctionCode, "```", "", "all")>

            <!--- Replace placeholder for datasource --->
            <cfset correctedFunctionCode = replace(correctedFunctionCode, "yourDataSourceName", "abod", "all")>

            <!--- Update the corrected function code into the database --->
            <cfquery datasource="#dsn#">
                UPDATE functions
                SET function_code_final = <cfqueryparam value="#correctedFunctionCode#</cffunction>" cfsqltype="cf_sql_longvarchar">,
                    prompt = <cfqueryparam value="#generatedPrompt#" cfsqltype="cf_sql_longvarchar">
                WHERE id = <cfqueryparam value="#getSelectFunctions.function_id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfoutput>Function for #getSelectFunctions.function_name# optimized.<br></cfoutput>
        <cfelse>
            <cfoutput>Error correcting function for #getSelectFunctions.function_name#.<br></cfoutput>
        </cfif>
    <cfcatch>
<cflog file="error" text="Error in correcting function: #cfcatch.message# Detail: #cfcatch.detail#">
        <cfoutput>Error: #cfcatch.message# - #cfcatch.detail#<br></cfoutput>
    </cfcatch>
</cftry>
</cfloop>

<!--- Calculate and display total processing time --->
<cfset endTime = getTickCount()>
<cfset timeTakenMilliseconds = endTime - startTime>
<cfset timeTakenMinutes = timeTakenMilliseconds / 1000 / 60>
<cfoutput>
    Time taken to process: #timeTakenMinutes# minutes
</cfoutput>
