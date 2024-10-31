
<cftry>
    <cfset contactService = createObject("component", "/services/ContactService")>
    <cfset contactService.INScontactdetails_24070(
        userid = userid,
        contactFullName = contactFullName,
        contactBirthday = contactbirthday,
        referContactId = refer_contact_id,
        contactMeetingDate = contactmeetingdate,
        contactMeetingLoc = contactmeetingloc,
        contactPronoun = contactPronoun
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_211_1.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
