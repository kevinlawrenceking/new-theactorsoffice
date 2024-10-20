
<cftry>
    <cfset contactService = new "/services/ContactService.cfc" />
    <cfset contactService.updatecontactdetails(
        contactfullname = trim(contactfullname),
        contactPronoun = (contactPronoun is "custom") ? trim(custom) : trim(contactPronoun),
        contactbirthday = contactbirthday,
        contactmeetingdate = contactmeetingdate,
        contactmeetingloc = trim(contactmeetingloc),
        isdeleted = (deleteitem is "1") ? 1 : 0,
        refer_contact_id = Len(trim(refer_contact_id)) ? refer_contact_id : null,
        contactid = contactid
    ) />
<cfcatch type="any">
    <cfset errorLog("[Error in updatecontact_270_1.cfm]: #cfcatch.message#") />
</cfcatch>
</cftry>
