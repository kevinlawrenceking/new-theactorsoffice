
<cftry>
    <cfset siteTypeService = createObject("component", "/services/SiteTypeMasterService")>
    <cfset x = siteTypeService.getSiteTypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
