
<cftry>
    <cfset siteLinkService = createObject("component", "services.SiteLinkUserService")>
    <cfset siteLinkService.insertSiteLink(
        new_sitename="#new_sitename#",
        new_siteurl="#new_siteurl#",
        userid=#userid#,
        new_sitetypeid=#new_sitetypeid#,
        ver="#ver#"
    )>
    <cfquery datasource="abod">
        UPDATE sitelinks_user SET isfetch = 1 WHERE sitename = <cfqueryparam value="#new_sitename#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
<cfcatch>
    <cflog file="errorLog" text="[Error in add_242_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
