<cfcomponent displayname="PanelsUserXRefService" hint="Handles operations for PanelsUserXRef table" output="false"> 
<cffunction name="deleteUserXref" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM pgpanels_user_xref 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in deleteUserXref: #cfcatch.message# Query: DELETE FROM pgpanels_user_xref WHERE userid = ? Parameters: #arguments.userid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertPgpanelsUserXref" access="public" returntype="void">
    <cfargument name="newpnid" type="numeric" required="true">
    <cfargument name="newuserid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO pgpanels_user_xref (pnid, userid) 
            VALUES (
                <cfqueryparam value="#arguments.newpnid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.newuserid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertPgpanelsUserXref: #cfcatch.message#; SQL: INSERT INTO pgpanels_user_xref (pnid, userid) VALUES (#arguments.newpnid#, #arguments.newuserid#)">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
