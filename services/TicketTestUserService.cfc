<cfcomponent displayname="TicketTestUserService" hint="Handles operations for TicketTestUser table" output="false"> 
<cffunction name="SELtickettestusers" access="public" returntype="query">
    <cfargument name="recid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM tickettestusers 
        WHERE ticketid = <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER"> 
          AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="INStickettestusers" access="public" returntype="void">
    <cfargument name="new_ticketid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_teststatus" type="string" required="true">
    <cfargument name="new_rejectnotes" type="string" required="true">

    <cfquery>
        INSERT INTO tickettestusers (ticketid, userid, teststatus, rejectNotes)
        VALUES (
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_ticketid#" />,
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_userid#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_teststatus#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_rejectnotes#" />
        )
    </cfquery>
</cffunction>
<cffunction name="UPDtickettestusers" access="public" returntype="void">
    <cfargument name="new_teststatus" type="string" required="true">
    <cfargument name="new_rejectnotes" type="string" required="true">
    <cfargument name="testid" type="numeric" required="true">

    <cfquery>
        UPDATE tickettestusers 
        SET 
            teststatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_teststatus#" />, 
            rejectnotes = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_rejectnotes#" />
        WHERE 
            id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.testid#" />
    </cfquery>
</cffunction>
<cffunction name="SELtickettestusers_24474" access="public" returntype="query">
    <cfargument name="ticketId" type="numeric" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
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

    <cfreturn result>
</cffunction>
<cffunction name="SELtickettestusers_24475" access="public" returntype="query">
    <cfargument name="recid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
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
    
    <cfreturn result>
</cffunction></cfcomponent>