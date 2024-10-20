<!--- This ColdFusion page processes notifications and updates system information based on user input and session data. --->

<cfparam name="src" default="c" />
<cfset dbug="Y" />

<!--- Check if session variable 'mocktoday' is defined and set currentStartDate accordingly --->
<cfif #isdefined('session.mocktoday')#>
    <Cfset currentStartDate="#DateFormat(session.mocktoday,'yyyy-mm-dd')#" />
</cfif>

<!--- If 'mocktoday' is not defined, set currentStartDate to today's date --->
<cfif NOT #isdefined('session.mocktoday')#>
    <Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
</cfif>

<!--- Include the notification details query --->
<cfinclude template="/include/qry/notsdetails.cfm" />

<!--- Calculate the start date for notifications based on actionDaysRecurring --->
<cfset notstartdate=dateAdd('d', numberformat(notsdetails.actionDaysRecurring), currentStartDate) />

<cfoutput>
    <!--- Set various contact and notification details from the query results --->
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
</cfoutput>

<!--- Include the add notification query --->
<cfinclude template="/include/qry/addNotification_70_1.cfm" />

<!--- If notstatus is not "Pending" and uniquename is not empty, update contact --->
<cfif #notstatus# is not "Pending" and #uniquename# is not="">
    <cfinclude template="/include/qry/updateContact_70_2.cfm" />
</cfif>

<!--- If actionDaysRecurring is not zero, calculate the newest start date and add notification --->
<Cfif #numberformat(actionDaysRecurring)# is not "0">
    <cfset newest_notstartdate=dateAdd('d', numberformat(actionDaysRecurring), currentStartDate) />
    <cfinclude template="/include/qry/addNotification_70_3.cfm" />
</Cfif>

<!--- Include the next notifications query --->
<cfinclude template="/include/qry/notsnext.cfm" />

<cfset notsafter=numberformat(notsnext.recordcount) />
<cfoutput>notsafter: #notsafter#</cfoutput>

<!--- If there is one notification after, loop through and update system --->
<cfif #notsafter# is "1">
    <cfloop query="notsnext">
        <cfset new_notstartdate=dateAdd('d', numberformat(notsnext.actiondaysno), currentStartDate) />
        <cfinclude template="/include/qry/updatesystem_70_4.cfm" />
    </cfloop>
</cfif>

<!--- If there are no notifications after, perform maintenance checks and updates --->
<cfif #notsafter# is "0">
    <cfinclude template="/include/qry/updatesystem_70_5.cfm" />
    <cfinclude template="/include/qry/checkformaint_70_6.cfm" />

    <!--- If no records found in checkformaint, find the system and insert if found --->
    <cfif #checkformaint.recordcount# is "0">
        <cfinclude template="/include/qry/findSystem_70_7.cfm" />
        <cfif #findsystem.recordcount# is "1">
            <cfset systemid=findsystem.systemid />
            <cfinclude template="/include/qry/Insert_72_8.cfm" />
            <cfset session.ftom="Y" />
            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<cfoutput>#session.zquery#</cfoutput>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<!--- Redirect based on the value of src --->
<cfif #src# is "c">
    <cflocation url="/app/contact?contactid=#contactid#&t4=1&hide_completed=#hide_completed#" />
</cfif>

<cfif #src# is "d">
    <cflocation url="/app/dashboard_new/" />
</cfif>

