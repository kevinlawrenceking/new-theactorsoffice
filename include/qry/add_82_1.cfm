
<cftry>
    <cfset result = createObject("component", "/services/ContactService").insertcontactdetails(session.userid, "Unknown")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_82_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
