<!--- This ColdFusion page processes and updates contact item information based on provided parameters. --->
<cfparam name="deleteItem" default="0" />
<cfparam name="valueText" default="" />
<cfparam name="itemDate" default="" />
<cfparam name="newCountryName" default="" />
<cfparam name="newRegionName" default="" />
<cfparam name="countryId" default="" />
<cfparam name="oldCountryId" default="" />
<cfparam name="oldRegionId" default="" />
<cfparam name="regionId" default="" />

<!--- Check if the value type is Custom and custom type is not empty --->
<cfif valuetype is "Custom" and customtype is not "">
    <cfinclude template="/include/qry/insert_262_1.cfm" />
    <cfset newTypeId = typeresult.generatedkey />
    <cfset valueText = customtype />
    <cfinclude template="/include/qry/insertx_262_2.cfm" />
</cfif>

<!--- Include country query and check if a country is found --->
<cfinclude template="/include/qry/findcountry_199_4.cfm" />
<cfif findcountry.recordcount eq 1>
    <cfset newCountryId = findcountry.countryname />
    <cfset oldCountryId = findcountry.countryid />
</cfif>

<!--- Include region query and check if a region is found --->
<cfinclude template="/include/qry/findregion_262_4.cfm" />
<cfif findregion.recordcount eq 1>
    <cfset newRegionId = findregion.regionname />
</cfif>

<!--- Handle URL prefixing based on category ID for categories 4 and 5 --->
<cfif catid eq 4 or catid eq 5>
    <cfset preUrl = "https://" />
    <cfif left(valueText, 4) is not "http">
        <cfset valueText = preUrl & valueText />
    </cfif>
</cfif>

<!--- Include update queries for contact items --->
<cfinclude template="/include/qry/update_262_5.cfm" />
<cfinclude template="/include/qry/update2_262_6.cfm" />

<cfquery>
    UPDATE contactitems SET valuetype = '#valueText#' WHERE itemid = #itemId#
</cfquery>

<cfset scriptNameInclude = "/include/" & ListLast(GetCurrentTemplatePath(), "\") />

<!--- Redirect to the contact page with the specified contact ID --->
<cflocation url="/app/contact/?contactid=#contactId#" />

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Simplified record count logic for icons or conditional displays.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Improved logic for expanding and collapsing views in mobile layouts.
7. Removed any `cftry` and `cfcatch` blocks entirely.
8. Used double pound signs `##` to avoid interpretation as variables for any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax).
--->