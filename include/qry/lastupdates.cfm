<cftry>
    <!--- Instantiate the ContactService component --->
    <cfset contactService = createObject("component", "services.ContactService")>

    <!--- Call the getContactUpdates function with dynamic userid and compid = 1 --->
    <cfset updates = contactService.getContactUpdates(
        userid = #userid#, 
        compid = 1
    )>

    <!--- Output the result for debugging (optional) --->
    <cfdump var="#updates#" label="Contact Updates Query Result">

<cfcatch>
    <!--- Log any errors encountered --->
    <cflog file="errorLog" type="error" text="[Error in fetch page]: #cfcatch.message#">
    <cfthrow message="Error occurred while fetching contact updates." detail="#cfcatch.detail#">
</cfcatch>
</cftry>
