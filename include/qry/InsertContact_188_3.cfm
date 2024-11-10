<cfset contactService = createObject("component", "services.ContactService")>
<cfset contactService.INScontactdetails_24000(
    userFirstName = finduser.userfirstname,
    userLastName = finduser.userlastname,
    userId = userid
)>