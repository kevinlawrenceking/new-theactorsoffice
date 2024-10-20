
<cftry>
    <cfset audcallbacktypes_sel = createObject("component", "services.AuditionCallbackTypeService").getaudcallbacktypes(audstepid=2, audcatid=audcatid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audcallbacktypes_sel_344_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
