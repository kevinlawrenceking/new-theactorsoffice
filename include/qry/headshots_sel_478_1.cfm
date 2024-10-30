
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").SELaudmedia_24666(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_sel_478_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
