
<cftry>
    <cfset pageFieldService = createObject("component", "services.PageFieldService")>
    <cfset FindKey = pageFieldService.getPgFieldsByPgidAndUpdateName(pgid=pgid, updatename="ID")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindKey_466_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
