
<cftry>
    <cfset audDialectsService = createObject("component", "/services/AuditionDialectsUserService")>
    <cfset auddialects_user_sel = audDialectsService.SELauddialects_user(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auddialects_user_sel_358_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the data.">
    </cfcatch>
</cftry>
