
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset eventService.updateEvent(
        new_userid = new_userid,
        new_audRoleID = new_audRoleID,
        new_audTypeID = new_audTypeID,
        new_audBookTypeID = new_audBookTypeID,
        new_audLocation = new_audLocation,
        new_eventLocation = new_eventLocation,
        new_audlocadd1 = new_audlocadd1,
        new_audlocadd2 = new_audlocadd2,
        new_audcity = new_audcity,
        new_region_id = new_region_id,
        new_audzip = new_audzip,
        new_eventStart = new_eventStart,
        new_eventStartTime = new_eventStartTime,
        new_eventStopTime = new_eventStopTime,
        new_audplatformid = new_audplatformid,
        new_audStepID = new_audStepID,
        new_parkingDetails = trim(new_parkingDetails),
        new_workwithcoach = new_workwithcoach,
        new_trackmileage = new_trackmileage,
        new_callbacktypeid = (new_callbacktypeid neq "") ? new_callbacktypeid : null,
        new_isDeleted = new_isDeleted,
        new_eventid = new_eventid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog("[Error in auditions_ins_374_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
