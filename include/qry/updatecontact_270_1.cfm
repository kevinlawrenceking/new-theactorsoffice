
<cftry>
    <cfset contactService = new "/services/ContactService.cfc"()>
    <cfset contactService.UPDcontactdetails_24202(
        contactid = contactid,
        contactfullname = trim(contactfullname),
        contactPronoun = contactPronoun,
        custom = trim(custom),
        contactbirthday = contactbirthday,
        contactmeetingdate = contactmeetingdate,
        contactmeetingloc = trim(contactmeetingloc),
        deleteitem = (deleteitem is "1"),
        refer_contact_id = refer_contact_id
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in updatecontact_270_1.cfm] Failed to update contact details. Error: #cfcatch.message#">
</cfcatch>
</cftry>
