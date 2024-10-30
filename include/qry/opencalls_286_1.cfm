
<cftry>
    <cfset opencalls = createObject("component", "services.AuditionOpenCallOptionUserService").SELaudopencalloptions_user(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in opencalls_286_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
