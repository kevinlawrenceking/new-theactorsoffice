
<cftry>
    <cfset pageService = createObject("component", "services.PageService")>
    <cfset RPGkey = pageService.SELpgpages_24303(rpgid=#rpgid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGkey_288_4.cfm]: #cfcatch.message#">
        <cfset RPGkey = queryNew("fname,ftype")>
    </cfcatch>
</cftry>
