
<cftry>
    <cfset audlocations_sel = createObject("component", "services.AuditionLocationService").getaudlocations(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audlocations_sel_376_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
