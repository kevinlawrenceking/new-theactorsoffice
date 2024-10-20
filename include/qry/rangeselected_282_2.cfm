
<cftry>
    <cfset rangeselected = createObject("component", "services.ReportRangeService").getreportranges(new_rangeid)>
<cfcatch>
    <cfset errorLog = "[Error in rangeselected_282_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
