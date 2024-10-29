
<cftry>
    <cfset findit2 = createObject("component", "services.AuditionOpenCallOptionUserService").getOpenCallOptions(
        new_opencallname = new_opencallname,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit2_287_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
