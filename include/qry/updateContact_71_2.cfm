
<cftry>
    <cfset contactService = createObject("component", "services.ContactService")>
    <cfset contactService.updateContactDetails(
        uniquename = "Y",
        contactid = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateContact_71_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
