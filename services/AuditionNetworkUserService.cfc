<cfcomponent displayname="AuditionNetworkUserService" hint="Handles operations for AuditionNetworkUser table" output="false"> 

    <cffunction name="INSaudnetworks_user" access="public" returntype="void">

        <cfargument name="CustomNetwork" type="string" required="true">
        <cfargument name="audcatid" type="numeric" required="true">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery result="result" >
            INSERT INTO audnetworks_user_tbl (network, audcatid, userid)
            VALUES (
                <cfquery result="result" param value="#arguments.CustomNetwork#" cfsqltype="CF_SQL_VARCHAR">,
                <cfquery result="result" param value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
    </cffunction>
</cfcomponent>