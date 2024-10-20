
<cftry>
    <cfset audroletypes_sel = createObject("component", "services.AuditionRoleTypeService").getaudroletypes(cat.audcatid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in audroletypes_sel_27_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
