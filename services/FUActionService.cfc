<cfcomponent displayname="FUActionService" hint="Handles operations for FUAction table" output="false" > 
<cffunction name="getfuactions" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="actionID">
    <cfset var sql = "SELECT actionID, actionNo, actionDaysNo, actionDaysRecurring, systemID, actionLinkID, actionDetails, actionTitle, navToURL, actionNotes, actionInfo, recordname, UniqueName, IsDeleted, IsUnique FROM fuactions_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">
    
    <!--- Define a whitelist of valid columns for ORDER BY clause --->
    <cfset var validOrderColumns = "actionID,actionNo,actionDaysNo,actionDaysRecurring,systemID,actionLinkID,actionDetails,actionTitle,navToURL,actionNotes,actionInfo,recordname,UniqueName,IsDeleted,IsUnique">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif structKeyExists(arguments.filters, key) and len(trim(arguments.filters[key]))>
            <cfif listFindNoCase("actionID,actionNo,actionDaysNo,actionDaysRecurring,systemID,actionLinkID", key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype="CF_SQL_INTEGER"})>
            <cfelseif listFindNoCase("actionDetails,actionTitle,navToURL,actionNotes,actionInfo,recordname,UniqueName", key)>
                <cfset arrayAppend(whereClause, "#key# LIKE ?")>
                <cfset arrayAppend(queryParams, {value="%#arguments.filters[key]#%", cfsqltype="CF_SQL_VARCHAR"})>
            <cfelseif listFindNoCase("IsDeleted", key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype="CF_SQL_BIT"})>
            </cfif>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses to SQL statement --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getfuactions: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with matching schema --->
            <cfset result = queryNew("actionID, actionNo, actionDaysNo, actionDaysRecurring, systemID, actionLinkID,
                                      actionDetails, actionTitle, navToURL,
                                      actionNotes, actionInfo,
                                      recordname,
                                      UniqueName,
                                      IsDeleted,
                                      IsUnique",
                                      "integer,
                                       integer,
                                       integer,
                                       integer,
                                       integer,
                                       integer,
                                       varchar,
                                       varchar,
                                       varchar,
                                       varchar,
                                       varchar,
                                       varchar,
                                       bit,
                                       bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No changes were necessary as the function code is syntactically correct.
--->

<cffunction name="getvm_fuactions_tbl_fuactions" access="public" returntype="query">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT actionid, actiondaysno, actiondaysrecurring FROM vm_fuactions_tbl_fuactions WHERE sitetypeid = ?">
    <cfset var whereClause = []>
    <cfset var validColumns = "actionid,actiondaysno,actiondaysrecurring">

    <cftry>
        <!--- Build dynamic WHERE clause based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append dynamic WHERE clauses if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Order by actionid for consistent results --->
        <cfif structKeyExists(arguments.filters, "orderBy") and listFindNoCase(validColumns, arguments.filters.orderBy)>
            <cfset result = queryAddRow(result)>
            <cfsort query="result" column="#arguments.filters.orderBy#" type="text" order="asc">
        </cfif>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getvm_fuactions_tbl_fuactions: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("actionid,actiondaysno,actiondaysrecurring", "integer,integer,integer")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
