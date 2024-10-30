
<cftry>
    <cfset objPanelsUserXRefService = createObject("component", "/services/PanelsUserXRefService")>
    <cfset objPanelsUserXRefService.INSpgpanels_user_xref(newpnid=newpnid, newuserid=newuserid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_460_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
