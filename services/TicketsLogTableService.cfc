<cfcomponent displayname="TicketsLogTableService" hint="Handles operations for TicketsLogTable table" output="false"> 
<cffunction name="INSticketslog" access="public" returntype="void">
    <cfargument name="new_tlogDetails" type="string" required="true">
    <cfargument name="new_ticketid" type="numeric" required="true">
    <cfargument name="new_ticketstatus" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO ticketslog_tbl (tlogDetails, userID, ticketid, ticketstatus)
            VALUES (
                <cfqueryparam value="#arguments.new_tlogDetails#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.new_ticketid#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.new_ticketstatus#" cfsqltype="cf_sql_varchar" />
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into ticketslog_tbl: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting the ticket log." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
