
<cftry>
    <cfset masterService = new "/services/SiteTypeMasterService.cfc"()>
    <cfset master = masterService.SELsitetypes_master(sitetypename=current_sitetypename)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in master_164_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
