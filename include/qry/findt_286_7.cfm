<cfset auditionAgeRangeService = createObject("component", "services.AuditionAgeRangeXRefService")>
<cfset findt = auditionAgeRangeService.SELaudageranges_audtion_xref(audroleid=audroleid, new_rangeid=new_rangeid)>