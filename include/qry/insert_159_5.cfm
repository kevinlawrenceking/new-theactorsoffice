
<cftry>
    <cfset objContactItemService = createObject("component", "services.ContactItemService")>
    <cfset objContactItemService.insertContactItem(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_159_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
