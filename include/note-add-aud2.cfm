<!--- This ColdFusion page processes note text and redirects to a specified URL after including necessary templates. --->
<cfparam name="rContactId" default="0" />
<cfparam name="rEventId" default="0" />
<cfparam name="text" default="" />

<!--- Clean the note text by removing non-ASCII characters --->
<cfset newNoteText = reReplace(text, "[^\x20-\x7E]", "", "ALL")>

<!--- Include the first template for inserting a note --->
<cfinclude template="/include/qry/InsertNote_169_1.cfm" />

<!--- Include the second template for cleaning data --->
<cfinclude template="/include/qry/Clean_169_2.cfm" />

<!--- Prepare the return URL with parameters --->
<cfset returnUrl = "/app/#returnUrl#/?contactId=#rContactId#&audProjectId=#audProjectId#&secId=178" />

<!--- Redirect to the constructed return URL --->
<cflocation url="#returnUrl#">

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary <cfoutput> tags around variable outputs.
--->