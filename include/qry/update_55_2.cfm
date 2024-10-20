
<cftry>
    <cfset variables.contactService = new "/services/ContactService.cfc" />
    <cfset variables.result = variables.contactService.updatecontactdetails(
        contactbirthday = dateformat(final_birthday),
        contactid = New_contactid
    ) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_55_2.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
