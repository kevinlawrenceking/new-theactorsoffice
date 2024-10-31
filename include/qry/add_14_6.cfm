<cftry>
    <!--- Instantiate the ContactService component correctly --->
    <cfset contactService = createObject("component", "services.ContactService")>

    <!--- Call the INScontactdetails method with the required parameters --->
    <cfset contactService.INScontactdetails(
        userid = userid,
        contactFullName = relationship
    )>

<cfcatch type="any">
    <!--- Log any errors encountered --->
    <cflog file="errorLog" type="error" text="[Error in add_14_6.cfm]: #cfcatch.message#">
    <cfthrow message="Error inserting contact details." detail="#cfcatch.detail#">
</cfcatch>
</cftry>
