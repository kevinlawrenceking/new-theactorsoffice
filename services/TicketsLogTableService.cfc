<cfcomponent displayname="TicketsLogTableService" hint="Handles operations for TicketsLogTable table" output="false"> 
<cffunction name="INSticketslog" access="public" returntype="void">
    <cfargument name="new_tlogDetails" type="string" required="true">
    <cfargument name="new_ticketid" type="numeric" required="true">
    <cfargument name="new_ticketstatus" type="string" required="true">

    <cfquery>
        INSERT INTO ticketslog_tbl (tlogDetails, userID, ticketid, ticketstatus)
        VALUES (
            <cfqueryparam value="#arguments.new_tlogDetails#" cfsqltype="cf_sql_varchar" />,
            <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer" />,
            <cfqueryparam value="#arguments.new_ticketid#" cfsqltype="cf_sql_integer" />,
            <cfqueryparam value="#arguments.new_ticketstatus#" cfsqltype="cf_sql_varchar" />
        )
    </cfquery>
</cffunction></cfcomponent>