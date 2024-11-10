<!--- This ColdFusion page updates site link details and redirects to the target page. --->
<cfparam name="deleteLink" default="0" />
<cfparam name="version" default="1" />

<!--- Initialize the SiteLinksService --->
<cfset siteLinksService = createObject("component", "services.SiteLinksService")>

<!--- Update site link details with provided parameters --->
<cfset siteLinksService.updateSiteLinkDetails( 
    newId = newId, 
    userId = userId, 
    newSiteName = newSiteName, 
    newSiteUrl = newSiteUrl, 
    newIsCustom = newIsCustom, 
    deleteLink = deleteLink 
)>

<!--- Prepare corrected URL --->
<cfif left(newSiteUrl, 8) neq "https://" and left(newSiteUrl, 7) neq "http://">
    <cfset correctedNewSiteUrl = "https://" & newSiteUrl />
<cfelse>
    <cfset correctedNewSiteUrl = newSiteUrl />
</cfif>

<!--- Call the update function from SiteLinksService --->
<cfset siteLinksService.updateSiteLink( 
    newId = newId, 
    newSiteUrl = correctedNewSiteUrl, 
    newSiteName = (newIsCustom eq "1" ? newSiteName : ""), 
    deleteLink = (deleteLink eq "1"), 
    version = (version neq "" ? version : "") 
)>

<!--- Redirect to the target page --->
<cflocation url="/app/#target#/?t1=1&target_id=#targetId#" />

<!--- Changes made:
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->