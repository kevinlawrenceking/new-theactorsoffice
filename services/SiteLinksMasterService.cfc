<cfcomponent displayname="SiteLinksMasterService" hint="Handles operations for SiteLinksMaster table" output="false"> 
<cffunction name="SELsitelinks_master" access="public" returntype="query">
    <cfargument name="siteTypeId" type="numeric" required="false">
    <cfset var result = "">
        <cfquery name="result">
            SELECT s.id, s.sitename, s.siteURL, s.siteicon, s.sitetypeid, t.sitetypename
            FROM sitelinks_master s
            INNER JOIN sitetypes_master t ON t.sitetypeid = s.siteTypeid
            WHERE 1=1
            <cfif structKeyExists(arguments, "siteTypeId") AND len(arguments.siteTypeId)>
                AND s.siteTypeid = <cfqueryparam value="#arguments.siteTypeId#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            ORDER BY s.sitename
        </cfquery>
    <cfreturn result>
</cffunction></cfcomponent>