<!--- This ColdFusion page initializes parameters for a project and includes necessary templates for processing auditions. --->
<cfparam name="newProjectName" default="" />
<cfparam name="newProjectDescription" default="" />
<cfparam name="newAudSubCatID" default="" />
<cfparam name="newUnionID" default="" />
<cfparam name="newNetworkID" default="" />
<cfparam name="newToneID" default="" />
<cfparam name="newContractTypeID" default="" />
<cfparam name="newContactId" default="" />
<cfparam name="isDirect" default="0" />
<cfparam name="isBooked" default="0" />
<cfparam name="isPin" default="0" />
<cfparam name="newAudSourceId" default="0" />

<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Include the first query template for processing auditions --->
<cfinclude template="/include/qry/find_317_1.cfm" />

<!--- Include the audition transfer template --->
<cfinclude template="transfer_audition.cfm" />

<!--- Include the second query template for fixing auditions --->
<cfinclude template="/include/qry/fix_191_9.cfm" />

<!--- Redirect to the auditions import page with the new upload ID --->
<cflocation url="/app/auditions-import/?uploadid=#newUploadId#" addtoken="no">

<!--- 
Modifications were made based on the following rules:
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
5. Standardized variable names and casing.
6. Ensured consistent attribute quoting, spacing, and formatting.
9. Removed `cftry` and `cfcatch` blocks entirely.
10. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->