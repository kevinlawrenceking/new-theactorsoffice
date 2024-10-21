<cfcomponent displayname="PageService" hint="Handles operations for Page table" output="false" > 
<cffunction name="getPageDetails" access="public" returntype="struct" output="false" hint="Fetch page details by page ID or URL">
        <cfargument name="pgid" type="string" required="false" default="">
        <cfargument name="pgDir" type="string" required="false" default="">

        <cfset var page = {}>

        <cfif NOT Len(arguments.pgid) AND NOT Len(arguments.pgDir)>
            <cfthrow type="InvalidArgument" message="Either pgid or pgDir must be provided.">
        </cfif>

        <cfquery name="qPageDetails" >
            SELECT
                a.appname, p.allowdelete_yn, p.allowupdate_yn, p.allowadd_yn, p.allowdetails_yn,
                a.appAuthor, c.compname, p.pgname, a.appId, a.appDescription,
                a.appLogoName, a.colorTopBar, a.colorLeftSideBar, a.mocktoday,
                a.mock_yn, c.compid, c.compDir, c.compTable, c.compowner,
                c.compIcon, c.menuYN, c.menuOrder, c.compInner, c.compRecordName,
                c.compActive, p.pgid, p.pgDir, p.pgTitle, p.pgHeading,
                p.pgFilename, p.datatables_YN, p.fullcalendar_YN, p.editable_YN,
                p.newdatatables_YN, p.pk, p.update_type
            FROM pgpages p
            INNER JOIN pgcomps c ON c.compID = p.compID
            INNER JOIN pgapps a ON a.appID = c.appid
            WHERE 
            <cfif Len(arguments.pgid)>
                p.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="cf_sql_varchar">
            <cfelse>
                p.pgDir = <cfqueryparam value="#trim(arguments.pgDir)#" cfsqltype="cf_sql_varchar">
                AND p.isdef = 1
            </cfif>
        </cfquery>

        <cfif qPageDetails.recordCount EQ 1>
            <cfset page = {
                "appname": qPageDetails.appname,
                "allowdelete_yn": qPageDetails.allowdelete_yn,
                "allowupdate_yn": qPageDetails.allowupdate_yn,
                "allowadd_yn": qPageDetails.allowadd_yn,
                "allowdetails_yn": qPageDetails.allowdetails_yn,
                "appAuthor": qPageDetails.appAuthor,
                "compname": qPageDetails.compname,
                "pgname": qPageDetails.pgname,
                "appId": qPageDetails.appId,
                "appDescription": qPageDetails.appDescription,
                "appLogoName": qPageDetails.appLogoName,
                "colorTopBar": qPageDetails.colorTopBar,
                "colorLeftSideBar": qPageDetails.colorLeftSideBar,
                "mocktoday": qPageDetails.mocktoday,
                "mock_yn": qPageDetails.mock_yn,
                "compid": qPageDetails.compid,
                "compDir": qPageDetails.compDir,
                "compTable": qPageDetails.compTable,
                "compowner": qPageDetails.compowner,
                "compIcon": qPageDetails.compIcon,
                "menuYN": qPageDetails.menuYN,
                "menuOrder": qPageDetails.menuOrder,
                "compInner": qPageDetails.compInner,
                "compRecordName": qPageDetails.compRecordName,
                "compActive": qPageDetails.compActive,
                "pgid": qPageDetails.pgid,
                "pgDir": qPageDetails.pgDir,
                "pgTitle": qPageDetails.pgTitle,
                "pgHeading": qPageDetails.pgHeading,
                "pgFilename": qPageDetails.pgFilename,
                "datatables_YN": qPageDetails.datatables_YN,
                "fullcalendar_YN": qPageDetails.fullcalendar_YN,
                "editable_YN": qPageDetails.editable_YN,
                "newdatatables_YN": qPageDetails.newdatatables_YN,
                "pk": qPageDetails.pk,
                "update_type": qPageDetails.update_type
            }>
        </cfif>

        <cfreturn page>
    </cffunction>

    <cffunction name="getPageLinksByLocation" access="public" returntype="struct" output="false" hint="Fetch top and bottom CSS/JS links for the given page">
        <cfargument name="pgid" type="string" required="true" hint="Page ID to fetch links for">
        <cfargument name="version" type="string" required="true" hint="Version to append to the URL as a cache-busting parameter">

             <cfset var links = { top_links = "", bottom_links = "" }>

   
    <cfquery name="qPageLinks">
            SELECT
                CASE 
                    WHEN l.linktype = 'css' THEN 
                        CONCAT('<link href="', l.linkurl, '?ver=', <cfqueryparam value="#arguments.version#" cfsqltype="cf_sql_varchar">, '" ', 
                               IF(l.rel IS NOT NULL, CONCAT('rel="', l.rel, '" '), ''), 
                               IF(l.hrefid IS NOT NULL, CONCAT('id="', l.hrefid, '" '), ''), 
                               'type="text/css" />')
                    WHEN l.linktype = 'script' THEN 
                        CONCAT('<script src="', l.linkurl, '?ver=', <cfqueryparam value="#arguments.version#" cfsqltype="cf_sql_varchar">, '"></script>')
                    ELSE ''
                END AS link_html,
                l.linkloc_tb 
            FROM pgapplinks l
            INNER JOIN pgplugins p ON p.pluginName = l.pluginname
            INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
            INNER JOIN pgpages g ON g.pgid = x.pgid
            WHERE g.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="cf_sql_integer">
            AND l.IsDeleted = 0
            ORDER BY l.link_no ASC
        </cfquery>

     <!--- Loop through the query and add links to the appropriate section --->
        <cfloop query="qPageLinks">
            <cfif qPageLinks.linkloc_tb EQ "t">
                <!--- Append to top_links --->
                <cfset links.top_links = links.top_links & qPageLinks.link_html>
            <cfelseif qPageLinks.linkloc_tb EQ "b">
                <!--- Append to bottom_links --->
                <cfset links.bottom_links = links.bottom_links & qPageLinks.link_html>
            </cfif>
        </cfloop>

        <!--- Return the struct containing top and bottom links --->
        <cfreturn links>
    </cffunction>

     <!--- Function to get script_include links for a page --->
    <cffunction name="getIncludeLinks" access="public" returntype="array" output="false" hint="Fetch script_include links for the given page">
        <cfargument name="pgid" type="numeric" required="true" hint="Page ID to fetch include links for">

        <!--- Initialize an empty array to store the include links --->
        <cfset var includeLinksArray = []>

        <!--- Query to fetch the script_include links --->
        <cfquery name="includeLinks">
            SELECT DISTINCT l.linkurl
            FROM pgapplinks l
            INNER JOIN pgplugins p ON p.pluginName = l.pluginname
            INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
            INNER JOIN pgpages g ON g.pgid = x.pgid
            WHERE g.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="cf_sql_integer">
            AND l.IsDeleted = 0
            AND l.linktype = 'script_include'
            ORDER BY l.link_no ASC
        </cfquery>

        <!--- Loop through the query and populate the array --->
        <cfloop query="includeLinks">
            <cfset ArrayAppend(includeLinksArray, includeLinks.linkurl)>
        </cfloop>

        <!--- Return the array of include links --->
        <cfreturn includeLinksArray>
    </cffunction>

 <!--- Function to retrieve a select list of active pages --->
    <cffunction name="pages_sel" access="remote" returntype="query" output="false" hint="Get a select list of active pages.">
        <cfquery name="pages">
            SELECT 
                p.pgid AS ID,
                p.pgname AS name
            FROM pgpages p
            INNER JOIN pgcomps c ON c.compid = p.compid
            WHERE c.compactive = 'Y'
            ORDER BY p.pgname
        </cfquery>
        <!--- Return the query result --->
        <cfreturn pages />
    </cffunction>

    
