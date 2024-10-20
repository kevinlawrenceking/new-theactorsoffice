
<cftry>
    <cfset result = createObject("component", "services.EventService").insertevents(
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
        new_trackmileage = new_trackmileage
    )>
    <cfquery>
        UPDATE database_table SET isfetch = 1 WHERE condition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in auditions_ins_373_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
