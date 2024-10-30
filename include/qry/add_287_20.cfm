
<!--- This ColdFusion page handles the insertion of contact details into the database. --->
<cftry>
    <cfset variables.contactService = new "/services/ContactService.cfc"()>
    <cfset variables.contactService.INScontactdetails_24294(userid=session.userid, contactfullname=contactfullname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_287_20.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
