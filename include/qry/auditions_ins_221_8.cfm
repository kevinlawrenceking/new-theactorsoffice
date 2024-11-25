<cfset eventService = createObject("component", "services.EventService")>
<Cfif new_audTypeID eq "">
    <cfset new_audTypeID = 1 />
</cfif>

<cfset eventService.INSevents_24096(
    new_userid=new_userid
    <cfif isNumeric(new_audRoleID)>, new_audRoleID=new_audRoleID</cfif>
    <cfif isNumeric(new_audTypeID)>, new_audTypeID=new_audTypeID</cfif>
    <cfif len(trim(new_audLocation))>, new_audLocation=new_audLocation</cfif>
    <cfif isDate(new_eventStart)>, new_eventStart=new_eventStart</cfif>
    <cfif len(trim(new_eventStartTime))>, new_eventStartTime=new_eventStartTime</cfif>
    <cfif len(trim(new_eventStopTime))>, new_eventStopTime=new_eventStopTime</cfif>
    <cfif isNumeric(new_audplatformid)>, new_audplatformid=new_audplatformid</cfif>
    <cfif isNumeric(new_audStepID)>, new_audStepID=new_audStepID</cfif>
    <cfif len(trim(new_parkingDetails))>, new_parkingDetails=new_parkingDetails</cfif>
    <cfif isBoolean(new_workwithcoach)>, new_workwithcoach=new_workwithcoach</cfif>
    <cfif isBoolean(new_trackmileage)>, new_trackmileage=new_trackmileage</cfif>
    <cfif isNumeric(new_audlocid)>, new_audlocid=new_audlocid</cfif>
)>
