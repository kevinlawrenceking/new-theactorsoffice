
<cftry>
    <cfset systemsService = createObject("component", "services.FUSystemTypeService")>
    <cfset systems = systemsService.SELfusystemtypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in systems_454_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
