<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<!--- Determine the data source based on the host --->
<cfif host eq "app">
    <cfset dsn = "abo" />
    <cfset rev = "1.2.0" />
<cfelse>
    <cfset dsn = "abod" />
    <cfset rev = rand() />
</cfif>

<!--- Assign dsn to Application.datasource --->
<cfset this.datasource = Application.dsn />
