<!--- This ColdFusion page processes account-related actions and redirects based on the results of queries. ---> 
<cfparam name="target" default="myaccount" /> 
<cfparam name="version" default="1" /> <!--- Standardized variable names and casing ---> 

<!--- Include the query to find records based on certain criteria ---> 
<cfinclude template="/include/qry/find_242_1.cfm" /> 

<!--- Check if any records were found ---> 
<cfif find.recordcount is not 0> <!--- Removed unnecessary # symbols within conditional checks --->
    <cfset version = find.recordcount /> <!--- Standardized variable names and casing --->
</cfif> 

<cfset preUrl = "https://" /> <!--- Standardized variable names and casing ---> 

<!--- Check if the new site URL starts with "http" ---> 
<cfif left(newSiteUrl, 4) is "http"> <!--- Removed unnecessary # symbols within conditional checks and standardized variable names and casing --->
    <!--- No action needed if it starts with "http" ---> 
<cfelse> 
    <!--- Prepend the preUrl to the new site URL ---> 
    <cfset newSiteUrl = preUrl & newSiteUrl /> <!--- Removed unnecessary cfoutput tags around variable outputs and standardized variable names and casing --->
</cfif> 

<!--- Include the query to add records based on certain criteria ---> 
<cfinclude template="/include/qry/add_242_2.cfm" /> 

<!--- Now, lastInsertedId contains the ID of the newly inserted record ---> 
<cfinclude template="/include/customIconSingle.cfm" /> <!--- Standardized variable names and casing --->

<!--- Redirect to the target account page with the appropriate parameters ---> 
<cflocation url="/app/#target#/?t1=1&target_id=#targetId#" /> <!--- Standardized variable names and casing --->

<!--- Changes: Removed unnecessary cfoutput tags, # symbols within conditional checks, standardized variable names and casing --->