
<cftry>
    <cfset audtones_user_sel = createObject("component", "services.AuditionToneUserService").SELaudtones_user(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtones_user_sel_428_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
