<cfquery name="functionList" datasource="abod" maxrows="10">
    SELECT id, function_code
    FROM functions
    WHERE function_code IS NOT NULL
      AND function_code <> ''
      AND function_code_final IS NULL
</cfquery>

<cfloop query="functionList">
    <cfsavecontent variable="prompt">
        <html>
        <body>
            <h2>Goal:</h2>
            <p>Review the provided ColdFusion function code to identify and correct any syntax errors. The focus is strictly on resolving issues that would cause the function to fail to execute properly. Do not modify the logic or structure of the code unless necessary for it to run without errors.</p>
<p>[NO VERBOSE] - do not write anything but the code.</p>
            <h3>Instructions:</h3>
            <ul>
                <li>Review the existing ColdFusion function code for syntax errors.</li>
                <li>Correct only those issues that would cause the function to fail to run or produce errors.</li>
                <li>If any changes are made, include a &lt;!--- comment ---&gt; at the bottom of the code that explains the specific corrections or improvements in standard ColdFusion comment style.</li>
            </ul>

            <h3>Function Code to Review:</h3>
            <Cfoutput>#functionList.function_code#</Cfoutput> 

            <h3>Expected Output:</h3>
            <p>The corrected ColdFusion function code with a comment section at the bottom (if changes are made) explaining the corrections performed.</p>

            <p><strong>Example of the Comment Section:</strong></p>
             
                &lt;!--- Changes made:
                - Corrected missing closing tag for cffunction.
                - Fixed mismatched variable references to ensure proper execution.
                ---&gt;
             
        </body>
        </html>
    </cfsavecontent>


    <cfset payload = {
        "model": "gpt-4o-2024-08-06",
        "messages": [
            {"role": "system", "content": "You are an expert ColdFusion developer that reviews and corrects code."},
            {"role": "user", "content": prompt}
        ],
        "max_tokens": 5000,
        "temperature": 0.3,
        "top_p": 0.8,
        "frequency_penalty": 0.2,
        "presence_penalty": 0.2
    }>
        
        
        <cfset payloadString = serializeJSON(payload)>
<cfoutput>payload:#payloadString#</cfoutput>

    <cftry>
        <cfhttp method="POST" url="https://api.openai.com/v1/chat/completions" result="httpResponse" timeout="60" charset="utf-8">
            <cfhttpparam type="header" name="Authorization" value="Bearer #apiKey#">
            <cfhttpparam type="header" name="Content-Type" value="application/json">
            <cfhttpparam type="body" value="#serializeJSON(payload)#">
        </cfhttp>
        <cfcatch type="any">
            <cflog file="api_errors" text="Error in API Call: #cfcatch.message#">
            <cfoutput>Error in API Call: #cfcatch.message#</cfoutput>
        </cfcatch>
    </cftry>
                <cfoutput>RESPONSE: #httpResponse.fileContent#</cfoutput>

    <cfset responseData = deserializeJSON(httpResponse.fileContent)>
    <cfif structKeyExists(responseData, "choices")>
        <cfset generatedFunctionCode = responseData.choices[1].message.content>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```coldfusion", "", "all")>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "```", "", "all")>
        <cfset generatedFunctionCode = replace(generatedFunctionCode, "yourDataSourceName", "abod", "all")>

        <cfquery datasource="abod">
            UPDATE functions
            SET function_code_final = <cfqueryparam value="#generatedFunctionCode#" cfsqltype="cf_sql_longvarchar">
            WHERE id = <cfqueryparam value="#functionList.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cfif>

    <Cfoutput>#prompt#</Cfoutput>
</cfloop>
