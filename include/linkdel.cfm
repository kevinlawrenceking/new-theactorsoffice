<!--- This ColdFusion page processes event and contact information, including setting return URLs based on conditions. --->
<cfparam name="rContactId" default="0" />
<cfparam name="rEventId" default="0" />

<!--- Include the first query template to find event details --->
<cfinclude template="/include/qry/find_150_1.cfm" />
<cfset eventId = find.eventId />

<!--- Include the second query template to delete link details --->
<cfinclude template="/include/qry/deleteLink_150_2.cfm" />

<!--- Check if the return URL is for contact --->
<cfif returnurl eq 'contact'>
    <cfset returnurl = "/app/" & returnurl & "/?contactid=" & rContactId & "&t3=1&tab2_expand=true&secid=178" />
</cfif>

<!--- Check if the return URL is for audition --->
<cfif returnurl eq 'audition'>
    <cfset returnurl = "/app/" & returnurl & "/?contactid=" & rContactId & "&audprojectid=" & audProjectId & "&tab2_expand=true&t3=1&secid=178" />
</cfif>

<!--- Redirect to the constructed return URL --->
<cflocation url="#returnurl#" />

<!---
Modifications made based on the following rules:
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->