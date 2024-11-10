<!--- This ColdFusion page handles redirection based on the selected category. --->
<cfset debug = 'N'>
<!--- Check the category and redirect accordingly --->
<cfif category eq "Contacts">
    <cflocation url="/app/contact/?contactid=#selectedId#" />
<cfelseif category eq "Tags">
    <cflocation url="/app/contacts/?bytag=#selectedId#" />
<cfelse>
    <cflocation url="/app/appoint-update/?eventId=#selectedId#&returnUrl=calendar-appoint&rContactId=0" />
</cfif>

<!--- Changes made: 
1. Standardized variable names and casing.
2. Ensured consistent attribute quoting, spacing, and formatting.
--->