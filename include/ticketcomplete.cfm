<!--- This ColdFusion page sends an email notification regarding ticket completion to the user if specified. --->
<cfparam name="emailUser" default="N" />
<cfparam name="patchNote" default="" />

<cfinclude template="/include/qry/find_300_1.cfm" />

<cfset nextVerId = find.verid />

<cfinclude template="/include/qry/update_300_2.cfm" />
<cfinclude template="/include/qry/details_303_3.cfm" />

<cfset toEmail = details.userEmail />

<!--- Check if the email_user parameter is set to "Y" to send the email --->
<cfif emailUser is "Y">
    <cfmail from="support@theactorsoffice.com" failto="kking@theactorsoffice.com" replyto="support@theactorsoffice.com" to="#toEmail#" bcc="kking@theactorsoffice.com" usessl="true" usetls="true" subject="re: TAO TICKET NO #details.recId#" type="HTML">
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
                <cfif trim(details.ticketResponse) is not "">
                    <p>#details.ticketResponse#</p>
                </cfif>
                <p>If there are any further issues on this topic, please open another ticket.</p>
                <p>&nbsp;</p>
                <p>Best,</p>
                <p>Kevin</p>
                <p>&nbsp;</p>
                <!--- Email signature and other details here --->
                <!--- Ticket details here --->
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

<!--- Redirect to the admin support page --->
<cflocation url="/app/admin-support/" />

<!--- Changes: Standardized variable names and casing (Rule 5), Removed unnecessary cfoutput tags (Rule 2), Removed unnecessary pound signs in conditional checks (Rule 3), Ensured consistent attribute quoting, spacing, and formatting (Rule 6), Used uniform date and time formatting across the code (Rule 7) --->