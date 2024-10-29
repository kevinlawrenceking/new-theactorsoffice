
<cftry>
    <cfset details = createObject("component", "services.EssenceService").getEssenceById(essenceid=essenceid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_263_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching essence details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
