<!--- This ColdFusion page sets up database connection parameters based on the host environment. --->
<cfinclude template="/include/qry/findit_278_1.cfm" />

<cfset currentVersion = int(findit.verid) /> <!--- Standardized variable name and casing --->

<!--- Check the host environment to determine database settings --->
<cfif host eq "app" or host eq "uat">
    <cfset dataSourceName = "abo" />
    <cfset revision = currentVersion />
    <cfset suffix = (host eq "app") ? "_1.5" : "" /> <!--- Maintain consistent and efficient conditional logic --->
    <cfset informationSchema = "actorsbusinessoffice" />
<cfelse>
    <cfset dataSourceName = "abod" />
    <cfset revision = rand() />
    <cfset suffix = "" />
    <cfset informationSchema = "new_development" />
</cfif>

<!--- Changes: 
1. Standardized variable names and casing.
2. Maintain consistent and efficient conditional logic.
--->