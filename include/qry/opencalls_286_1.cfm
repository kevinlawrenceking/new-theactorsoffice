
<cftry>
    <cfset opencalls = createObject("component", "services.AuditionOpenCallOptionUserService").getaudopencalloptions_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in opencalls_286_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
