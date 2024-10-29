
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").getMediaDetails(userid=variables.userid, audprojectid=variables.audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_sel_479_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
