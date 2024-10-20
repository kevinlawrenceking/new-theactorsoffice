<cfcomponent displayname="TicketsLogTableService" hint="Handles operations for TicketsLogTable table" output="false" > 
<cffunction name="insertticketslog" access="public" returntype="numeric">
    <cfargument name="tlogDetails" type="string" required="true">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="ticketid" type="numeric" required="false" default="">
    <cfargument name="ticketstatus" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="false" default=false>

    <cfset var result = 0>
    <cfset var sql = "INSERT INTO ticketslog_tbl (tlogDetails, userID, tlogTimestamp, IsDeleted, ticketid, ticketstatus) VALUES (?, ?, CURRENT_TIMESTAMP, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.tlogDetails#" cfsqltype="CF_SQL_LONGVARCHAR">
            <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.ticketid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.ticketid)#">
            <cfqueryparam value="#arguments.ticketstatus#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketstatus)#">
        </cfquery>
        <cfset result = insertResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error in insertticketslog: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or an appropriate error code if needed --->
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
