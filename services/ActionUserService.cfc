<cfcomponent displayname="ActionUserService" hint="Handles operations for ActionUser table" > <cffunction name="updateActionUsers" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="target_id_system" type="numeric" required="true">

<!--- Step 1: Delete existing action users for the user and target system --->
    <cfquery name="deleteActionUsers">
        UPDATE actionusers_tbl
        SET isdeleted = 1
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND actionid IN (
            SELECT actionid
            FROM fuactions
            WHERE systemid = <cfqueryparam value="#arguments.target_id_system#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>    <!--- Step 2: Fetch user details --->
    <cfquery name="userDetails">
        SELECT userID

FROM taousers
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>    <!--- Ensure user exists before proceeding --->
    <cfif userDetails.recordcount GT 0>
        <!--- Step 3: Fetch actions for the target system --->
        <cfquery name="actionsForSystem">
            SELECT actionid, actiondaysno, actiondaysrecurring
            FROM fuactions
            WHERE systemid = <cfqueryparam value="#arguments.target_id_system#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        <!--- Step 4: Loop through actions and insert missing records --->
        <cfloop query="actionsForSystem">
            <!--- Check if the user already has the action --->
            <cfquery name="existingActionUser">
                SELECT 1
                FROM actionusers_tbl
                WHERE actionid = <cfqueryparam value="#actionsForSystem.actionid#" cfsqltype="CF_SQL_INTEGER">
                AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>            <!--- If the action-user record does not exist, insert it --->
            <cfif existingActionUser.recordcount EQ 0>
                <cfquery name="insertActionUser">
                    INSERT INTO actionusers_tbl (
                        actionid,
                        userid,
                        actiondaysno
                        <cfif actionsForSystem.actiondaysrecurring IS NOT "">, actiondaysrecurring</cfif>,
                        isdeleted
                    )
                    VALUES (
                        <cfqueryparam value="#actionsForSystem.actionid#" cfsqltype="CF_SQL_INTEGER">,
                        <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                        <cfqueryparam value="#actionsForSystem.actiondaysno#" cfsqltype="CF_SQL_INTEGER">
                        <cfif actionsForSystem.actiondaysrecurring IS NOT "">, <cfqueryparam value="#actionsForSystem.actiondaysrecurring#" cfsqltype="CF_SQL_INTEGER"></cfif>,
                        0
                    )
                </cfquery>
            </cfif>
        </cfloop>
    </cfif>
</cffunction>   <cffunction output="false" name="GetUserActions" access="public" returntype="query"  hint="Retrieve actions for a specific user ID.">
        <cfargument name="userid" type="numeric" required="yes" hint="ID of the user to retrieve actions for.">        <!--- Initialize the query variable --->
        <cfset var actions = "">        <!--- Query to fetch user actions --->
        <cfquery result="result" name="actions" >
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
        </cfquery>        <cfreturn actions>
    </cffunction>
<cffunction output="false" name="UPDactionusers" access="public" returntype="void" hint="Updates the isdeleted status of a user in the actionusers_tbl">
    <cfargument name="new_id" type="numeric" required="true" hint="ID of the user to be updated">        <cfquery result="result" >
            UPDATE actionusers_tbl 
            SET isdeleted = 1 
            WHERE id = <cfqueryparam value="#arguments.new_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
</cffunction>
<cffunction output="false" name="UPDactionusers_23923" access="public" returntype="void">
    <cfargument name="new_id" type="numeric" required="true">        <cfquery result="result" >
            UPDATE actionusers_tbl 
            SET isdeleted = 0 
            WHERE id = <cfqueryparam value="#arguments.new_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        </cffunction>
<cffunction name="UPDactionusers_24030" access="public" returntype="void" output="false">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="actionDaysNo" type="numeric" required="true">
    <cfargument name="deleteAction" type="boolean" required="true">
    <cfargument name="actionDaysRecurring" type="string" default="">    <cfquery name="update" >
        UPDATE actionusers_tbl
        SET 
            actionDaysNo = <cfqueryparam value="#arguments.actionDaysNo#" cfsqltype="CF_SQL_INTEGER">
            <cfif arguments.deleteAction>
                ,isdeleted = 1
            </cfif>
            <cfif arguments.actionDaysRecurring neq "0" AND len(trim(arguments.actionDaysRecurring))>
                ,actionDaysRecurring = <cfqueryparam value="#arguments.actionDaysRecurring#" cfsqltype="CF_SQL_VARCHAR">
            <cfelse>
                ,actionDaysRecurring = NULL
            </cfif>
        WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
</cfquery>
</cffunction>
<cffunction output="false" name="UPDactionusers_24254" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="target_id_system" type="numeric" required="true">        <cfquery result="result" >
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
<cffunction output="false" name="SELactionusers" access="public" returntype="query">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">            <cfquery name="result" >
            SELECT id,actionid,userid,actionDaysNo,actionDaysRecurring,IsDeleted 
            FROM actionusers 
            WHERE actionid = <cfqueryparam value="#arguments.actionid#" cfsqltype="CF_SQL_INTEGER"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    <cfreturn result>
</cffunction>
<cffunction output="false" name="INSactionusers" access="public" returntype="numeric">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="actiondaysno" type="numeric" required="true">
    <cfargument name="actiondaysrecurring" type="string" required="false" default="">

<cfquery result="result" >
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
 <cfreturn result.generatedKey>
</cffunction>
<cffunction output="false" name="SELactionusers_24454" access="public" returntype="query">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">        <cfquery name="result" >
            SELECT id,actionid,userid,actionDaysNo,actionDaysRecurring,IsDeleted 
            FROM actionusers 
            WHERE actionid = <cfqueryparam value="#arguments.actionid#" cfsqltype="CF_SQL_INTEGER"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

<cfreturn result>
</cffunction>
<cffunction output="false" name="INSactionusers_24455" access="public" returntype="numeric">
    <cfargument name="actionid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="actiondaysno" type="numeric" required="true">
    <cfargument name="actiondaysrecurring" type="string" required="false" default="">        <cfquery result="result" >
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
 <cfreturn result.generatedKey>
</cffunction></cfcomponent>
