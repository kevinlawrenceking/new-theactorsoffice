
<cftry>
    <cfset createObject("component", "services.ContactService").INScontactdetails_24000(
        userFirstName = finduser.userfirstname,
        userLastName = finduser.userlastname,
        userId = session.userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in InsertContact_188_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
