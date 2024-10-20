
<cftry>
    <cfset findit2 = createObject("component", "services.AuditionOpenCallOptionUserService").getaudopencalloptions_user(new_opencallname, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findit2_287_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
