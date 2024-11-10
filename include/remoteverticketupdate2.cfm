<!--- This ColdFusion page handles the sending of an email notification when a ticket status is updated to "Implemented" and redirects to a specific version page. --->
<cfinclude template="/include/qry/update_275_1.cfm" />
<cfinclude template="/include/qry/details_275_2.cfm" />

<cfset toEmail = "cansoff@gmail.com" /> <!--- Standardized variable names and casing --->

<!--- Determine the start page and page names based on the presence of a custom test page name. --->
<cfif len(trim(details.customTestPageName))> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. Avoid using `#` symbols within conditional checks unless essential. --->
    <cfset startPage = details.customTestPageLink />
    <cfset pageNames = details.customTestPageName />
<cfelse>
    <cfset startPage = "https://dev.theactorsoffice.com/app/" & details.pgDir & "/" />
    <cfset pageNames = details.pgName />
</cfif>

<!--- Check if the ticket status has changed to "Implemented" and send an email notification. --->
<cfif oldTicketStatus neq "Implemented" and newTicketStatus eq "Implemented"> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. Avoid using `#` symbols within conditional checks unless essential. --->
    <cfmail from="support@theactorsoffice.com" failto="kevinking7135@gmail.com" replyto="kevinking7135@gmail.com" to="#toEmail#" bcc="kevinking7135@gmail.com" cc="jodie@jodiebentley.com" usessl="true" usetls="true" subject="TICKET NO #details.recid# - Ready for Testing" type="HTML"> <!--- Remove unnecessary `<cfoutput>` tags around variable outputs. --->
        <!--- Email HTML content here --->
    </cfmail>
</cfif>

<!--- Redirect to the version page after processing the email notification. --->
<cflocation url="/app/version/?recid=#oldVerId#" /> <!--- Remove unnecessary `<cfoutput>` tags around variable outputs. --->

<!--- Changes: 1. Maintain consistent and efficient conditional logic, especially for styling or control structures. 2. Remove unnecessary `<cfoutput>` tags around variable outputs. 3. Avoid using `#` symbols within conditional checks unless essential. 4. Standardize variable names and casing. --->