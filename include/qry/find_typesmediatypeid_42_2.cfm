
<cftry>
    <cfset find_#types.mediatypeid# = createObject("component", "/services/AuditionMediaService").getaudmedia(audprojectid=#audprojectid#, mediatypeid=#types.mediatypeid#)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_typesmediatypeid_" & #types.mediatypeid# & ".cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
