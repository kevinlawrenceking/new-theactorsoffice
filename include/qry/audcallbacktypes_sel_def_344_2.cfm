
<cftry>
    <cfset audcallbacktypes_sel_def = createObject("component", "services.AuditionCallbackTypeService").getCallbackTypes(audcatid=#audcatid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcallbacktypes_sel_def_344_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
