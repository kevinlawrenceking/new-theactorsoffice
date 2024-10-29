
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getAudTypes(audcatid=cat.audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_sel_27_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
