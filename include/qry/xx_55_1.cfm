
<cftry>
    <cfset contactService = createObject("component", "/services/ContactService")>
    <cfset xx = contactService.getContactDetails(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in xx_55_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
