<!--- This ColdFusion page handles the creation of a new contact and redirects to the contact view page. --->
<cfparam name="referContactId" default="" /> <!--- Standardized variable names and casing --->
<!--- Include the query to add a new contact --->
<cfinclude template="/include/qry/add_211_1.cfm" />
<!--- Set the generated key for the current contact --->
<cfset currentId = result.generated_key /> <!--- Standardized variable names and casing --->
<!--- Set the contact ID for further processing --->
<cfset contactId = result.generated_key /> <!--- Standardized variable names and casing --->
<!--- Retrieve the user ID from the session --->
<cfset selectUserId = session.userid /> <!--- Standardized variable names and casing --->
<!--- Set the current contact ID for reference --->
<cfset selectContactId = currentId /> <!--- Standardized variable names and casing --->
<!--- Include the folder setup for the contact --->
<cfinclude template="/include/folder_setup.cfm" />
<!--- Redirect to the contact view page with the newly created contact ID --->
<cflocation url="/app/contact/?contactid=#contactId#&ctaction=view" addtoken="false" /> <!--- Removed unnecessary `<cfoutput>` tags around variable outputs, Ensured consistent attribute quoting, spacing, and formatting --->

<!---
Modifications were made based on these rules:
5. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
6. Ensured consistent attribute quoting, spacing, and formatting.
--->