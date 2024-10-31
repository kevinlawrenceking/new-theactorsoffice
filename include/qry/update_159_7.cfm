
<cftry>
    <cfset objContactItemService = createObject("component", "/services/ContactItemService")>
    <cfset objContactItemService.UPDcontactitems(new_itemid=new_itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_159_7.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
