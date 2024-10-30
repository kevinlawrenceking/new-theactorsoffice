
<cftry>
    <cfset RPGResults = createObject("component", "services.PageService").RESpgpages_24302(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGResults_288_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching RPGResults." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
