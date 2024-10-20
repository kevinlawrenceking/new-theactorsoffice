
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getaudtypes(new_audcatid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtypes_sel_217_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
