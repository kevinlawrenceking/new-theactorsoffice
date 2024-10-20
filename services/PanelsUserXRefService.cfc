<cfcomponent displayname="PanelsUserXRefService" hint="Handles operations for PanelsUserXRef table" output="false" > 
<cffunction name="deletepgpanels_user_xref" access="public" returntype="boolean">
    <cfargument name="conditions" type="struct" required="true">
    <cfset var sql = "DELETE FROM pgpanels_user_xref WHERE 1=1">
    <cfset var hasConditions = false>
    <cfset var conditionSql = "">

    <!--- Build dynamic WHERE clause based on provided conditions --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("column1,column2,column3", key)>
            <cfset conditionSql &= " AND `#key#` = ?">
            <cfset hasConditions = true>
        </cfif>
    </cfloop>

    <!--- If no valid conditions are provided, return false --->
    <cfif NOT hasConditions>
        <cfreturn false>
    </cfif>

    <!--- Combine base SQL with dynamic conditions --->
    <cfset sql &= conditionSql>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.conditions#" item="key">
                <cfif listFindNoCase("column1,column2,column3", key)>
                    <cfqueryparam value="#arguments.conditions[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.conditions[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Return true if the delete operation is successful --->
        <cfreturn true>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in deletepgpanels_user_xref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return false on error --->
            <cfreturn false>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- Added missing closing tag for cfargument.
--->

<cffunction name="insertpgpanels_user_xref" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO pgpanels_user_xref (
                -- Add column names here
            ) VALUES (
                -- Add cfqueryparam for each column value here
            )
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error in insertpgpanels_user_xref: #cfcatch.message# Details: #cfcatch.detail#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cfargument.
--->
</cfcomponent>
