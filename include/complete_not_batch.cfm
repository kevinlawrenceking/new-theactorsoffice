<!--- This ColdFusion page processes notifications and updates system information based on user inputs and session data. --->
<cfset debug = "Y" />

<!--- Check if session variable 'mocktoday' is defined and set current start date accordingly --->
<cfif isDefined('session.mocktoday')>
    <cfset currentStartDate = DateFormat(session.mocktoday, 'yyyy-mm-dd') />
<cfelse>
    <!--- If 'mocktoday' is not defined, set current start date to today's date --->
    <cfset currentStartDate = DateFormat(Now(), 'yyyy-mm-dd') />
</cfif>

<!--- Include notification details query --->
<cfinclude template="/include/qry/notsDetails.cfm" />

<!--- Calculate the start date for notifications based on action days recurring --->
<cfset notsStartDate = dateAdd('d', numberFormat(notsDetails.actionDaysRecurring), currentStartDate) />

<!--- Set various notification-related variables from the details query --->
<cfset contactId = notsDetails.contactId />
<cfset newContactName = notsDetails.newContactName />
<cfset systemId = notsDetails.systemId />
<cfset userId = notsDetails.userId />
<cfset actionId = notsDetails.actionId />
<cfset newsUid = notsDetails.newsUid />
<cfset newSystemScope = notsDetails.newSystemScope />
<cfset actionDaysRecurring = notsDetails.actionDaysRecurring />
<cfset uniqueName = notsDetails.uniqueName />
<cfset isUnique = notsDetails.isUnique />

<!--- Set default notification status if not defined --->
<cfif NOT isDefined('notStatus')>
    <Cfset notStatus = "Pending" />
</cfif>

<cfset notEndDate = DateFormat(Now(), 'yyyy-mm-dd') />

<!--- Include the add notification query --->
<cfinclude template="/include/qry/addNotification_71_1.cfm" />

<!--- If notification status is not pending and unique name is provided, update contact --->
<cfif notStatus neq "Pending" and uniqueName neq "">
    <cfinclude template="/include/qry/updateContact_71_2.cfm" />
</cfif>

<!--- If action days recurring is not zero, calculate new start date and include the add notification query --->
<cfif numberFormat(actionDaysRecurring) neq "0">
    <cfset newestNotsStartDate = dateAdd('d', numberFormat(actionDaysRecurring), currentStartDate) />
    <cfinclude template="/include/qry/addNotification_71_3.cfm" />
</cfif>

<!--- Include the next notifications query --->
<cfinclude template="/include/qry/notsNext.cfm" />

<cfset notsAfter = numberFormat(notsNext.recordCount) />

<!--- If there is one notification after, loop through and update system --->
<cfif notsAfter eq "1">
    <cfloop query="notsNext">
        <cfset newNotsStartDate = dateAdd('d', numberFormat(notsNext.actionDaysNo), currentStartDate) />
        <cfinclude template="/include/qry/updateSystem_71_4.cfm" />
    </cfloop>
</cfif>

<!--- If there are no notifications after, perform various updates and checks --->
<cfif notsAfter eq "0">
    <cfinclude template="/include/qry/updateSystem_71_5.cfm" />
    <cfinclude template="/include/qry/checkForMaint_71_6.cfm" />

    <!--- If no maintenance records found, find the system and insert if found --->
    <cfif checkForMaint.recordCount eq "0">
        <cfinclude template="/include/qry/findSystem_71_7.cfm" />

        <cfif findSystem.recordCount eq "1">
            <cfset systemId = findSystem.systemId />
            <cfinclude template="/include/qry/insert_71_8.cfm" />
            <cfset session.ftom = "Y" />
            <cfset mode = "1" />
            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<!--- Modifications: Standardized variable names and casing, removed unnecessary cfoutput tags, improved conditional logic, removed unnecessary # symbols in conditionals, simplified record count logic. --->