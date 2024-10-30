
<cftry>
    <cfset Finddetails = createObject("component", "services.PageService").DETpgpages_23991(pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Finddetails_185_1.cfm]: #cfcatch.message#">
        <cfthrow message="Function call failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
