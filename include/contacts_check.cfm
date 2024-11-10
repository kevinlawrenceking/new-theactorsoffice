<!--- Instantiate the SystemService component --->
<cfset systemService = createObject("component", "services.SystemService")>

<!--- Call the SELfusystems_24634 function to get the query --->
<cfset systemNames = systemService.SELfusystems_24634()> <!--- Standardize variable names and casing --->

<!--- Instantiate the SystemService component --->
<cfset systemService = createObject("component", "services.SystemService")>

<!--- Call the SELfusystemtypes function to get the query --->
<cfset variables.systems = systemService.SELfusystemtypes()>

<!--- Validate that systems is a query and has records --->
<cfif NOT isQuery(variables.systems) OR variables.systems.recordCount EQ 0>
    <cfthrow message="The query returned no results or was not executed properly.">
</cfif>

<!--- This ColdFusion page includes different contact templates based on the device type (mobile or desktop) --->
<cfif devicetype is "mobile"> <!--- Avoid using # symbols within conditional checks unless essential --->
    <!--- Include the template for mobile contacts --->
    <cfinclude template="/include/contacts_all.cfm">
<cfelse>
    <!--- Include the template for desktop contacts --->
    <cfinclude template="/include/contacts.cfm">
</cfif>

<!---
Modifications:
1. Removed cftry and cfcatch blocks entirely.
2. Avoided using # symbols within conditional checks unless essential.
3. Standardized variable names and casing.
--->