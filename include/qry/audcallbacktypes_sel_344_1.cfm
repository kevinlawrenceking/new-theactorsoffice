
<cftry>
    <cfset audcallbacktypes_sel = createObject("component", "services.AuditionCallbackTypeService").SELaudcallbacktypes(audcatid=#audcatid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcallbacktypes_sel_344_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
