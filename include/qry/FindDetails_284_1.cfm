
<cftry>
    <cfset FindDetails = createObject("component", "services.PageService").getPgPagesDetails(compid=compid, pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindDetails_284_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching page details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
