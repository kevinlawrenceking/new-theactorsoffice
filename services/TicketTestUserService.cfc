<cfcomponent displayname="TicketTestUserService" hint="Handles operations for TicketTestUser table" output="false"> 
<cffunction name="SELtickettestusers" access="public" returntype="query">
    <cfargument name="recid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM tickettestusers 
            WHERE ticketid = <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER"> 
              AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getTicketTestUsers: #cfcatch.message# - Query: SELECT * FROM tickettestusers WHERE ticketid = #arguments.recid# AND userid = #arguments.userid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INStickettestusers" access="public" returntype="void">
    <cfargument name="new_ticketid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_teststatus" type="string" required="true">
    <cfargument name="new_rejectnotes" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO tickettestusers (ticketid, userid, teststatus, rejectNotes)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_ticketid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_userid#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_teststatus#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_rejectnotes#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into tickettestusers: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDtickettestusers" access="public" returntype="void">
    <cfargument name="new_teststatus" type="string" required="true">
    <cfargument name="new_rejectnotes" type="string" required="true">
    <cfargument name="testid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE tickettestusers 
            SET 
                teststatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_teststatus#" />, 
                rejectnotes = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_rejectnotes#" />
            WHERE 
                id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.testid#" />
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating tickettestusers: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the ticket test users." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELtickettestusers_24474" access="public" returntype="query">
    <cfargument name="ticketId" type="numeric" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                tu.id, 
                tu.ticketid, 
                tu.userid, 
                u.recordname, 
                tu.teststatus, 
                tu.rejectnotes 
            FROM 
                tickettestusers tu 
            INNER JOIN 
                taousers u ON u.userid = tu.userid 
            WHERE 
                tu.ticketid = <cfqueryparam value="#arguments.ticketId#" cfsqltype="CF_SQL_INTEGER"> 
                AND tu.userid <> <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getTicketTestUsers: #cfcatch.message#">
            <cfset result = queryNew("id,ticketid,userid,recordname,teststatus,rejectnotes")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELtickettestusers_24475" access="public" returntype="query">
    <cfargument name="recid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                tu.id, 
                tu.ticketid, 
                tu.userid, 
                u.recordname, 
                tu.teststatus, 
                tu.rejectnotes 
            FROM 
                tickettestusers tu 
            INNER JOIN 
                taousers u ON u.userid = tu.userid 
            WHERE 
                tu.ticketid = <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER"> 
                AND tu.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getTicketTestUsers: #cfcatch.message# - Query: SELECT tu.id, tu.ticketid, tu.userid, u.recordname, tu.teststatus, tu.rejectnotes FROM tickettestusers tu INNER JOIN taousers u ON u.userid = tu.userid WHERE tu.ticketid = #arguments.recid# AND tu.userid = #arguments.userid#">
            <cfreturn queryNew("id,ticketid,userid,recordname,teststatus,rejectnotes")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
