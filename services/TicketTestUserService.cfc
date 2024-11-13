<cfcomponent displayname="TicketTestUserService" hint="Handles operations for TicketTestUser table" output="false"> 
<cffunction name="SELtickettestusers" access="public" returntype="query">
    <cfargument name="recid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM tickettestusers 
        WHERE ticketid = <cfquery result="result" param value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER"> 
          AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="INStickettestusers" access="public" returntype="void">
    <cfargument name="new_ticketid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_teststatus" type="string" required="true">
    <cfargument name="new_rejectnotes" type="string" required="true">

    <cfquery result="result" >
        INSERT INTO tickettestusers (ticketid, userid, teststatus, rejectNotes)
        VALUES (
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.new_ticketid#" />,
            <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.new_userid#" />,
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.new_teststatus#" />,
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.new_rejectnotes#" />
        )
    </cfquery>
</cffunction>
<cffunction name="UPDtickettestusers" access="public" returntype="void">
    <cfargument name="new_teststatus" type="string" required="true">
    <cfargument name="new_rejectnotes" type="string" required="true">
    <cfargument name="testid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE tickettestusers 
        SET 
            teststatus = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.new_teststatus#" />, 
            rejectnotes = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.new_rejectnotes#" />
        WHERE 
            id = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.testid#" />
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
            tu.ticketid = <cfquery result="result" param value="#arguments.ticketId#" cfsqltype="CF_SQL_INTEGER"> 
            AND tu.userid <> <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
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
            tu.ticketid = <cfquery result="result" param value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER"> 
            AND tu.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>