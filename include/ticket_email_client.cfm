<!--- This ColdFusion page handles the email notification for completed tickets and redirects to the support details page. --->
<cfparam name="emailUser" default="Y" />
<cfparam name="patchNote" default="" />

<!--- Include the query to find ticket details --->
<cfinclude template="/include/qry/find_303_1.cfm" />

<cfset nextVerId = find.verid />

<!--- Include the query to update ticket status --->
<cfinclude template="/include/qry/update_303_2.cfm" />

<!--- Include the query to get ticket details --->
<cfinclude template="/include/qry/details_303_3.cfm" />

<cfset toEmail = details.userEmail />

<!--- Check if email notification is enabled --->
<cfif emailUser is "Y">
    <cfmail from="support@theactorsoffice.com" failto="kevinking7135@gmail.com" replyto="support@theactorsoffice.com" to="#toEmail#" cc="support@theactorsoffice.com" usessl="true" usetls="true" subject="re: TAO TICKET NO #details.recId#" type="HTML">
        <HTML>
            <head>
                <title>TAO TICKET NO #details.recId#</title>
            </head>
            <body>
                <!--- Style Tag in the Body, not Head, for Email --->
                <style type="text/css">
                    body { font-size: 14px; }
                </style>

                <p>Hi #details.userFirstName#,</p>
                <p>This is to inform you that your ticket (no. #details.recId#) has been completed.</p>

                <!--- Check if there is a response to the ticket --->
                <cfif trim(details.ticketResponse) is not "">
                    <p>#details.ticketResponse#</p>
                </cfif>

                <p>If there are any further issues on this topic, please open another ticket.</p>
                <p>&nbsp;</p>
                <p>Best,</p>
                <p>Kevin King<BR>Lead Developer<BR>The Actor's Office</p>
                <p>&nbsp;</p>

                <!--- Main HTML structure for email --->
                <!--- The rest of the HTML code here... --->

                <hr>
                <h3>Ticket No #details.recId# Details</h3>
                <p>Submitted by #details.col1# on #DateFormat(details.col2, "long")# at #TimeFormat(details.col3, "medium")#</p>
                <p><strong>Type:</strong> #details.ticketType#</p>
                <p><strong>Status:</strong> #details.col5#</p>
                <p><strong>User Details:</strong> #details.ticketDetails#</p>
                <p><strong>Support Response:</strong> #details.ticketResponse#</p>
                <p>Completed by Kevin King on #DateFormat(details.ticketCompletedDate, "long")# at #TimeFormat(details.ticketCompletedDate, "medium")#</p>

            </body>
        </HTML>
    </cfmail>
</cfif>

<!--- Redirect to the support details page --->
<cflocation url="/app/admin-support-details/?recid=#recid#" />

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Avoided using # symbols within conditional checks unless essential.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
--->