<cfcomponent displayname="PanelsUserXRefService" hint="Handles operations for PanelsUserXRef table" output="false"> 
    <cffunction name="DELpgpanels_user_xref" access="public" returntype="void">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery>
            DELETE FROM pgpanels_user_xref 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    </cffunction>

    <cffunction name="INSpgpanels_user_xref" access="public" returntype="void">
        <cfargument name="newpnid" type="numeric" required="true">
        <cfargument name="newuserid" type="numeric" required="true">

        <cfquery>
            INSERT INTO pgpanels_user_xref (pnid, userid) 
            VALUES (
                <cfqueryparam value="#arguments.newpnid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.newuserid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
    </cffunction>
</cfcomponent>