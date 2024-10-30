
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").SELaudmedia_24678(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_sel_494_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
