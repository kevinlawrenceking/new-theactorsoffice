
<cftry>
    <cfset itemTypeService = createObject("component", "/services/ItemTypeService")>
    <cfset x = itemTypeService.getItemTypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_31.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
