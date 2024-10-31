
<cftry>
    <cfset findc = createObject("component", "services.AuditionOpenCallOptionUserService").SELaudopencalloptions_user_24262(new_opencallid=new_opencallid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findc_286_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
