<cfsetting requestTimeout="9000">
<cfsetting requestTimeout="9000">
<Cfset dbug = "Y" />
<!--- Start timing the script ---> 
<cfset startTime = getTickCount()>

<!-- Fetch functions that need validation and correction -->
<cfquery name="getSelectFunctions" datasource="abod" maxrows="5">
    SELECT t.id, f.id as function_id, f.function_name, f.component_id, f.qry_type, 
           f.returntype, f.hint, c.component_name, c.related_table, 
           t.qry_table, t.qry_view, t.qry_details, t.qry_name, f.function_code
    FROM tao_files t 
    INNER JOIN functions f ON f.id = t.function_id 
    INNER JOIN components c ON c.id = f.component_id
    WHERE t.qry_type = 'sel' 
    AND t.qry_source = 'view' 
    and f.function_code <> '' and f.function_code IS not null 
    AND f.function_code_final IS NULL
</cfquery>

<!-- Loop through each function -->
<cfloop query="getSelectFunctions">
    
    <!-- Build the review and correction prompt -->
    <cfsavecontent variable="generatedPrompt"><cfoutput>
    <html>
        <body>
            <p><strong>Goal:</strong> Review and validate the following ColdFusion function to ensure it follows best practices for SQL query building, dynamic parameter handling, and error management.</p>
            
            <p><strong>Function:</strong></p>
            <pre>#getSelectFunctions.function_code#</pre>
            
            <p><strong>Things to check:</strong></p>
            <ul>

                <li>Don't reply with anything else than the function code [no verbose]</li>
                    <li>Don't add a pre tag</li>
                <li>Ensure argument names are consistent throughout the function (e.g., use consistent camelCase for all argument names).</li>
                <li>Ensure there are no overlapping argument names, especially for similar variations like `systemID` or `userid`.</li>
                <li>Make sure the SQL parameters are passed securely using `cfqueryparam` with correct `cf_sqltype`.</li>
                <li>Verify that the dynamic `WHERE` clause is correctly appending conditions based on arguments passed, using `AND` for multiple conditions.</li>
                <li>If no arguments are passed, the SQL query should not have an empty `WHERE` clause.</li>
                <li>Check the placement of `ORDER BY` clauses and remove any redundant clauses.</li>
                <li>Handle nullable arguments appropriately using `cfqueryparam` with the `null` attribute when needed.</li>
                <li>Ensure that no part of the SQL query has redundant conditions or overlapping parameters.</li>
                <li>Check if `cftry/cfcatch` is implemented correctly for error handling, logging the necessary details and returning structured errors.</li>
            </ul>
            <p>Please correct any inconsistencies or errors you find in the function code.</p>

            <p>[NO VERBOSE]</p>
        </body>
    </html>
    </cfoutput></cfsavecontent>

    <!-- Build the payload for the API call -->
    <cfset payload = {
        "model": "gpt-4",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant that reviews and corrects ColdFusion functions."},
            {"role": "user", "content": generatedPrompt}
        ],
        "max_tokens": 800,
        "temperature": 0.3
    }>

    <!-- Call ChatGPT API -->
    <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="httpResponse" timeout="9000" charset="utf-8">
        <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#serializeJSON(payload)#">
    </cfhttp>

    <!-- Deserialize the response -->
    <cfset responseData = deserializeJSON(httpResponse.fileContent)>

    <!-- Check if the response contains function corrections -->
    <cfif structKeyExists(responseData, "choices")>
        <cfset correctedFunctionCode = responseData.choices[1].message.content>

        <!-- Clean up the corrected function code -->
        <cfset correctedFunctionCode = replace(correctedFunctionCode, "```coldfusion", "", "all")>
        <cfset correctedFunctionCode = replace(correctedFunctionCode, "```", "", "all")>

        <!-- Update the corrected function code into the 'function_code_final' field -->
        <cfquery datasource="abod">
            UPDATE functions
            SET function_code_final = <cfqueryparam value="#correctedFunctionCode#" cfsqltype="cf_sql_longvarchar">
            WHERE id = <cfqueryparam value="#getSelectFunctions.function_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!-- Mark the function as processed -->
        <cfquery datasource="abod">
            UPDATE tao_files
            SET isfetch = 1
            WHERE id = <cfqueryparam value="#getSelectFunctions.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!-- Output success for debugging purposes -->
        <cfoutput>Function for #getSelectFunctions.qry_view# processed successfully.<br></cfoutput>

    <cfelse>
        <!-- Output error message if no function correction was provided -->
        <cfoutput>Error correcting function for #getSelectFunctions.qry_view#.<br></cfoutput>
    </cfif>

</cfloop>

<!-- Output total processing time -->
<cfset endTime = getTickCount()>
<cfset timeTakenMilliseconds = endTime - startTime>
<cfset timeTakenMinutes = timeTakenMilliseconds / 1000 / 60>
<cfoutput>
    Time taken to process: #timeTakenMinutes# minutes
</cfoutput>
