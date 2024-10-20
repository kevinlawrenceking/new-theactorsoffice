
<cftry>
    <cfset audtones_user_sel = createObject("component", "services.AuditionToneUserService").getaudtones_user(userid, new_audcatid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtones_user_sel_428_1.cfm]: " & cfcatch.message>
        <cflog file="application" text="#errorLog#">
    </cfcatch>
</cftry>
