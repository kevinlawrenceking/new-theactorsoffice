
<cftry>
    <cfset findt = createObject("component", "services.AuditionVocalTypeXRefService").getAuditionVocalTypes(audroleid=#audroleid#, new_vocaltypeid=#new_vocaltypeid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findt_286_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
