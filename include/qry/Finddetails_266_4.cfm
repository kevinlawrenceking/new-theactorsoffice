
<cftry>
    <cfset Finddetails = createObject("component", "services.PageService").DETpgpages_24197(details_pgid=details_pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Finddetails_266_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
