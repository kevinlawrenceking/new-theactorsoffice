
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset Findphone = contactItemService.SELcontactitems_23963(contactID=myteam.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findphone_167_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
