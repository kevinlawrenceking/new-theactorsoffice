
<cftry>
    <cfset RPGUpdate = createObject("component", "services.PageService").getDynamicQueryResults(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGUpdate_288_6.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
