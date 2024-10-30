
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset systemUserService.UPDfusystemusers_23935(new_userid=new_userid, new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in CompleteTargetSystems_157_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the user status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
