
<cftry>
    <cfset auditionUnionService = new "/services/AuditionUnionService.cfc" />
    <cfset audunions_sel = auditionUnionService.getaudunions(new_countryid=new_countryid, new_audcatid=new_audcatid) />
<cfcatch type="any">
    <cfset errorLog = "[Error in audunions_sel_40_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
