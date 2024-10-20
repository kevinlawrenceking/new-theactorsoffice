
<cftry>
    <cfset siteTypeMasterService = createObject("component", "/services/SiteTypeMasterService")>
    <cfset x = siteTypeMasterService.getsitetypes_master()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_318_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
