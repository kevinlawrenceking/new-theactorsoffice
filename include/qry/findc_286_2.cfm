
<cftry>
    <cfset findc = createObject("component", "services.AuditionOpenCallOptionUserService").getOpenCallOptions(new_opencallid=new_opencallid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findc_286_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
