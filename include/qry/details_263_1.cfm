
<!--- This page retrieves details of a specific essence based on the essenceid provided. --->
<cftry>
    <cfset details = createObject("component", "services.EssenceService").DETessences(essenceid=essenceid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_263_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving essence details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
