
<cftry>
    <cfset find_#types.mediatypeid# = createObject("component", "services.AuditionMediaService").getAudMedia(audprojectid=#audprojectid#, mediatypeid=#types.mediatypeid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_#types.mediatypeid#]: #cfcatch.message#" />
    </cfcatch>
</cftry>
