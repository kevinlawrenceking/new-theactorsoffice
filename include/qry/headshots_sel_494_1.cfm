
<cftry>
    <cfset headshots_sel = createObject("component", "/services/AuditionMediaService").getaudmedia({
        userid: userid
    })>
    <cfcatch type="any">
        <cfset errorLog = "[Error in headshots_sel_494_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
