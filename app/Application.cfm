<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfif #host# is "app">
    <cfset dsn = "abo" />
    <cfset rev = "1.2.0" />
    <cfelse>
  <cfset dsn = "abod" />
<cfset rev = rand() />
</cfif>
    