
<cftry>
    <cfset results = createObject("component", "services.ContactService").getActiveContacts(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_456_3.cfm]: #cfcatch.message#">
        <cfset results = queryNew("contactid,col1")>
    </cfcatch>
</cftry>
