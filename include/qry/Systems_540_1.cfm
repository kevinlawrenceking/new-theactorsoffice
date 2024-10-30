
<cftry>
    <cfset systemsService = createObject("component", "/services/SystemService")>
    <cfset Systems = systemsService.SELfusystems_24763()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Systems_540_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
