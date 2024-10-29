
<cftry>
    <cfset opencalls = createObject("component", "services.AuditionOpenCallOptionUserService").getOpenCallOptions(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in opencalls_286_1.cfm]: #cfcatch.message#">
        <cfset opencalls = queryNew("opencallid,opencallname")>
    </cfcatch>
</cftry>
