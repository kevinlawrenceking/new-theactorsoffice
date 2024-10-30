
<cftry>
    <cfset objContactItemService = createObject("component", "services.ContactItemService")>
    <cfset objContactItemService.UPDcontactitems_23953(currentid=currentid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_159_11.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
