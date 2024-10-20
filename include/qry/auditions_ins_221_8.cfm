
<cftry>
    <cfset result = createObject("component", "services.EventService").insertevents(
        userid=new_userid,
        audRoleID=new_audRoleID,
        audTypeID=new_audTypeID,
        audLocation=new_audLocation,
        eventStart=new_eventStart,
        eventStartTime=new_eventStartTime,
        eventStopTime=new_eventStopTime,
        audplatformID=new_audplatformid,
        audStepID=new_audStepID,
        parkingDetails=new_parkingDetails,
        workwithcoach=new_workwithcoach,
        trackmileage=new_trackmileage,
        audlocid=new_audlocid,
        isdeleted=1
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in auditions_ins_221_8.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
