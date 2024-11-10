<cfset suidList = []>

<cfquery name="suidQuery" datasource="abod">
    SELECT suid FROM fusystemusers
</cfquery>

<cfloop query="suidQuery">
    <cfset arrayAppend(suidList, suidQuery.suid)>
</cfloop>

<cfset notificationService = createObject("component", "services.NotificationService")>
<cfset notificationService.UPDfunotifications_24130(suidList=suidList)>

<cfquery name="updateFetchStatus" datasource="abod">
    UPDATE funotifications_tbl 
    SET isfetch = 1 
    WHERE isdeleted = 1
</cfquery>