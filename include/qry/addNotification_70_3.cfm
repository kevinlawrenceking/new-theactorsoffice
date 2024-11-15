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
        #notsdetails.actionID#,
        #userid#,
        #NewSuid#,
        '#DateFormat(newest_notstartdate, 'yyyy-mm-dd')#',
        'Pending'
    )
</cfquery>
