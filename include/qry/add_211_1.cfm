
<cftry>
    <cfset variables.contactService = createObject("component", "services.ContactService")>
    <cfset variables.contactService.INScontactdetails_24070(
        userid = userid,
        contactFullName = contactFullName,
        contactBirthday = contactbirthday,
        referContactId = refer_contact_id,
        contactMeetingDate = contactmeetingdate,
        contactMeetingLoc = contactmeetingloc,
        contactPronoun = contactPronoun
    )>
    <cfquery datasource="yourDataSource">
        UPDATE yourTable SET isfetch = 1 WHERE yourCondition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_211_1.cfm] #cfcatch.message#" type="error">
</cfcatch>
</cftry>
