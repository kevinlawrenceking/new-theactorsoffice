
<cftry>
    <cfset variables.eventService = new "/services/EventService.cfc"()>
    <cfset variables.eventService.INSevents_24096(
        new_userid=new_userid,
        new_audRoleID=new_audRoleID,
        new_audTypeID=new_audTypeID,
        new_audLocation=new_audLocation,
        new_eventStart=new_eventStart,
        new_eventStartTime=new_eventStartTime,
        new_eventStopTime=new_eventStopTime,
        new_audplatformid=new_audplatformid,
        new_audStepID=new_audStepID,
        new_parkingDetails=new_parkingDetails,
        new_workwithcoach=new_workwithcoach,
        new_trackmileage=new_trackmileage,
        new_audlocid=new_audlocid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in auditions_ins_221_8.cfm] Error: #cfcatch.message#; Details: #serializeJSON(cfcatch)#" type="error">
    </cfcatch>
</cftry>
