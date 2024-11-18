<cfset suidList = []>

<cfquery result="result" name="suidQuery" >
    SELECT suid FROM fusystemusers
</cfquery>

<cfloop query="suidQuery">
    <cfset arrayAppend(suidList, suidQuery.suid)>
</cfloop>

<cfset notificationService = createObject("component", "services.NotificationService")>
<cfset notificationService.UPDfunotifications_24130(suidList=suidList)>
