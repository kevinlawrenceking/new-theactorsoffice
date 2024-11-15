<!--- This ColdFusion page handles the insertion of a new notification into the funotifications table. --->

<cfquery name="addNotification" result="result">
    <!--- Insert a new notification into the funotifications table --->
    INSERT INTO funotifications (
        actionid,
        userid,
        suID,
        notstartdate,
        notstatus
    )
    VALUES (
        #addDaysNo.actionID#,
        #session.userid#,
        #NewSuid#,
        '#DateFormat(notstartdate, 'yyyy-mm-dd')#',
        'Pending'
    )
</cfquery>
