
<cftry>
    <cfset contactService = createObject("component", "services.ContactService")>
    <cfset contactService.INScontactdetails_23839(userid=session.userid, contactfullname="Unknown")>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_82_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
