
<cftry>
    <cfset panelUserService = new "/services/PanelUserService.cfc"()>
    <cfset Findtotal = panelUserService.getvm_pgpanels_user_sitetypes_user(userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in Findtotal_249_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
