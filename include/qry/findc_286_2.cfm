
<cftry>
    <cfset findc = createObject("component", "services.AuditionOpenCallOptionUserService").getaudopencalloptions_user(new_opencallid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findc_286_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
