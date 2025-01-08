<!--- This ColdFusion page processes notifications and updates system information based on user input and session data. --->

<cfparam name="src" default="c"/>
<cfset dbug="Y"/>

<!--- Check if session variable 'mocktoday' is defined and set currentStartDate accordingly --->
<cfif #isdefined('session.mocktoday')#>
  <Cfset currentStartDate="#DateFormat(session.mocktoday,'yyyy-mm-dd')#"/>
<cfelse>
  <Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#"/>
</cfif>

<cfif #dbug# is "Y">
<cfoutput>
<p>CurrentStartDate: #currentStartDate#</p>
</cfoutput>
</cfif>

<!--- Include the notification details query --->
<cfinclude template="/include/qry/getNotificationByID.cfm"/>
<h3>Get Notification By ID</h3>

      <p>  SELECT 
            su.contactid, 
            su.userid, 
            n.notid, 
            s.systemid, 
            s.systemscope AS newsystemscope, 
            n.actionid, 
            su.suID AS newsuid, 
            au.actionDaysRecurring, 
            a.uniquename, 
            a.IsUnique, 
            u.recordname AS new_contactname
        FROM 
            funotifications n
        INNER JOIN 
            fusystemusers su ON su.suid = n.suid
        INNER JOIN 
            contactdetails c ON c.contactID = su.contactid
        INNER JOIN 
            fusystems s ON s.systemID = su.systemID
        INNER JOIN 
            actionusers au ON au.actionid = n.actionid
        INNER JOIN 
            fuactions a ON a.actionid = au.actionid
        INNER JOIN 
            taousers u ON u.userid = n.userid
        WHERE 
            n.notID = #arguments.notid#
            AND au.userid = n.userid</p>
<cfabort>
<!--- Calculate the start date for notifications based on actionDaysRecurring --->
<cfset notstartdate=dateAdd('d', numberformat(NotificationDetails.actionDaysRecurring), currentStartDate)/>

<cfoutput>
  <!--- Set various contact and notification details from the query results --->
  <cfset contactid="#NotificationDetails.contactid#"/>
  <cfset new_contactname="#NotificationDetails.new_contactname#"/>
  <cfset systemid="#NotificationDetails.systemid#"/>
  <cfset userid="#NotificationDetails.userid#"/>
  <cfset actionid="#NotificationDetails.actionid#"/>
  <cfset newsuid=#NotificationDetails.newsuid#/>
  <cfset newsystemscope="#NotificationDetails.newsystemscope#"/>
  <cfset actionDaysRecurring="#NotificationDetails.actionDaysRecurring#"/>
  <cfset uniquename="#NotificationDetails.uniquename#"/>
  <cfset IsUnique="#NotificationDetails.IsUnique#"/>

  <!--- Set default notification status if not defined --->
  <cfif NOT #isdefined('notstatus')#>
    <Cfset notstatus="Pending"/>
  </cfif>

  <cfset notEndDate="#DateFormat(Now(),'yyyy-mm-dd')#"/>
</cfoutput>

<!--- Include the add notification query --->
<cfinclude template="/include/qry/updateNotificationCompleted.cfm"/>

<!--- If notstatus is not "Pending" and uniquename is not empty, update contact --->
<cfif #notstatus# is not "Pending" and #uniquename#is not "">
  <cfinclude template="/include/qry/updateContactUnique.cfm"/>
</cfif>

<!--- If actionDaysRecurring is not zero, calculate the newest start date and add notification --->
<Cfif #numberformat(actionDaysRecurring)# is not "0">
  <cfset newest_notstartdate=dateAdd('d', numberformat(actionDaysRecurring), currentStartDate)/>
  <cfinclude template="/include/qry/addNotification.cfm"/>
</Cfif>

<!--- Include the next notifications query --->
<cfinclude template="/include/qry/getNotificationsBySystem.cfm"/>

<!--- If there is one notification after, loop through and update system --->
<cfif #notsafter# is "1">
  <cfloop query="notsnext">
    <cfset new_notstartdate=dateAdd('d', numberformat(notsnext.actiondaysno), currentStartDate)/>
    <cfinclude template="/include/qry/updateNotificationNext.cfm"/>
  </cfloop>
</cfif>

<!--- If there are no notifications after, perform maintenance checks and updates --->

<cfif #notsafter# is "0">

  <!--- No more notifications for this system, so change to "Completed" --->

  <cfinclude template="/include/qry/updateSystemUserCompleted.cfm"/>

  <cfinclude template="/include/qry/handleMaintenanceSystem.cfm"/>




      

      <cfset session.ftom="Y"/>

      <cfinclude template="/include/add_system.cfm"/>
    </cfif>

<Cfif #dbug# is "Y"><cfabort></cfif>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#"/>

<!--- Redirect based on the value of src --->
<cfif #src# is "c">
  <cflocation url="/app/contact?contactid=#contactid#&t4=1&hide_completed=#hide_completed#"/>
</cfif>

<cfif #src# is "d">
  <cflocation url="/app/dashboard_new/"/>
</cfif>
