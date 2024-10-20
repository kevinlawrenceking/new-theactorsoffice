<!--- This ColdFusion page processes a link URL and redirects to a specific return URL based on audition and event IDs. --->
<cfif #left(linkurl, 4)# is not "http">
    <!--- Check if the link URL does not start with 'http' --->
    <cfset linkurl = "https://#linkurl#" />
</cfif>

<cfinclude template="/include/qry/add_36_1.cfm" />

<cfoutput>
    <!--- Set the return URL with audition project ID and event ID --->
    <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=177" />
</cfoutput>

<cflocation url="#returnurl#">
    <!--- Redirect to the constructed return URL --->
</cflocation>
