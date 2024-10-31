
<cftry>
    <cfset objService = createObject("component", "services.AuditionSubmitSiteUserService")>
    <cfset objService.UPDaudsubmitsites_user_24296(new_catlist=new_catlist, new_submitsiteid=new_submitsiteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_287_22.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating record in audsubmitsites_user table.">
    </cfcatch>
</cftry>
