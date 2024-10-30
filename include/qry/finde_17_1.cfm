
<cftry>
    <cfset finde = createObject("component", "services.EventContactsXRefService").SELeventcontactsxref(ContactID=ContactID, EventID=eventdetails.eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in finde_17_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving event contacts." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
