
<cftry>
    <cfset contactService = new "/services/ContactService.cfc"()>
    <cfset contactService.INScontactdetails_23839(userid=session.userid, contactfullname="Unknown")>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_82_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
