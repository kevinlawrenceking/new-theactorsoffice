
<cftry>
    <cfset objContactItemService = createObject("component", "services.ContactItemService")>
    <cfset objContactItemService.INScontactitems_24422(contactid=u.contactid, website=u.website)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in u_insert_315_29.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
