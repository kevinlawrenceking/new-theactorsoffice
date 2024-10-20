
<cftry>
    <cfset findtype = createObject("component", "services.AuditionTypeService").getaudtypes(new_audtypeid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findtype_365_1.cfm] " & cfcatch.message>
    </cfcatch>
</cftry>
