
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getvm_audtypes_audsteps(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtypes_sel_31_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
