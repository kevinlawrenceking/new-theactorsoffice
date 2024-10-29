
<cftry>
    <cfset pageFieldService = createObject("component", "services.PageFieldService")>
    <cfset FindKey = pageFieldService.getPgFieldsByPgidAndUpdateName(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindKey_228_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
