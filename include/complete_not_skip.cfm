<!--- This ColdFusion page processes notifications based on session data and includes various query templates for handling notifications and system updates. --->
<cfif isDefined('session.mocktoday')>
    <!--- Check if session.mocktoday is defined and set currentStartDate accordingly --->
    <cfset currentStartDate = DateFormat(session.mocktoday, 'yyyy-mm-dd') />
<cfelse>
    <!--- If session.mocktoday is not defined, set currentStartDate to the current date --->
    <cfset currentStartDate = DateFormat(Now(), 'yyyy-mm-dd') />
</cfif>

<cfinclude template="/include/qry/notsdetails.cfm" />

<!--- Calculate the notification start date based on actionDaysRecurring --->
<cfset notificationStartDate = dateAdd('d', numberFormat(notsdetails.actionDaysRecurring), currentStartDate) />

<!--- Set various notification-related variables from the notsdetails query --->
<cfset contactId = notsdetails.contactid />
<cfset newContactName = notsdetails.new_contactname />
<cfset systemId = notsdetails.systemid />
<cfset userId = notsdetails.userid />
<cfset actionId = notsdetails.actionid />
<cfset newsUid = notsdetails.newsuid />
<cfset newSystemScope = notsdetails.newsystemscope />
<cfset actionDaysRecurring = notsdetails.actionDaysRecurring />
<cfset uniqueName = notsdetails.uniquename />
<cfset isUnique = notsdetails.IsUnique />

<!--- Initialize notification status as "Skipped" --->
<cfset notificationStatus = "Skipped" />

<!--- Set the notification end date to the current date --->
<cfset notificationEndDate = DateFormat(Now(), 'yyyy-mm-dd') />

<cfinclude template="/include/qry/addNotification_72_1.cfm" />

<cfif notificationStatus neq "Pending" and uniqueName neq "">
    <!--- If the notification status is not "Pending" and the unique name is not empty, include updateContact template --->
    <cfinclude template="/include/qry/updateContact_72_2.cfm" />
</cfif>

<cfif numberFormat(actionDaysRecurring) neq "0">
    <!--- If actionDaysRecurring is not zero, calculate the newest notification start date and include addNotification template --->
    <cfset newestNotificationStartDate = dateAdd('d', numberFormat(actionDaysRecurring), currentStartDate) />
    <cfinclude template="/include/qry/addNotification_72_3.cfm" />
</cfif>

<cfinclude template="/include/qry/notsnext.cfm" />

<!--- Get the record count of notifications after the current one --->
<cfset notificationsAfter = numberFormat(notsnext.recordcount) />

<cfif notificationsAfter eq "1">
    <!--- If there is one notification after, loop through the results --->
    <cfloop query="notsnext">
        <cfset newNotificationStartDate = dateAdd('d', numberFormat(notsnext.actiondaysno), currentStartDate) />
        <cfinclude template="/include/qry/updatesystem_72_4.cfm" />
    </cfloop>
</cfif>

<cfif notificationsAfter eq "0">
    <!--- If there are no notifications after, include various templates for system updates and checks --->
    <cfinclude template="/include/qry/updatesystem_72_5.cfm" />
    <cfinclude template="/include/qry/checkformaint_72_6.cfm" />

    <cfif checkformaint.recordcount eq "0">
        <!--- If there are no maintenance records, find the system and potentially insert it --->
        <cfinclude template="/include/qry/findSystem_71_7.cfm" />

        <cfif findsystem.recordcount eq "1">
            <cfset systemId = findsystem.systemid />
            <cfinclude template="/include/qry/Insert_72_8.cfm" />
            <cfset session.ftom = "Y" />
            <cfset mode = "1" />
            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<!--- Standards applied: 1, 2, 3, 4, 5, 6, 7, 9, 11. --->