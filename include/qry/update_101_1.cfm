
<cftry>
    <cfset contactService = createObject("component", "services.ContactService")>
    <cfset contactService.UPDcontactdetails_23861(idList=idlist)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_101_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