<cffunction name="getpgpages" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="pgid">
    
    <cfset var sql = "SELECT `pgid`, `compID`, `menuOrder`, `appID`, `fieldid`, `fkey`, `pgname`, `pgTitle`, `pgHeading`, `pgFilename`, `pgDir`, `pk`, `update_type`, `compname`, `compDir`, `compTable`, `compIcon`, `compInner`, `compRecordName`, `appname`, `appDescription`, `appLogoName`, `colorTopBar`, `colorLeftSideBar`, `fname`, `ftype`, `ftypefull`, `datatables_YN`, `fullcalendar_YN`, `editable_YN`, `newdatatables_YN`, `compowner`, `menuYN`, `compActive`, `update_yn`, `add_yn` FROM vm_pgpages_pgcomps_pgapps_pgfields WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "pgid,compID,menuOrder,appID,fieldid,fkey,pgname,pgTitle,pgHeading,pgFilename,pgDir,pk,update_type,compname,compDir,compTable,compIcon,compInner,compRecordName,appname,appDescription,appLogoName,colorTopBar,colorLeftSideBar,fname,ftype,ftypefull,datatables_YN,fullcalendar_YN,editable_YN,newdatatables_YN,compowner,menuYN,compActive,update_yn,add_yn">
    <cfset var queryResult = "">

    <cftry>
        <!--- Build WHERE clause dynamically based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append conditions to SQL if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#"> <!--- Changed to CF_SQL_VARCHAR for simplicity --->
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getpgpages: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with correct column names and types --->
        <cfset queryResult = queryNew("pgid,int;compID,int;menuOrder,int;appID,int;fieldid,int;fkey,int;pgname,varchar;pgTitle,varchar;pgHeading,varchar;pgFilename,varchar;pgDir,varchar;pk,varchar;update_type,varchar;compname,varchar;compDir,varchar;compTable,varchar;compIcon,varchar;compInner,varchar;compRecordName,varchar;appname,varchar;appDescription,varchar;appLogoName,varchar;colorTopBar,varchar;colorLeftSideBar,varchar;fname,varchar;ftype,varchar;ftypefull,varchar;datatables_YN,char;fullcalendar_YN,char;editable_YN,char;newdatatables_YN,char;compowner,char;menuYN,char;compActive,char;update_yn,char;add_yn,char")>
    </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction>

</cfcomponent>
