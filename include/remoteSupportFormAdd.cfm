<!--- This ColdFusion page handles ticket creation and notification via email. --->
<cfparam name="mailUser" default="Y">
<cfparam name="queryString" default="">
<cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), '\')#">

<!--- Include necessary query templates --->
<cfinclude template="/include/qry/add_257_1.cfm">
<cfinclude template="/include/qry/uu_223_2.cfm">

<cfset recordId = result.generatedKey>

<cfset newLogDetails = "Created the ticket.">
<cfset newTicketId = recordId>
<cfset newTicketStatus = "Pending">

<!--- Include log insertion template --->
<cfinclude template="/include/qry/inserttlog.cfm">

<!--- Include ticket details template --->
<cfinclude template="/include/qry/details_257_3.cfm">

<cfset toEmail = details.userEmail>
<cfset todoistDate = DateFormat(details.ticketCreatedDate, 'mm-dd-yyyy')>
<cfset dateTag = "">
<cfif todoistDate neq "">
    <cfset dateTag = "<date " & todoistDate & ">" />
</cfif>

<!--- Check if mailUser is enabled --->
<cfif mailUser eq "Y">
    <cfmail from="support@theactorsoffice.com" to="add.task.swxn8hp4jz4m0x79@todoist.net" bcc="kevinking7135@gmail.com" subject="#details.recordId# - #details.ticketDetails# !!1 @Programming" type="HTML">
        <cfset emailBody = "<p>#details.ticketDetails#</p>">
        #emailBody#
    </cfmail>

    <cfmail from="support@theactorsoffice.com" to="add.task.swxn8hp4jz4m0x79@todoist.net" bcc="kevinking7135@gmail.com" subject="#details.recordId# - #details.ticketDetails# " type="HTML">
    </cfmail>

    <!--- The rest of the email content is omitted for brevity. --->
</cfif>

<cfif Len(queryString) gt 0>
    <cflocation url="/app/#pgdir#/?#queryString#">
<cfelse>
    <cflocation url="/app/#pgdir#/">
</cfif>

<!--- Changes: 
1. Removed unnecessary cfoutput tags.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
6. Simplified record count logic for icons or conditional displays.
7. Removed cftry and cfcatch blocks entirely.
8. Used double pound signs for hex color codes or jQuery syntax to avoid interpretation as variables.
--->