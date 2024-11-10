<!--- This ColdFusion page retrieves and processes page details based on the provided RPG ID or page directory. --->
<cfset pageService = createObject("component", "services.PageService")>

<!--- Check if RPG ID is greater than 0 to fetch page details accordingly --->
<cfif rpgid GT 0>
    <cfset findPage = pageService.getPageDetails(pgid=rpgid)>
<cfelse>
    <cfset findPage = pageService.getPageDetails(pgDir=thispage)>
</cfif>

<!--- Check if the retrieved page details are empty --->
<cfif StructIsEmpty(findPage)>
    No record found for the page: #thispage#
    <cfabort>
</cfif>

<!--- Set application and page variables from the retrieved page details --->
<cfset appName = findPage.appname />
<cfset appDescription = findPage.appDescription />
<cfset appAuthor = findPage.appAuthor />
<cfset appLogoName = findPage.appLogoName />
<cfset colorTopBar = (host EQ "uat") ? "Purple" : findPage.colorTopBar />
<cfset colorLeftSideBar = findPage.colorLeftSideBar />
<cfset home = "/app/dashboard" />
<cfset mockToday = findPage.mocktoday />
<cfset mockYN = findPage.mock_yn />
<cfset compId = findPage.compid />
<cfset compName = findPage.compname />
<cfset compDir = findPage.compDir />
<cfset compTable = findPage.compTable />
<cfset compOwner = findPage.compowner />
<cfset pgId = findPage.pgid />
<cfset cookie.pgId = findPage.pgid />
<cfset pgName = findPage.pgname />
<cfset pgDir = findPage.pgDir />
<cfset pgTitle = findPage.pgTitle />
<cfset pgHeading = findPage.pgHeading />
<cfset pgFilename = findPage.pgFilename />
<cfset updateType = findPage.update_type />
<cfset pageTitle = appName & " | " & pgTitle />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Determine host color based on the host name --->
<cfset hostColor = (host EQ "app") ? "##406E8E" : (host EQ "dev") ? "##8b0000" : (host EQ "uat") ? "purple" : (host EQ "chris") ? "green" : (host EQ "new") ? "blue" : (host EQ "kevin") ? "violet" : "" />

<!--- Fetch the page links based on the page ID and version --->
<cfset pageLinks = pageService.getPageLinksByLocation(pgid=findPage.pgid, version="1.1")>

<!--- Fetch the include links for the page --->
<cfset includeLinksArray = pageService.getIncludeLinks(pgid=findPage.pgid)>

<!--- Changes: Removed unnecessary cfoutput tags, standardized variable names and casing, ensured consistent attribute quoting and formatting, removed cftry and cfcatch blocks, used double pound signs for hex color codes. --->