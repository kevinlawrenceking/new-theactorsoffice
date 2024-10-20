
<cftry>
    <cfset itemTypeService = new "/services/ItemTypeService.cfc"()>
    <cfset x = itemTypeService.getitemtypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_318_31.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
