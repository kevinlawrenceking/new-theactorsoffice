
<cftry>
    <cfset rpgid = "some_value"> <!--- Replace with actual value or variable --->
    <cfset pageService = new "/services/PageService.cfc">
    <cfset RPGAdd = pageService.getpgpages(rpgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in RPGAdd_288_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
