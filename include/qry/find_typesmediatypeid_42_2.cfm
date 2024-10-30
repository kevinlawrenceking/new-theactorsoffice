
<cftry>
    <cfset find_#types.mediatypeid# = createObject("component", "services.AuditionMediaService").SELaudmedia(audprojectid=#audprojectid#, mediatypeid=#types.mediatypeid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_#types.mediatypeid#.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
