<!--- This ColdFusion page sets up database connection parameters based on the host environment. --->

<cfinclude template="/include/qry/findit_278_1.cfm" />

<cfset current_ver = int(findit.verid) />

<!--- Check the host environment to determine database settings --->
<cfif host eq "app" or host eq "uat">
    
    <cfset dsn = "abo" />
    <cfset rev = current_ver />
    <cfset suffix = <cfif host eq "app"> "_1.5"<cfelse> ""</cfif> />
    <cfset information_schema = "actorsbusinessoffice" />
    
<cfelse>
    
    <cfset dsn = "abod" />
    <cfset rev = rand() />
    <cfset suffix = "" />
    <cfset information_schema = "new_development" />
    
</cfif>
