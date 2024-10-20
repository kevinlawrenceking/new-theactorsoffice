<cfsetting requestTimeout="9000">
<Cfset dbug = "Y" />
 
<cfset startTime = getTickCount()>

<cfquery name="getSelectFunctions" datasource="abod" maxrows="1">
    SELECT f.id as function_id, f.function_name, f.function_code, f.function_code_final
    FROM  functions f 
    INNER JOIN components c ON c.id = f.component_id
    WHERE f.function_code <> '' and f.function_code IS not null 
    AND f.function_code_final IS NULL
</cfquery>


<cfloop query="getSelectFunctions">

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
                <li>Correct any syntax errors</li>
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
<cfoutput><Cfdump var="#httpResponse#"></cfoutput><BR><Cfabort>
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

  
        <cfoutput>Function for #getSelectFunctions.function_name# optimized.<br></cfoutput>

    <cfelse>
     
        <cfoutput>Error correcting function for #getSelectFunctions.function_name#.<br></cfoutput>
    </cfif>

</cfloop>

<!-- Output total processing time -->
<cfset endTime = getTickCount()>
<cfset timeTakenMilliseconds = endTime - startTime>
<cfset timeTakenMinutes = timeTakenMilliseconds / 1000 / 60>
<cfoutput>
    Time taken to process: #timeTakenMinutes# minutes
</cfoutput>
