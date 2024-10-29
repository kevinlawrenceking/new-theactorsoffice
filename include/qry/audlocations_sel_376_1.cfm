
<cftry>
    <cfset audlocations_sel = createObject("component", "services.AuditionLocationService").getAudLocations(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audlocations_sel_376_1.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
