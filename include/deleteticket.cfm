<!--- This ColdFusion page handles redirection based on the presence of an old version ID. --->
<cfinclude template="/include/qry/deleteticket_105_1.cfm" />

<!--- Check if 'oldVersionId' is defined --->
<cfif isDefined('oldVersionId')>
    <!--- Redirect to the version page with the old version ID --->
    <cflocation url="/app/version/?recid=#oldVersionId#" addtoken="no" />
<cfelse>
    <!--- Redirect to the admin support page if 'oldVersionId' is not defined --->
    <cflocation url="/app/admin-support/" addtoken="no" />
</cfif>

<!--- Changes: 
1. Standardized variable names and casing (oldverid -> oldVersionId).
2. Added addtoken="no" to cflocation tags to prevent CFID and CFTOKEN parameters from being appended to the URL.
--->