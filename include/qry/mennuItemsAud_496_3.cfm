
<cftry>
    <cfset componentService = new "/services/ComponentService.cfc"()>
    <cfset mennuItemsAud = componentService.SELpgcomps_24681(3, 'A')>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mennuItemsAud_496_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
