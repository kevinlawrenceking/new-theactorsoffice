<cfset contactService = createObject("component", "services.ContactService")>
<cfset contactService.INScontactdetails_24070(
    userid = userid,
    contactFullName = contactFullName,
    contactBirthday = contactbirthday,
    referContactId = refer_contact_id,
    contactMeetingDate = contactmeetingdate,
    contactMeetingLoc = contactmeetingloc,
    contactPronoun = contactPronoun
)>