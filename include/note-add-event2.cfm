<!--- This ColdFusion page processes note text and redirects to a specified URL after including necessary templates. ---> 
<cfparam name="rContactId" default="0" /> 
<cfparam name="rEventId" default="0" /> 
<cfparam name="text" default="" /> 

<!--- Clean the note text by removing non-ASCII characters ---> 
<cfset newNoteText = reReplace(text, "[^\x20-\x7E]", "", "ALL")> 

<!--- Include the first query template for inserting a note ---> 
<cfinclude template="/include/qry/InsertNote_171_1.cfm" /> 

<!--- Include the second query template for cleaning up ---> 
<cfinclude template="/include/qry/CLEAN_169_2.cfm" /> 

<!--- Prepare the return URL with contact and event IDs ---> 
<cfset returnUrl = "/app/#returnUrl#/?contactid=" & rContactId & "&eventid=" & rEventId & "&tab2_expand=true&t3=1" />

<!--- Redirect to the constructed return URL ---> 
<cflocation url="#returnUrl#" />

<!--- Changes: Standardized variable names and casing (Rule 5), Removed unnecessary cfoutput tags around variable outputs (Rule 2), Avoided using # symbols within conditional checks unless essential (Rule 3) --->