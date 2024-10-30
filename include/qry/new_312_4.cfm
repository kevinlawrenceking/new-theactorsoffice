
<cftry>
    <cfset taoVersionService = createObject("component", "services.TaoVersionService")>
    <cfset new = taoVersionService.SELtaoversions_24387(new_verid=new_verid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in new_312_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
