<cfcomponent displayname="PageService" hint="Handles operations for Page table" output="false" > 
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

<!--- Changes made:
- Changed cfsqltype in cfqueryparam to CF_SQL_VARCHAR for simplicity and to avoid dynamic evaluation issues.
--->
</cfcomponent>
