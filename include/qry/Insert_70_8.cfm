<!--- This ColdFusion page inserts a new notification into the notifications table for a created maintenance system. --->
<cfquery name="Insert" result="result">
    <!--- Insert a new notification into the notifications table --->
    INSERT INTO `notifications`
    (
        `subtitle`, 
        `userid`, 
        `notifUrl`, 
        `notifTitle`, 
        `notifType`, 
        `contactid`, 
        `read`
    )
    VALUES 
    (
        'Maintenance system created for #new_contactname#', 
        #userid#, 
        '/app/contact/?contactid=#contactid#&t4=1', 
        'Maintenance System Created!',
        'System Added', 
        #contactid#, 
        0
    )
</cfquery>
