
<cftry>
    <cfset contactService = createObject("component", "services.ContactService")>
    <cfset FindRefcontacts = contactService.SELcontactdetails_23913(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindRefcontacts_135_2.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
