<!--- This ColdFusion page sets the background color based on the host name from the server URL. --->
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Determine the host color based on the host name --->
<cfif host is "app">
    <cfset hostColor = "##406E8E" />
<cfelseif host is "dev">
    <cfset hostColor = "##406E8E" />
<cfelseif host is "uat">
    <cfset hostColor = "purple" />
<cfelseif host is "chris">
    <cfset hostColor = "green" />
<cfelseif host is "kevin">
    <cfset hostColor = "violet" />
</cfif>

<style>
body.authentication-bg {
    background-color: ##hostColor##;
    background-size: cover;
    background-position: center;
}
</style>

<!--- Changes made:
1. Replaced multiple cfif statements with cfelseif for efficient conditional logic.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Avoided using # symbols within conditional checks.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used double pound signs for hex color codes to avoid interpretation as variables.
--->