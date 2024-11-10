<!--- This ColdFusion page processes user information and redirects to a contact view page. --->
<cfinclude template="/include/qry/add_82_1.cfm" />

<!--- Set current and contact IDs from the result generated key --->
<cfset currentId = result.generated_key />
<cfset contactId = currentId />

<!--- Set user and contact IDs for session management --->
<cfset selectUserId = session.userid />
<cfset selectContactId = currentId />

<!--- Include folder setup for further processing --->
<cfinclude template="/include/folder_setup.cfm" />

<!--- Redirect to the contact view page with the specified contact ID --->
<cflocation url="/app/contact/?contactid=#contactId#&ctaction=view" addtoken="no" />

<!---
Changes made:
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->