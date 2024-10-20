
<cftry>
    <cfset audtypes_sel = createObject("component", "/services/AuditionTypeService").getaudtypes(new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtypes_sel_221_11.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
