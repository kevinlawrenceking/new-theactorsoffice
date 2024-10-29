
<cftry>
    <cfset objContactItemService = createObject("component", "/services/ContactItemService")>
    <cfset objContactItemService.insertContactItem(contactid=u.contactid, website=u.website)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in u_insert_315_29.cfm]: #cfcatch.message#">
    <cfthrow message="Error in u_insert_315_29.cfm" detail="#cfcatch.detail#">
</cfcatch>
</cftry>
