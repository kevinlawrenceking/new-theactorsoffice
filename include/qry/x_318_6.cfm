
<cftry>
    <cfset siteTypeMasterService = createObject("component", "services.SiteTypeMasterService")>
    <cfset x = siteTypeMasterService.SELsitetypes_master_24437()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_6.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
