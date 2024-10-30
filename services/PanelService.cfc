<cfcomponent displayname="PanelService" hint="Handles operations for Panel table" output="false"> 
<cffunction name="SELpgpanels" access="public" returntype="query">
    <cfargument name="newpnids" type="array" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfif arrayLen(arguments.newpnids) eq 0>
            <cfreturn queryNew("pnid", "integer")>
        </cfif>

        <cfquery name="result" datasource="abod">
            SELECT pnid 
            FROM pgpanels 
            WHERE pnid IN (
                <cfloop array="#arguments.newpnids#" index="pnid">
                    <cfqueryparam value="#pnid#" cfsqltype="CF_SQL_INTEGER" list="true">
                </cfloop>
            )
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in getPanelIds: #cfcatch.message# Query: SELECT pnid FROM pgpanels WHERE pnid IN (#arguments.newpnids#)">
            <cfthrow message="An error occurred while retrieving panel IDs." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
