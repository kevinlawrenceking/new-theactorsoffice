
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.updateContactItems(currentid=#currentid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_159_11.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
