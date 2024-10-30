
<cftry>
    <cfset pageService = createObject("component", "/services/PageService")>
    <cfset RPGFields = pageService.SELpgpages_24301(rpgid=rpgid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in RPGFields_288_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
