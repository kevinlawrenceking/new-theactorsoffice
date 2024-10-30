
<cftry>
    <cfset FindDetails = createObject("component", "services.PageService").DETpgpages(compid=compid, pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindDetails_107_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
