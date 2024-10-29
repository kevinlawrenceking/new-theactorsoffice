
<cftry>
    <cfset report_10 = createObject("component", "services.AuditionProjectService").getCallbacksData(userid=userid, new_rangestart=new_rangestart, new_rangeend=new_rangeend) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_10_282_3.cfm]: #cfcatch.message# - Detail: #cfcatch.detail#" />
        <cfthrow message="An error occurred while fetching callback data." detail="#cfcatch.detail#"/>
    </cfcatch>
</cftry>
