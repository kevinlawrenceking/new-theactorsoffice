
<cftry>
    <cfset result = createObject("component", "services.AuditionLocationService").insertaudlocations(userid=userid, eventLocation=custom)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audlocations_ins_218_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
