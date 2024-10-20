
<cftry>
    <cfset jsons_myteam = createObject("component", "/services/EventService").getvm_events_tbl_eventcontactsxref(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in jsons_myteam_50_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
