
<cftry>
    <cfset result = createObject("component", "/services/ContactService").insertcontactdetails(
        userid = userid,
        contactfullname = contactFullName,
        contactbirthday = contactbirthday,
        refer_contact_id = refer_contact_id,
        contactmeetingdate = contactmeetingdate,
        contactmeetingloc = contactmeetingloc,
        contactPronoun = contactPronoun
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
<cfcatch type="any">
    <cfset errorLog = "[Error in add_211_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
