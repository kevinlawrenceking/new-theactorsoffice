
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset notificationService.updateNotificationStatus(
        notStatus = "#notStatus#",
        notEndDate = "#notEndDate#",
        notId = #notid#
    )>
    <cfquery name="updateFetchStatus" datasource="abod">
        UPDATE databaseTableName
        SET isfetch = 1
        WHERE someCondition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addNotification_70_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
