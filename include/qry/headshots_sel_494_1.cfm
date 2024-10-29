
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").getMediaDetails(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_sel_494_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
