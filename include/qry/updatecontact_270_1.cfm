
<cftry>
    <cfset variables.contactService = new "/services/ContactService.cfc"()>
    <cfset variables.contactService.updateContactDetails(
        contactid = contactid,
        contactfullname = trim(contactfullname),
        contactPronoun = contactPronoun,
        custom = trim(custom),
        contactbirthday = contactbirthday,
        contactmeetingdate = contactmeetingdate,
        contactmeetingloc = trim(contactmeetingloc),
        deleteitem = deleteitem,
        refer_contact_id = refer_contact_id
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in updatecontact_270_1.cfm] Failed to update contact details. Error: #cfcatch.message#">
</cfcatch>
</cftry>
