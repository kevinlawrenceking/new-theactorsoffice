<!--- This ColdFusion page processes notifications and updates system information based on user inputs and session data. --->

<cfset dbug="Y" />

<!--- Check if session variable 'mocktoday' is defined and set current start date accordingly --->
<cfif #isdefined('session.mocktoday')#>
    <Cfset currentStartDate="#DateFormat(session.mocktoday,'yyyy-mm-dd')#" />
</cfif>

<!--- If 'mocktoday' is not defined, set current start date to today's date --->
<cfif NOT #isdefined('session.mocktoday')#>
    <Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
</cfif>

<!--- Include notification details query --->
<cfinclude template="/include/qry/notsdetails.cfm" />

<!--- Calculate the start date for notifications based on action days recurring --->
<cfset notstartdate=dateAdd('d', numberformat(notsdetails.actionDaysRecurring), currentStartDate) />

<cfoutput>
    <!--- Set various notification-related variables from the details query --->
    <cfset contactid="#notsdetails.contactid#" />
    <cfset new_contactname="#notsdetails.new_contactname#" />
    <cfset systemid="#notsdetails.systemid#" />
    <cfset userid="#notsdetails.userid#" />
    <cfset actionid="#notsdetails.actionid#" />
    <cfset newsuid=#notsdetails.newsuid# />
    <cfset newsystemscope="#notsdetails.newsystemscope#" />
    <cfset actionDaysRecurring="#notsdetails.actionDaysRecurring#" />
    <cfset uniquename="#notsdetails.uniquename#" />
    <cfset IsUnique="#notsdetails.IsUnique#" />

    <!--- Set default notification status if not defined --->
    <cfif NOT #isdefined('notstatus')#>
        <Cfset notstatus="Pending" />
    </cfif>

    <cfset notEndDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
    
    notid:#notid# (#notsdetails.recordcount#)<BR>
</cfoutput>

<!--- Include the add notification query --->
<cfinclude template="/include/qry/addNotification_71_1.cfm" />

<!--- If notification status is not pending and unique name is provided, update contact --->
<cfif #notstatus# is not "Pending" and #uniquename#is not "">
    <cfinclude template="/include/qry/updateContact_71_2.cfm" />
</cfif>

<!--- If action days recurring is not zero, calculate new start date and include the add notification query --->
<Cfif #numberformat(actionDaysRecurring)# is not "0">
    <cfset newest_notstartdate=dateAdd('d', numberformat(actionDaysRecurring), currentStartDate) />
    <cfinclude template="/include/qry/addNotification_71_3.cfm" />
</Cfif>

<!--- Include the next notifications query --->
<cfinclude template="/include/qry/notsnext.cfm" />

<cfset notsafter=numberformat(notsnext.recordcount) />
<cfoutput>notsafter: #notsafter#</cfoutput>

<!--- If there is one notification after, loop through and update system --->
<cfif #notsafter# is "1">
    <cfloop query="notsnext">
        <cfset new_notstartdate=dateAdd('d', numberformat(notsnext.actiondaysno), currentStartDate) />
        <cfinclude template="/include/qry/updatesystem_71_4.cfm" />
    </cfloop>
</cfif>

<!--- If there are no notifications after, perform various updates and checks --->
<cfif #notsafter# is "0">
    <cfinclude template="/include/qry/updatesystem_71_5.cfm" />
    <cfinclude template="/include/qry/checkformaint_71_6.cfm" />

    <!--- If no maintenance records found, find the system and insert if found --->
    <cfif #checkformaint.recordcount# is "0">
        <cfinclude template="/include/qry/findSystem_71_7.cfm" />
        <cfif #findsystem.recordcount# is "1">
            <cfset systemid=findsystem.systemid />
            <cfinclude template="/include/qry/Insert_71_8.cfm" />
            <cfset session.ftom="Y" />
            <cfset mode="1" />
            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<cfoutput>#session.zquery#</cfoutput>
