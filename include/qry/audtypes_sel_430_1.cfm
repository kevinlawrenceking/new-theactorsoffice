
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getaudtypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtypes_sel_430_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
