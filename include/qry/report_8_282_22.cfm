
<cftry>
    <cfset report_8 = createObject("component", "/services/AuditionMediaService").getAuditionsData(
        userid = userid, 
        new_audcatid = new_audcatid, 
        rangestart = rangeselected.rangestart, 
        rangeend = rangeselected.rangeend
    )>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_8_282_22.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching auditions data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
