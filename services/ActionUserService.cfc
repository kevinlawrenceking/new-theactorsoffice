<cfcomponent displayname="ActionUserService" hint="Handles operations for ActionUser table" output="false"> 

   <cffunction name="GetUserActions" access="public" returntype="query" output="false" hint="Retrieve actions for a specific user ID.">
        <cfargument name="userid" type="numeric" required="yes" hint="ID of the user to retrieve actions for.">

        <!--- Initialize the query variable --->
        <cfset var actions = "">

        <!--- Query to fetch user actions --->
        <cfquery name="actions" >
            SELECT 
                au.id,
                s.systemID,
                s.systemName,
                s.SystemType,
                s.SystemScope,
                s.SystemDescript,
                s.SystemTriggerNote,
                a.actionID,
                a.actionNo,
                a.actionDetails,
                a.actionTitle,
                a.navToURL,
                au.actionDaysNo,
                au.actionDaysRecurring,
                a.actionNotes,
                a.actionInfo
            FROM 
                fusystems s
                INNER JOIN fuactions a ON s.systemid = a.systemid
                INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE 
                au.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                a.actionNo
        </cfquery>

        <cfreturn actions>
    </cffunction>


<cffunction name="UPDactionusers" access="public" returntype="void" hint="Updates the isdeleted status of a user in the actionusers_tbl">
    <cfargument name="new_id" type="numeric" required="true" hint="ID of the user to be updated">

        <cfquery datasource="abod">
            UPDATE actionusers_tbl 
            SET isdeleted = 1 
            WHERE id = <cfqueryparam value="#arguments.new_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
</cffunction>

<cffunction name="UPDactionusers_23923" access="public" returntype="void">
    <cfargument name="new_id" type="numeric" required="true">

        <cfquery datasource="abod">
            UPDATE actionusers_tbl 
            SET isdeleted = 0 
            WHERE id = <cfqueryparam value="#arguments.new_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

</cffunction>
<cffunction name="UPDactionusers_24030" access="public" returntype="void">
    <cfargument name="actionDaysNo" type="numeric" required="true">
    <cfargument name="deleteaction" type="string" required="true">
    <cfargument name="actionDaysRecurring" type="string" required="true">
    <cfargument name="id" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var params = []>

        <cfset sql = "UPDATE actionusers_tbl SET actionDaysNo = ?">
        <cfset arrayAppend(params, {value=arguments.actionDaysNo, cfsqltype="CF_SQL_INTEGER"})>

        <cfif arguments.deleteaction eq "1">
            <cfset sql &= ", isdeleted = 1">
        </cfif>

        <cfif arguments.actionDaysRecurring neq "0" and arguments.actionDaysRecurring neq "">
            <cfset sql &= ", actionDaysRecurring = ?">
            <cfset arrayAppend(params, {value=arguments.actionDaysRecurring, cfsqltype="CF_SQL_VARCHAR"})>
        <cfelse>
            <cfset sql &= ", actionDaysRecurring = NULL">
        </cfif>

        <cfset sql &= " WHERE id = ?">
        <cfset arrayAppend(params, {value=arguments.id, cfsqltype="CF_SQL_INTEGER"})>

        <cfquery datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
</cffunction>
<cffunction name="UPDactionusers_24254" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="target_id_system" type="numeric" required="true">

        <cfquery datasource="abod">
            UPDATE actionusers_tbl 
            SET isdeleted = 1 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND actionid IN (
                SELECT actionid 
                FROM fuactions 
                WHERE systemid = <cfqueryparam value="#arguments.target_id_system#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
</cffunction>
<cffunction name="SELactionusers" access="public" returntype="query">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM actionusers 
            WHERE actionid = <cfqueryparam value="#arguments.actionid#" cfsqltype="CF_SQL_INTEGER"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
    
    <cfreturn result>
</cffunction>
<cffunction name="INSactionusers" access="public" returntype="void">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="actiondaysno" type="numeric" required="true">
    <cfargument name="actiondaysrecurring" type="string" required="false" default="">
    
        <cfquery datasource="abod">
            INSERT INTO actionusers_tbl (
                actionid, 
                userid, 
                actiondaysno
                <cfif arguments.actiondaysrecurring neq "">, actiondaysrecurring</cfif>, 
                IsDeleted
            ) VALUES (
                <cfqueryparam value="#arguments.actionid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.actiondaysno#" cfsqltype="CF_SQL_INTEGER">
                <cfif arguments.actiondaysrecurring neq "">, 
                    <cfqueryparam value="#arguments.actiondaysrecurring#" cfsqltype="CF_SQL_VARCHAR">
                </cfif>, 
                0
            )
        </cfquery>

</cffunction>
<cffunction name="SELactionusers_24454" access="public" returntype="query">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
 
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM actionusers 
            WHERE actionid = <cfqueryparam value="#arguments.actionid#" cfsqltype="CF_SQL_INTEGER"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

            <cflog file="application" text="Error in getActionUsers: #cfcatch.message# Query: SELECT * FROM actionusers WHERE actionid = ? AND userid = ? Parameters: #arguments.actionid#, #arguments.userid#">
            <cfreturn queryNew("")>

    
    <cfreturn result>
</cffunction>
<cffunction name="INSactionusers_24455" access="public" returntype="void">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="actiondaysno" type="numeric" required="true">
    <cfargument name="actiondaysrecurring" type="string" required="false" default="">

        <cfquery datasource="abod">
            INSERT INTO actionusers_tbl (actionid, userid, actiondaysno
            <cfif len(arguments.actiondaysrecurring) gt 0>, actiondaysrecurring</cfif>, IsDeleted)
            VALUES (
                <cfqueryparam value="#arguments.actionid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.actiondaysno#" cfsqltype="CF_SQL_INTEGER">
                <cfif len(arguments.actiondaysrecurring) gt 0>,
                    <cfqueryparam value="#arguments.actiondaysrecurring#" cfsqltype="CF_SQL_VARCHAR">
                </cfif>,
                0
            )
        </cfquery>

</cffunction></cfcomponent>
