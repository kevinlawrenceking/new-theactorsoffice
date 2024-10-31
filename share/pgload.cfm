<CFINCLUDE template="remote_load.cfm" />

<!--- Default Parameters --->
<cfparam name="u" default="434F6AD485112F73A9" />
<cfparam name="pgaction" default="view" />
<cfparam name="subdomain" default="app" />
<cfparam name="thispage2" default="" />
<cfparam name="rpgid" default="0" />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Debugging or Utility Outputs --->
<cfoutput>
    <cfset thisPath = ExpandPath("*.*") />
    <cfset thisDirectory = "#GetDirectoryFromPath(thisPath)#" />
</cfoutput>

<cfparam name="catArea_UCB" default="C" />
<cfparam name="contactid" default="0" />

<!--- Load the UserService --->
<cfset userService = createObject("component", "services.UserService")>

<!--- Fetch the user data using the UserService --->
<cfset userData = userService.getUserByHash(u) />

<!--- Check if user data was found --->
<cfif structIsEmpty(userData)>
    <cfoutput>Not found!</cfoutput>
    <cfabort>
<cfelse>
    <!--- Map user data to local variables --->
    <cfset userid = userData.userId />
    <cfset userContactid = userData.userContactID />
    <cfset userCalStarttime = userData.calstarttime />
    <cfset userCalendtime = userData.calendtime />
    <cfset avatarname = userData.avatarname />
    <cfset isbetatester = userData.isBetaTester />
    <cfset defrows = userData.defRows + 1 />
    <cfset defcountry = userData.defCountry />
    <cfset defState = userData.defState />
    <cfset tzid = userData.tzid />
    <cfset customerid = userData.customerid />
    <cfset userFirstName = userData.firstName />
    <cfset userLastName = userData.lastName />
    <cfset userEmail = userData.email />
    <cfset userRole = userData.userRole />

    <cfif userContactid EQ contactid>
        <cfset catArea_UCB = "U" />
    </cfif>
</cfif>

<!--- Fetch page data --->
<cfquery name="FindPage">
    SELECT
        a.appname, a.appAuthor, c.compname, p.pgname,
        a.appId, a.appDescription, a.appLogoName,
        a.colorTopBar, a.colorLeftSideBar, a.mocktoday,
        a.mock_yn, c.compid, c.compDir, c.compTable,
        c.compowner, c.compIcon, c.menuYN, c.menuOrder,
        c.compInner, c.compRecordName, c.compActive,
        p.pgid, p.pgDir, p.pgTitle, p.pgHeading, p.pgFilename,
        p.datatables_YN, p.fullcalendar_YN, p.editable_YN,
        p.newdatatables_YN, p.pk, p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    WHERE p.pgDir = 'share'
</cfquery>

<cfif FindPage.RecordCount EQ 1>
    <!--- Fetch related links and components --->
    <cfquery name="FindLinksT">
        SELECT
            l.linkid, l.linkurl, l.linkname, l.linktype,
            l.link_no, l.linkloc_tb, l.pluginname,
            l.rel, l.hrefid
        FROM pgapplinks l
        INNER JOIN pgplugins p ON p.pluginName = l.pluginname
        INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
        INNER JOIN pgpages g ON g.pgid = x.pgid
        WHERE g.pgid = 11 AND l.linkloc_tb = 't'
        ORDER BY l.link_no
    </cfquery>

    <cfquery name="FindLinksB">
        SELECT
            l.linkid, l.linkurl, l.linkname, l.linktype,
            l.link_no, l.linkloc_tb, l.pluginname,
            l.rel, l.hrefid
        FROM pgapplinks l
        INNER JOIN pgplugins p ON p.pluginName = l.pluginname
        INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
        INNER JOIN pgpages g ON g.pgid = x.pgid
        WHERE g.pgid = 11 AND l.linkloc_tb = 'b'
        AND l.linkname NOT LIKE '%calendar - custom%'
        AND l.linktype <> 'css'
        ORDER BY l.link_no
    </cfquery>

    <cfquery name="FindLinksExtra">
        SELECT DISTINCT l.pluginname
        FROM pgapplinks l
        INNER JOIN pgplugins p ON p.pluginName = l.pluginname
        INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
        INNER JOIN pgpages g ON g.pgid = x.pgid
        WHERE g.pgid = 11 AND l.linkloc_tb = 'b'
        AND l.pluginname <> 'global'
        ORDER BY l.link_no
    </cfquery>

    <!--- Set application variables --->
    <cfset appName = FindPage.appName />
    <cfset appDescription = FindPage.appDescription />
    <cfset appAuthor = FindPage.appAuthor />
    <cfset appLogoName = FindPage.appLogoName />
    <cfset colorTopBar = (host EQ "uat") ? "Purple" : FindPage.colorTopBar />
    <cfset colorLeftSideBar = FindPage.colorLeftSideBar />
    <cfset home = "/app/dashboard" />
    <cfset mocktoday = FindPage.mocktoday />
    <cfset mock_yn = FindPage.mock_yn />

    <!--- Set component variables --->
    <cfset compid = FindPage.compid />
    <cfset compname = FindPage.compname />
    <cfset compDir = FindPage.compDir />
    <cfset compTable = FindPage.compTable />
    <cfset compowner = FindPage.compowner />

    <!--- Set page variables --->
    <cfset pgid = FindPage.pgid />
    <cfset cookie.pgid = FindPage.pgid />
    <cfset pgname = FindPage.pgname />
    <cfset pgDir = FindPage.pgDir />
    <cfset pgTitle = FindPage.pgTitle />
    <cfset pgHeading = FindPage.pgHeading />
    <cfset pgFilename = FindPage.pgFilename />
    <cfset update_type = FindPage.update_type />

    <cfoutput>
        <cfset pageTitle = "#appName# | #pgTitle#" />
    </cfoutput>
<cfelse>
    <cfoutput>No record! #trim(thispage)#</cfoutput>
</cfif>
