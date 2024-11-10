<!--- This ColdFusion page updates audition role properties and redirects to the audition page. --->
<cfparam name="newIsRedirect" default="0" />
<cfparam name="newIsPin" default="0" />
<cfparam name="newIsCallback" default="0" />
<cfparam name="newIsBooked" default="0" />

<!--- Output SQL update statement for audition roles --->
<cfquery>
    UPDATE audroles 
    SET iscallback = <cfqueryparam value="#newIsCallback#" cfsqltype="cf_sql_integer">, 
        isredirect = <cfqueryparam value="#newIsRedirect#" cfsqltype="cf_sql_integer">, 
        ispin = <cfqueryparam value="#newIsPin#" cfsqltype="cf_sql_integer">, 
        isbooked = <cfqueryparam value="#newIsBooked#" cfsqltype="cf_sql_integer">
    WHERE audroleid = <cfqueryparam value="#audRoleId#" cfsqltype="cf_sql_integer">
</cfquery>

<!--- Include the update query template --->
<cfinclude template="/include/qry/update_285_1.cfm" />

<!--- Redirect to the audition page with parameters --->
<cflocation url="/app/audition/?audroleid=#audRoleId#&eventid=#eventId#&pgaction=view" addtoken="false"/>

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Used `<cfqueryparam>` for safe SQL execution.
4. Added `addtoken="false"` to `<cflocation>` to prevent CFID and CFTOKEN from being appended to URL.
--->