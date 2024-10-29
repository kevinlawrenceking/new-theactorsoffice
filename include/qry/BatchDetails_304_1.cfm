
<cftry>
    <cfset BatchDetails = createObject("component", "services.ContactService").getContactDetails(idList)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in BatchDetails_304_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
