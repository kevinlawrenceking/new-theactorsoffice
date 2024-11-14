<!--- This ColdFusion page manages system notifications and user actions based on specific criteria. --->
<cfparam name="add_count" default="0" />
<cfparam name="systemID" default="0" />
<cfparam name="mode" default="0" />
<cfset suStartDate = dateFormat(Now(),'yyyy-mm-dd') />
<cfset currentStartDate = dateFormat(Now(),'yyyy-mm-dd') />

<!--- Include the query for system notifications --->
<cfinclude template="/include/qry/delSystemNotifications.cfm" />

<!--- Include the query to add a system user record --->
<cfinclude template="/include/qry/addSystem_5_1.cfm" />


<!--- Include the query to select actions --->
<cfinclude template="/include/qry/addDaysNo_528_1.cfm" />

<!--- Loop through the addDaysNo query to process actions --->
<cfloop query="addDaysNo">
    <cfset add_action = "Y" />

    <!--- Check if the day is unique --->
    <cfif addDaysNo.isunique is "1">
        <!--- Include the query to check for unique contacts --->
        <cfinclude template="/include/qry/checkUnique_157_8.cfm" />

        <!--- If a unique contact is found, set add_action to "N" --->
        <cfif checkUnique.recordcount is "1">
            <cfset add_action = "N" />
        </cfif>
    </cfif>

    <!--- If adding action is permitted --->
    <cfif add_action is "Y">
        <!--- Calculate the start date based on actionDaysNo and the current date --->
        <cfset notstartdate = dateAdd('d', actionDaysNo, currentStartDate) />

        <!--- Check if the calculated start date is less than or equal to the current date --->
        <cfif notstartdate lte currentStartDate>
            <!--- Include the query to add a notification --->
            <cfinclude template="/include/qry/addNotification_326_1.cfm" />
     
        <cfelse>

            <!--- Include the query to add a notification for future dates --->
          <cfinclude template="/include/qry/addNotification_326_1.cfm" />
          
        </cfif>
    </cfif>
</cfloop>

<!--- Redirect based on the mode parameter --->
<cfif mode is "0">
    <cflocation url="/app/contact/?contactid=#contactid#&t4=1" />
</cfif>
