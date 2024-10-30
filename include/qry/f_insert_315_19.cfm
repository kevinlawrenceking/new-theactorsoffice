
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.contactItemService.INScontactitems_24412(
        contactid = f.contactid,
        personal_email = f.personal_email
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in f_insert_315_19.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
