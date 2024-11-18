<cfset contactService = createObject("component", "services.ContactService")>
<cfset new_exportid = contactService.SELcontactdetails_23888(
    userId = userid,
    idList = idlist
)>