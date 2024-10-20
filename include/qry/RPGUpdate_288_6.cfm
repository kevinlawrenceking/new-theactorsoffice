
<cftry>
    <cfset RPGUpdate = createObject("component", "/services/PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGUpdate_288_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
