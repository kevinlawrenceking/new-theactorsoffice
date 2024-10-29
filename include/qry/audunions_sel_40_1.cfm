
<cftry>
    <cfset auditionUnionService = createObject("component", "/services/AuditionUnionService")>
    <cfset audunions_sel = auditionUnionService.getUnionData(new_countryid=new_countryid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audunions_sel_40_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
