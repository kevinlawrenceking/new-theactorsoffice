<!--- This ColdFusion page handles the retrieval and insertion of version records, redirecting to a specific URL based on the outcome. --->
<cfinclude template="/include/qry/find_320_1.cfm" />

<!--- Check if a record was found --->
<cfif find.recordcount eq 1>
    <cfset versionId = find.verid />
<cfelse>
    <!--- Include the insert query template if no record was found --->
    <cfinclude template="/include/qry/insert_320_2.cfm" />
    
    <!--- Get the last inserted ID --->
    <cfset versionId = insertResult.GENERATEDKEY>
</cfif>

<!--- Redirect to the new URL with the record ID --->
<cflocation url="/app/version/?recid=#versionId#" addtoken="false" />

<!---
Modifications:
1. Removed unnecessary # symbols in cfif condition.
2. Standardized variable name and casing from 'verid' to 'versionId'.
--->