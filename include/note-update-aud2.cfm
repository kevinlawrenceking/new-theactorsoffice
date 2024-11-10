<!--- This ColdFusion page processes note updates and redirects to a specified URL based on parameters. --->
<cfparam name="rContactId" default="0" />
<cfparam name="noteText" default="" />
<cfparam name="noteDetailsHtml" default="" />

<!--- Clean the note text by removing non-ASCII characters --->
<cfset newNoteText = reReplace(noteText, "[^\x20-\x7E]", "", "ALL")>

<!--- Include the update note query template --->
<cfinclude template="/include/qry/updateNote_175_1.cfm" />

<!--- Include the clean query template --->
<cfinclude template="/include/qry/clean_169_2.cfm" />

<!--- Prepare the return URL for redirection --->
<cfset returnUrl = "/app/#returnUrl#/?audProjectId=#audProjectId#&contactId=#rContactId#&secId=178" />

<!--- Redirect to the return URL --->
<cflocation url="#returnUrl#" />

<!--- Changes: Standardized variable names and casing (Rule 5), Removed unnecessary `<cfoutput>` tags around variable outputs (Rule 2) --->