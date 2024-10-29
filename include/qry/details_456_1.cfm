
<cftry>
    <cfset details = createObject("component", "services.ContactService").getContactDetails(contactid=contactid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in details_456_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
