
<cftry>
    <cfset FindJoins = createObject("component", "services.PageService").SELpgpages_24653(pgid=#pgid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindJoins_466_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
