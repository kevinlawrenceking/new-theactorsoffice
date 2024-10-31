
<cftry>
    <cfset pageService = createObject("component", "services.PageService")>
    <cfset RPGAdd = pageService.SELpgpages_24304(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in RPGAdd_288_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
