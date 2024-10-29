
<cftry>
    <cfset variables.contactService = createObject("component", "services.ContactService")>
    <cfset variables.contactService.insertContactDetails(
        userFirstName = finduser.userfirstname,
        userLastName = finduser.userlastname,
        userId = session.userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in InsertContact_188_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error in InsertContact_188_3.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

