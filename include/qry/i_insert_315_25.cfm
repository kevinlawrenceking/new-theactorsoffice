
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24418(
        contactid = i.contactid,
        home_phone = i.home_phone
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in i_insert_315_25.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
