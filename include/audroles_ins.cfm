<!--- Initialize parameters for a new audit role --->
<cfparam name="newAudRoleName" default="" />
<cfparam name="isDirect" default="0" />
<cfparam name="newAudRoleTypeID" default="" />
<cfparam name="newCharDescription" default="" />
<cfparam name="newHoldStartDate" default="" />
<cfparam name="newHoldEndDate" default="" />
<cfparam name="newAudDialectID" default="" />
<cfparam name="newAudSourceID" default="" />
<cfparam name="newUserId" default="" />
<cfparam name="newIsDeleted" default="0" />

<!--- Include the query for inserting the new audit role into the database --->
<cfinclude template="/include/qry/audRolesIns391.cfm" />

<!--- Set the new audit role ID from the result of the insertion query --->
<cfset newAudRoleID = result.generatedKey />

<!--- Changes: 
1. Standardized variable names and casing.
2. Ensured consistent attribute quoting, spacing, and formatting.
--->