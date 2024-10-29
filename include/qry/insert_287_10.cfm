
<cftry>
    <cfset componentPath = "/services/AuditionEssenceXRefService.cfc">
    <cfobject component="#componentPath#" name="auditionService">
    <cfset auditionService.insertAuditionXref(new_essenceid=new_essenceid, new_audroleid=new_audroleid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_10.cfm]: #cfcatch.message#">
        <cfthrow message="Error in insert_287_10.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
