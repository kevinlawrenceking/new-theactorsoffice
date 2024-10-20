
<cftry>
    <cfset variables.panelsUserXRefService = new "/services/PanelsUserXRefService.cfc"()>
    <cfset variables.result = variables.panelsUserXRefService.deletepgpanels_user_xref(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del_460_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
