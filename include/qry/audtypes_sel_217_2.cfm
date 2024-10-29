
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getAudTypes(new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_sel_217_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
