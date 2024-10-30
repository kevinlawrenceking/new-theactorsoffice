<cfcomponent displayname="SiteLinksMasterService" hint="Handles operations for SiteLinksMaster table" output="false"> 
<cffunction name="SELsitelinks_master" access="public" returntype="query">
    <cfargument name="siteTypeId" type="numeric" required="false">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT s.id, s.sitename, s.siteURL, s.siteicon, s.sitetypeid, t.sitetypename
            FROM sitelinks_master s
            INNER JOIN sitetypes_master t ON t.sitetypeid = s.siteTypeid
            WHERE 1=1
            <cfif structKeyExists(arguments, "siteTypeId")>
                AND s.siteTypeid = <cfqueryparam value="#arguments.siteTypeId#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            ORDER BY s.sitename
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteLinks: #cfcatch.message#">
            <cfreturn queryNew("id,sitename,siteURL,siteicon,sitetypeid,sitetypename")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction></cfcomponent>
