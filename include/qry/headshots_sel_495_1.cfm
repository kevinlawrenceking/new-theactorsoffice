
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").getMediaDetails(userid=#userid#, audprojectid=#audprojectid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_sel_495_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
