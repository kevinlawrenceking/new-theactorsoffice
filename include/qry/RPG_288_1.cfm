
<cftry>
    <cfset rpgid = "some_value"> <!--- Replace with actual value or variable --->
    <cfset pageService = new "/services/PageService.cfc"()>
    <cfset RPG = pageService.getpgpages(rpgid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in RPG_288_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
