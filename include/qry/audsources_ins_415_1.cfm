
<cftry>
    <cfset variables.auditionSourceService = createObject("component", "/services/AuditionSourceService")>
    <cfset variables.auditionSourceService.INSaudsources(new_audsource=new_audsource, new_isDeleted=new_isDeleted)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audsources_ins_415_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudsources." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
