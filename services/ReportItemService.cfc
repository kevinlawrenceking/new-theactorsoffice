<cfcomponent displayname="ReportItemService" hint="Handles operations for ReportItem table" output="false" > 
<cffunction name="deletereportitems" access="public" returntype="boolean">
    <cfargument name="itemid" type="numeric" required="true">
    <cfset var result = false>
    <cftry>
        <cfquery datasource="#DSN#">
            DELETE FROM reportitems
            WHERE itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" type="error" text="Error in deletereportitems: #cfcatch.message# Details: #cfcatch.detail#">
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>

<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->
<cffunction name="insertreportitems" access="public" returntype="numeric">
    <cfargument name="itemid" type="numeric" required="true">
    <cfargument name="itemLabel" type="string" required="false" default="">
    <cfargument name="itemOrderNo" type="numeric" required="false" default="">
    <cfargument name="itemValueInt" type="numeric" required="false" default="">
    <cfargument name="ID" type="numeric" required="false" default="">
    <cfargument name="itemDataset" type="string" required="false" default="">
    <cfargument name="userid" type="numeric" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO reportitems (
                itemid, itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid
            ) VALUES (
                <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.itemLabel#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.itemLabel)#">,
                <cfqueryparam value="#arguments.itemOrderNo#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.itemOrderNo)#">,
                <cfqueryparam value="#arguments.itemValueInt#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.itemValueInt)#">,
                <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.ID)#">,
                <cfqueryparam value="#arguments.itemDataset#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.itemDataset)#">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error in insertreportitems: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO reportitems (itemid, itemLabel, itemOrderNo, itemValueInt, ID, itemDataset, userid) VALUES (?, ?, ?, ?, ?, ?, ?)">
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getreportitems" access="public" returntype="query">
    <cfargument name="newpnids" type="string" required="true">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var result = "">
    <cfset var sql = "">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "reportid,itemid,itemOrderNo,itemValueInt,userid,itemLabel,itemDataset">

    <cftry>
        <!--- Construct the SQL query --->
        <cfset sql = "SELECT reportid, itemid, itemOrderNo, itemValueInt, userid, itemLabel, itemDataset FROM vm_reportitems_reports_user WHERE 1=1">

        <!--- Add conditions to WHERE clause --->
        <cfif len(arguments.newpnids)>
            <cfset arrayAppend(whereClause, "reportid IN (#arguments.newpnids#)")>
        </cfif>

        <!--- Append dynamic WHERE clauses --->
        <cfif arrayLen(whereClause)>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(arguments.orderBy) AND listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
        </cfquery>

        <!--- Catch and log any errors --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getreportitems: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("reportid,itemid,itemOrderNo,itemValueInt,userid,itemLabel,itemDataset", "integer,integer,integer,integer,integer,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Removed backticks around `#arguments.orderBy#` in the ORDER BY clause as they are not necessary in ColdFusion.
--->

<cffunction name="updatereportitems" access="public" returntype="boolean">
    <cfargument name="itemid" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    
    <cfset var sql = "UPDATE reportitems SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "itemLabel,itemOrderNo,itemValueInt,ID,userid,itemDataset">
    <cfset var success = false>

    <cftry>
        <!--- Build SET clause dynamically based on provided data --->
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- If there are no valid columns to update, return false --->
        <cfif arrayLen(setClauses) EQ 0>
            <cfreturn false>
        </cfif>

        <!--- Construct the final SQL statement --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE itemid = ?">

        <!--- Execute the update query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#evaluate("CF_SQL_" & uCase(listLast(listGetAt(validColumns, listFindNoCase(validColumns, key), ","))) )#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no error occurs, set success to true --->
        <cfset success = true>

        <!--- Error handling and logging --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating reportitems: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the success status --->
    <cfreturn success>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cftry.
--->
</cfcomponent>
