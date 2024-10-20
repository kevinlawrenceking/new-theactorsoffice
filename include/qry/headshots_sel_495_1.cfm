
<cftry>
    <cfset headshots_sel = createObject("component", "/services/AuditionMediaService").getaudmedia(userid=userid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in headshots_sel_495_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
