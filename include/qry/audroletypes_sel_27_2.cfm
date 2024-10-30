
<cftry>
    <cfset audRoleTypeService = createObject("component", "services.AuditionRoleTypeService")>
    <cfset audroletypes_sel = audRoleTypeService.SELaudroletypes(audcatid=cat.audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audroletypes_sel_27_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
