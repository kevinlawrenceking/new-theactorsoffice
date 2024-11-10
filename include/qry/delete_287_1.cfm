<cfset componentPath = "/services/AuditionVocalTypeXRefService.cfc">
<cfset auditionService = createObject("component", componentPath)>
<cfset auditionService.DELaudvocaltypes_audition_xref(new_audroleid)>