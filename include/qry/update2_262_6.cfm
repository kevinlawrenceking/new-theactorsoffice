
<cftry>
    <cfset componentPath = "/services/ContactItemService.cfc">
    <cfset contactItemService = createObject("component", componentPath)>
    <cfset result = contactItemService.updatecontactitems(valuetype=valuetype, itemid=itemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update2_262_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
