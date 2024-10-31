
<cftry>
    <cfset variables.contactService = createObject("component", "services.ContactService")>
    <cfset variables.contactService.UPDcontactdetails(final_birthday=final_birthday, New_contactid=New_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_55_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
