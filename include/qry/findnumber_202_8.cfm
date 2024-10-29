
<cftry>
    <cfset findnumber = createObject("component", "services.EventContactsXRefService").getEventContactsXref(eventNumber=eventNumber, contactID=CONTACTID) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findnumber_202_8.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching event contacts." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
