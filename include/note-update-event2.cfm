<!--- This ColdFusion page processes note information and redirects to a specified URL after cleaning the input. --->
<cfparam name="rContactId" default="0" />
<cfparam name="rEventId" default="0" />
<cfparam name="noteText" default="" />
<cfparam name="noteDetailsHtml" default="" />

<!--- Clean the note text by removing non-ASCII characters --->
<cfset newNoteText = reReplace(noteText, "[^\x20-\x7E]", "", "ALL")>

<!--- Include the update note query --->
<cfinclude template="/include/qry/updateNote_177_1.cfm" />

<!--- Include the clean query --->
<cfinclude template="/include/qry/clean_169_2.cfm" />

<!--- Prepare the return URL with contact and event IDs --->
<cfset returnUrl = "/app/#returnUrl#/?contactId=#rContactId#&eventId=#rEventId#&tab2_expand=true&t3=1" />

<!--- Redirect to the return URL --->
<cflocation url="#returnUrl#">

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
--->