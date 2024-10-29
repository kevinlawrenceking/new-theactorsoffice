
<cftry>
    <cfset variables.auditionSourceService = new "/services/AuditionSourceService.cfc" />
    <cfset variables.auditionSourceService.insertAudsource(new_audsource=new_audsource, new_isDeleted=new_isDeleted) />
    <cfcatch>
        <cflog file="errorLog" text="[Error in audsources_ins_415_1.cfm]: #cfcatch.message#" />
        <cfthrow message="Error occurred while calling insertAudsource." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
