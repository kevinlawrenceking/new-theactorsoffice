
<cftry>
    <cfset objPanelUserService = createObject("component", "/services/PanelUserService")>
    <cfset objPanelUserService.updateUserVisibility(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in x_94_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating user visibility." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
