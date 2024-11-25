<cfset eventService = createObject("component", "services.EventService")>
<Cfif new_audTypeID eq "">
    <cfset new_audTypeID = 1 />
</cfif>

<cfset eventService.INSevents_24096(
    new_userid=new_userid
    <cfif new_audroleid neq "">, new_audRoleID=new_audRoleID</cfif>
    <cfif new_audTypeID neq "">, new_audTypeID=new_audTypeID</cfif>
    <cfif new_audLocation neq "">, new_audLocation=new_audLocation</cfif>
    <cfif new_eventStart neq "">, new_eventStart=new_eventStart</cfif>
    <cfif new_eventStartTime neq "">, new_eventStartTime=new_eventStartTime</cfif>
    <cfif new_eventStopTime neq "">, new_eventStopTime=new_eventStopTime</cfif>
    <cfif new_audplatformid neq "">, new_audplatformid=new_audplatformid</cfif>
    <cfif new_audStepID neq "">, new_audStepID=new_audStepID</cfif>
    <cfif new_parkingDetails neq "">, new_parkingDetails=new_parkingDetails</cfif>
    <cfif new_workwithcoach neq "">, new_workwithcoach=new_workwithcoach</cfif>
    <cfif new_trackmileage neq "">, new_trackmileage=new_trackmileage</cfif>
    <cfif new_audlocid neq "">, new_audlocid=new_audlocid</cfif>
)>
