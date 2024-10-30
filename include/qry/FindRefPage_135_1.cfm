
<cftry>
    <cfset FindRefPage = createObject("component", "services.PageService").SELpgpages_23912(ref_pgid=ref_pgid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindRefPage_135_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
