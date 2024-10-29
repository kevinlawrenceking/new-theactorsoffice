
<cftry>
    <cfset RPGFields = createObject("component", "services.PageService").getDynamicQuery(rpgid=rpgid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in RPGFields_288_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
