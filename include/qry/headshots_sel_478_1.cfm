
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").getaudmedia(userid=userid, mediatypeid=1, isdeleted=false)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in headshots_sel_478_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
