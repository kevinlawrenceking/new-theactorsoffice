<!--- This ColdFusion page retrieves ticket details along with user and page information based on a specific ticket ID. --->

<cfquery name="details">
    <!--- Select relevant fields from the tickets, users, and pages tables --->
    SELECT 
        u.isbetatester,
        p.pgid,
        t.ticketID AS recID,
        t.ticketID AS pk,
        CONCAT(u.userfirstname, ' ', u.userlastname) AS col1,
        'User' AS head1,
        'Date' AS head2,
        'Time' AS head3,
        'Page' AS head4,
        'Status' AS head5,
        'Title' AS head6,
        u.useremail,
        u.userfirstname,
        'Response' AS head7,
        'Completed' AS head8,
        t.ticketResponse AS col7,
        t.ticketCompletedDate AS col8,
        t.ticketdetails,
        CONCAT(u.userfirstname, ' ', u.userlastname) AS col1,
        t.ticketCreatedDate AS col2,
        t.ticketCreatedDate AS col3,
        p.pgname AS col4,
        t.ticketStatus AS col5,
        t.ticketName AS col6,
        t.ticketResponse,
        t.ticketCompletedDate,
        p.pgname,
        t.tickettype,
        p.pgdir,
        t.complete_email,
        t.initial_email
    FROM 
        tickets t
    INNER JOIN 
        taousers u ON u.userid = t.userid
    INNER JOIN 
        pgpages p ON p.pgid = t.pgid
    WHERE 
        t.ticketid = #recid#
</cfquery>
