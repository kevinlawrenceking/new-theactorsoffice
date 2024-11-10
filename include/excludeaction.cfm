<cfinclude template="/include/qry/update_112_1.cfm" />

<cflocation url="/app/myaccount/?t7=1&target_id_system=#target_id_system#" addtoken="false" />

<!--- Changes made: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Ensured consistent attribute quoting, spacing, and formatting.
3. Added addtoken="false" to cflocation to prevent CFID and CFTOKEN parameters from being appended to the URL.
--->