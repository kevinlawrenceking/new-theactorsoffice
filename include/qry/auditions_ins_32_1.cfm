
<cftry>
    <cfset result = createObject("component", "services.EventService").insertevents(
        new_eventtitle = new_eventtitle,
        new_eventdescription = new_eventdescription,
        new_userid = new_userid,
        new_audRoleID = new_audRoleID,
        new_audTypeID = new_audTypeID,
        new_audLocation = new_audLocation,
        new_eventStart = new_eventStart,
        new_eventStartTime = new_eventStartTime,
        new_eventStopTime = new_eventStopTime,
        new_audplatformid = new_audplatformid,
        new_audStepID = new_audStepID,
        new_parkingDetails = new_parkingDetails,
        new_workwithcoach = new_workwithcoach,
        new_trackmileage = new_trackmileage,
        new_audlocid = new_audlocid
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in auditions_ins_32_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
