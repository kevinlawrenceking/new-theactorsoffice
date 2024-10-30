
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").SELaudmedia_24665(userid=#userid#, audprojectid=#audprojectid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_sel_479_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
