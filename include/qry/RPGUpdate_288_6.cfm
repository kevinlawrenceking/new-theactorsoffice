
<cftry>
    <cfset RPGUpdate = createObject("component", "services.PageService").SELpgpages_24305(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGUpdate_288_6.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing fetch." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
