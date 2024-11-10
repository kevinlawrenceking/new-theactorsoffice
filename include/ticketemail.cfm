<!--- This ColdFusion page sends an email notification regarding a ticket with the specified details. --->
<cfset newTicketId = ticketid />
<cfmail from="support@theactorsoffice.com" to="#emailto#" subject="TICKET NO #newTicketId# - #emailsubject#" type="HTML" bcc="kevinking7135@gmail.com" cc="#emailcc#">
    <HTML>
        <head>
            <title>TAO TICKET NO #newTicketId#</title>
            <!--- Style Tag in the Head for Email --->
            <style type="text/css">
                body { font-size: 14px; }
            </style>
        </head>
        <body>
            <p>Ticket No. #newTicketId# #emailmessage#</p>
            <!--- Check if email link name and link are provided --->
            <cfif len(trim(emaillinkname)) and len(trim(emaillink))>
                <h4><a href="#emaillink#">#emaillinkname#</a></h4>
            </cfif>
            <p>&nbsp;</p>
            <p>TAO Support</p>
            <p>Automated Message Alert</p>
        </body>
    </HTML>
</cfmail>

<!--- Changes made: 
1. Standardized variable names and casing (new_ticketid to newTicketId).
2. Moved style tag from body to head.
3. Removed unnecessary # symbols within conditional checks.
4. Improved conditional check for emaillinkname and emaillink using len() and trim() functions.
5. Ensured consistent attribute quoting, spacing, and formatting.
--->