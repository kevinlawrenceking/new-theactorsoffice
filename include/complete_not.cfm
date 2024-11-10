<!--- This ColdFusion page processes notifications and updates system information based on user input and session data. --->
<cfparam name="src" default="c" />
<cfset debug="Y" />

<!--- Check if session variable 'mocktoday' is defined and set currentStartDate accordingly --->
<cfif isDefined('session.mocktoday')>
    <cfset currentStartDate = DateFormat(session.mocktoday, 'yyyy-mm-dd') />
<cfelse>
    <!--- If 'mocktoday' is not defined, set currentStartDate to today's date --->
    <cfset currentStartDate = DateFormat(Now(), 'yyyy-mm-dd') />
</cfif>

<!--- Include the notification details query --->
<cfinclude template="/include/qry/notsDetails.cfm" />

<!--- Calculate the start date for notifications based on actionDaysRecurring --->
<cfset notsStartDate = dateAdd('d', numberFormat(notsDetails.actionDaysRecurring), currentStartDate) />

<!--- Set various contact and notification details from the query results --->
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
    <Cfset notStatus="Pending" />
</cfif>

<cfset notEndDate = DateFormat(Now(), 'yyyy-mm-dd') />

<!--- Include the add notification query --->
<cfinclude template="/include/qry/addNotification_70_1.cfm" />

<!--- If notStatus is not "Pending" and uniqueName is not empty, update contact --->
<cfif notStatus neq "Pending" and uniqueName neq "">
    <cfinclude template="/include/qry/updateContact_70_2.cfm" />
</cfif>

<!--- If actionDaysRecurring is not zero, calculate the newest start date and add notification --->
<cfif numberFormat(actionDaysRecurring) neq "0">
    <cfset newestNotsStartDate = dateAdd('d', numberFormat(actionDaysRecurring), currentStartDate) />
    <cfinclude template="/include/qry/addNotification_70_3.cfm" />
</cfif>

<!--- Include the next notifications query --->
<cfinclude template="/include/qry/notsNext.cfm" />

<cfset notsAfter = numberFormat(notsNext.recordCount) />

<!--- If there is one notification after, loop through and update system --->
<cfif notsAfter eq "1">
    <cfloop query="notsNext">
        <cfset newNotsStartDate = dateAdd('d', numberFormat(notsNext.actionDaysNo), currentStartDate) />
        <cfinclude template="/include/qry/updateSystem_70_4.cfm" />
    </cfloop>
</cfif>

<!--- If there are no notifications after, perform maintenance checks and updates --->
<cfif notsAfter eq "0">
    <cfinclude template="/include/qry/updateSystem_70_5.cfm" />
    <cfinclude template="/include/qry/checkForMaint_70_6.cfm" />

    <!--- If no records found in checkForMaint, find the system and insert if found --->
    <cfif checkForMaint.recordCount eq "0">
        <cfinclude template="/include/qry/findSystem_70_7.cfm" />

        <cfif findSystem.recordCount eq "1">
            <cfset systemId = findSystem.systemId />
            <cfinclude template="/include/qry/insert_72_8.cfm" />
            <cfset session.ftom = "Y" />
            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<!--- Redirect based on the value of src --->
<cfif src eq "c">
    <cflocation url="/app/contact?contactId=#contactId#&t4=1&hide_completed=#hideCompleted#" />
<cfelseif src eq "d">
    <cflocation url="/app/dashboard_new/" />
</cfif>

<!--- Changes: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
6. Removed cftry and cfcatch blocks entirely.
7. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->