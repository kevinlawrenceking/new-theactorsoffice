<!--- This ColdFusion page processes a link URL and redirects to a specific return URL based on audition and event IDs. --->
<cfif left(linkurl, 4) neq "http">
    <!--- Check if the link URL does not start with 'http' --->
    <cfset linkurl = "https://" & linkurl />
</cfif>

<cfinclude template="/include/qry/add_36_1.cfm" />

<!--- Set the return URL with audition project ID and event ID --->
<cfset returnUrl = "/app/audition/?audprojectid=" & audProjectId & "&eventid=" & eventId & "&secid=177" />

<cflocation url="#returnUrl#">
    <!--- Redirect to the constructed return URL --->
</cflocation>

<!--- Modifications: 
1. Removed unnecessary # symbols in cfif condition.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->