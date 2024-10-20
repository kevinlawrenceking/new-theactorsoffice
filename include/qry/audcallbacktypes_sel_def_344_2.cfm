
<cftry>
    <cfset audcallbacktypes_sel_def = createObject("component", "services.AuditionCallbackTypeService").getaudcallbacktypes(audcatid=audcatid)>
<cfcatch>
    <cfset errorLog = "[Error in audcallbacktypes_sel_def_344_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
