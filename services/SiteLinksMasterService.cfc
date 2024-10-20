<cfcomponent displayname="SiteLinksMasterService" hint="Handles operations for SiteLinksMaster table" output="false" > 
<cffunction name="getsitelinks_master" access="public" returntype="query">
    <cfargument name="newpnids" type="string" required="true">
    <cfargument name="orderBy" type="string" required="false" default="sitelink_id">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT sitelink_id, sitetypeid, sitename, siteURL, siteicon, sitetypename FROM vm_sitelinks_master_sitetypes_master WHERE 1=1">
    <cfset var validOrderByColumns = "sitelink_id,sitetypeid,sitename,siteURL,siteicon,sitetypename">

    <!--- Validate and append WHERE clause --->
    <cfif len(arguments.newpnids)>
        <cfset sql &= " AND sitelink_id IN (#arguments.newpnids#)">
    </cfif>

    <!--- Validate ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getsitelinks_master: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset queryResult = queryNew("sitelink_id,sitetypeid,sitename,siteURL,siteicon,sitetypename", "integer,integer,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- Corrected initialization of 'queryResult' from an empty string to an empty query object.
--->
</cfcomponent>
