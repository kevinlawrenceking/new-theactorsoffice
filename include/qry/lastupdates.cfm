
    <!--- Instantiate the ContactService component --->
    <cfset contactService = createObject("component", "services.ContactService")>

    <!--- Call the getContactUpdates function with dynamic userid and compid = 1 --->
    <cfset updates = contactService.getContactUpdates(
        userid = #userid#, 
        compid = 1
    )>


