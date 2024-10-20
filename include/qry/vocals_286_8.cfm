
<cftry>
    <cfset vocals = createObject("component", "services.AuditionVocalTypeService").getaudvocaltypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in vocals_286_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
