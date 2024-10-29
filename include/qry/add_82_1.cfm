
<cftry>
    <cfset result = createObject("component", "services.ContactService").INScontactdetails_23839(
        userid = session.userid,
        contactfullname = "Unknown"
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_82_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
