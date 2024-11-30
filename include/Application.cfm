<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<!--- Determine the data source based on the host --->
<cfif host eq "app">
    <cfset Application.dsn = "abo" />
    <cfset rev = "1.2.0" />
<cfelse>
    <cfset Application.dsn = "abod" />
    <cfset rev = rand() />
</cfif>

<!--- Set the default datasource for all queries --->
<cfset setdatasource(Application.dsn) />