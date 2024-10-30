<cfcomponent displayname="AuditionNetworkUserService" hint="Handles operations for AuditionNetworkUser table" output="false"> 
<cffunction name="INSaudnetworks_user" access="public" returntype="void">
    <cfargument name="CustomNetwork" type="string" required="true">
    <cfargument name="audcatid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audnetworks_user_tbl (network, audcatid, userid)
            VALUES (
                <cfqueryparam value="#arguments.CustomNetwork#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertAudNetworksUser: #cfcatch.message#">
            <cfthrow message="Database insert operation failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
