
<cftry>
    <cfset FindJoins = createObject("component", "services.PageService").SELpgpages_24778(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindJoins_550_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
