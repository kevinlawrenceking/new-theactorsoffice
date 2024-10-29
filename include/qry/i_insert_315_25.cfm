
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.contactItemService.insertContactItem(contactid=i.contactid, home_phone=i.home_phone)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in i_insert_315_25.cfm]: #cfcatch.message#">
    <cfrethrow>
</cfcatch>
</cftry>
