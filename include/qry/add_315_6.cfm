
<cftry>
    <cfset result = new "/services/ContactService.cfc"().insertcontactdetails(
        contactfullname = "#x.fname# #x.lname#",
        userid = session.userid,
        contactMeetingDate = x.contactmeetingDate neq "" ? x.contactmeetingDate : "",
        contactMeetingLoc = x.contactMeetingLoc neq "" ? x.contactMeetingLoc : "",
        contactBirthday = x.birthday neq "" ? x.birthday : ""
    )>
    <cfcatch>
        <cfset errorLog = "[Error in add_315_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
