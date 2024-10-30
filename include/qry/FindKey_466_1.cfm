
<cfset pageFieldService = createObject("component", "services.PageFieldService")>
<cftry>
    <cfset FindKey = pageFieldService.SELpgfields_24651(pgid=pgid, updatename="ID")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindKey_466_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
