
<cftry>
    <cfset filters = {userid=userid, audcatid=new_audcatid}>
    <cfset orderBy = "auddialect">
    
    <cfset auddialects_user_sel = createObject("component", "services.AuditionDialectsUserService").getauddialects_user(filters=filters, orderBy=orderBy)>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auddialects_user_sel_358_1.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
