<cfcomponent displayname="PanelService" hint="Handles operations for Panel table" > 
<cffunction output="false" name="SELpgpanels" access="public" returntype="query">
    <cfargument name="newpnids" type="array" required="true">

    <cfset var result = "">

    <cfif arrayLen(arguments.newpnids) eq 0>
        <cfreturn queryNew("pnid", "integer")>
    </cfif>

    <cfquery name="result">
        SELECT pnid 
        FROM pgpanels 
        WHERE pnid IN (
            <cfloop array="#arguments.newpnids#" index="pnid">
                <cfqueryparam value="#pnid#" cfsqltype="CF_SQL_INTEGER" list="true">
            </cfloop>
        )
    </cfquery>

    <cfreturn result>
</cffunction></cfcomponent>