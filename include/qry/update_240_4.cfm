
<cftry>
    <cfset panelUserService = new services.PanelUserService()>
    <cfset panelUserService.UPDpgpanels_user_24137(correctTitle=x.correct_title, pnid=x.pnid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_240_4.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
