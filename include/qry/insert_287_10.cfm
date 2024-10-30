
<cftry>
    <cfset variables.auditionService = createObject("component", "services.AuditionEssenceXRefService")>
    <cfset variables.auditionService.INSaudessences_audtion_xref(new_essenceid=new_essenceid, new_audroleid=new_audroleid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
