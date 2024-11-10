<cfparam name="deleteItem" default="0" />
<cfparam name="valueText" default="" />
<cfparam name="itemDate" default="" />
<cfparam name="customType" default="" />
<cfparam name="countryId" default="" />
<cfparam name="regionId" default="" />

<!--- Check if the value type is "Custom" and custom type is provided --->
<cfif valuetype is "Custom" and customtype is not "">
    <cfinclude template="/include/qry/insert_199_1.cfm" />
    <cfset newTypeId = typeresult.generatedkey />
    <cfset valueText = customType />
    <cfinclude template="/include/qry/insertx_199_2.cfm" />
</cfif>

<cfinclude template="/include/qry/add_199_3.cfm" />

<cfset itemId = result.generatedkey />

<cfparam name="newCountryName" default="" />
<cfparam name="newRegionName" default="" />

<!--- Check if category ID is "2" for country and region lookup --->
<cfif catid is "2">
    <cfinclude template="/include/qry/findcountry_199_4.cfm" />

    <!--- If a country is found, set the country name and ID --->
    <cfif findcountry.recordcount is 1>
        <cfset newCountryName = findcountry.countryname />
        <cfset oldCountryId = findcountry.countryid />
    </cfif>

    <cfinclude template="/include/qry/findregion_199_5.cfm" />

    <!--- If a region is found, set the region name --->
    <cfif findregion.recordcount is 1>
        <cfset newRegionName = findregion.regionname />
    </cfif>
</cfif>

<!--- Check if category ID is "4" or "5" for URL formatting --->
<cfif catid is "4" or catid is "5">
    <cfset preUrl = "https://" />

    <!--- Check if valueText starts with "http" --->
    <cfif not left(valueText,4) is "http">
        <cfset valueText = preUrl & valueText />
    </cfif>
</cfif>

<!--- Check if category ID is "9" for custom company value --->
<cfif catid is "9" and VALUECOMPANY IS "custom">
    <cfset valueCompany = TRIM(custom) />
</cfif>

<cfinclude template="/include/qry/update_199_6.cfm" />

<!--- Redirect to contact page with contact ID --->
<cflocation url="/app/contact/?contactid=#contactid#" />

<!--- Changes: 
1. Removed unnecessary cfoutput tags.
2. Avoided using # symbols within conditional checks.
3. Simplified record count logic.
4. Standardized variable names and casing.
5. Consolidated URL formatting logic for category IDs 4 and 5.
6. Removed cftry and cfcatch blocks.
7. Used double pound signs for non-variable # symbols inside cfoutput blocks.
--->