<cfcomponent displayname="PageService" hint="Handles operations for Page table" output="false"> 
<cffunction name="SELpgpages" access="public" returntype="query">
    <cfargument name="ticketActive" type="string" required="true">
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            SELECT DISTINCT p.pgid, p.pgname 
            FROM taousers u 
            INNER JOIN tickets t ON u.userID = t.userid 
            INNER JOIN pgpages p ON p.pgid = t.pgid 
            WHERE t.ticketactive = <cfqueryparam value="#arguments.ticketActive#" cfsqltype="CF_SQL_CHAR"> 
            ORDER BY p.pgname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActivePgPages: #cfcatch.message#">
            <cfreturn queryNew("pgid,pgname", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="SELpgpages_23868" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM pgpages p
            INNER JOIN pgcomps c ON c.compID = p.compid
            WHERE p.parentpgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER">
            AND p.pgfilename = <cfqueryparam value="results.cfm" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfcatch>
            <cflog file="errorLog" text="Error in getPgPagesResults: #cfcatch.message# Query: SELECT * FROM pgpages p INNER JOIN pgcomps c ON c.compID = p.compid WHERE p.parentpgid = ? AND p.pgfilename = 'results.cfm' Parameters: pgid=#arguments.pgid#">
            <cfthrow message="Database error occurred. Please try again later.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETpgpages" access="public" returntype="query">
    <cfargument name="compid" type="numeric" required="true">
    <cfargument name="pgid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT pgid, pgdir
            FROM pgpages
            WHERE compid = <cfqueryparam value="#arguments.compid#" cfsqltype="CF_SQL_INTEGER">
            AND pgid <> <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER">
            AND pgfilename = <cfqueryparam value="results.cfm" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgPages: #cfcatch.message# Query: SELECT pgid, pgdir FROM pgpages WHERE compid = #arguments.compid# AND pgid <> #arguments.pgid# AND pgfilename = 'results.cfm'">
            <cfreturn queryNew("pgid,pgdir", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_23870" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT p.pgTitle, c.compname 
            FROM pgpages p 
            INNER JOIN pgcomps c ON c.compID = p.compID 
            INNER JOIN pgapps a ON a.appID = c.appid 
            WHERE p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgPagesWithCompName: #cfcatch.message# Query: SELECT p.pgTitle, c.compname FROM pgpages p INNER JOIN pgcomps c ON c.compID = p.compID INNER JOIN pgapps a ON a.appID = c.appid WHERE p.pgid = #arguments.rpgid#">
            <cfset result = queryNew("pgTitle, compname", "varchar,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_23912" access="public" returntype="query">
    <cfargument name="ref_pgid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, a.appAuthor, c.compname, p.pgname, a.appId, 
                a.appDescription, a.appLogoName, a.colorTopBar, a.colorLeftSideBar, 
                a.mocktoday, a.mock_yn, c.compid, c.compDir, c.compTable, 
                c.compowner, c.compIcon, c.menuYN, c.menuOrder, c.compInner, 
                c.compRecordName, c.compActive, p.pgid, p.pgDir, p.pgTitle, 
                p.pgHeading, p.pgFilename, p.datatables_YN, p.fullcalendar_YN, 
                p.editable_YN, p.newdatatables_YN, p.pk
            FROM pgpages p
            INNER JOIN pgcomps c ON c.compID = p.compID
            INNER JOIN pgapps a ON a.appID = c.appid
            WHERE p.pgid = <cfqueryparam value="#arguments.ref_pgid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAppDetails: #cfcatch.message# Query: SELECT ... WHERE p.pgid = #arguments.ref_pgid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETpgpages_23991" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT pgdir 
            FROM pgpages 
            WHERE pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgDirByPgid: #cfcatch.message# Query: SELECT pgdir FROM pgpages WHERE pgid = #arguments.pgid#">
            <cfthrow message="Database query failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cfscript>
function getDynamicQuery(required numeric rpgid) {
    var result = "";
    try {
        var querySQL = "
            SELECT 
                f.fname, f.fieldid, f.pgid, f.ftype, f.ftypefull, 
                f.update_yn, f.updatename, f.updatetype, f.fkey, 
                c2.comptable AS comptableb, c.comptable, 
                CONCAT('t', f.fieldid) AS talias 
            FROM pgpages p 
            INNER JOIN pgcomps c ON c.compID = p.compID 
            INNER JOIN pgapps a ON a.appID = c.appid 
            INNER JOIN pgfields f ON f.pgid = p.pgid 
            LEFT JOIN pgfields f2 ON f.fkey = f2.fieldid 
            LEFT JOIN pgpages p2 ON p2.pgid = f2.pgid 
            LEFT JOIN pgcomps c2 ON c2.compid = p2.compid 
            WHERE p.pgid = ? AND f.results_yn = 'Y' 
            ORDER BY f.displayOrder";
        
        var queryParams = [
            {value: rpgid, cfsqltype: "CF_SQL_INTEGER"}
        ];

        result = queryExecute(querySQL, queryParams);
    } catch (any e) {
        cflog(type="error", text="Error executing dynamic query: " & e.message);
        throw(type="DatabaseError", message="An error occurred while fetching data.", detail=e.detail);
    }
    return result;
}
</cfscript>

<cffunction name="SELpgpages_24003" access="public" returntype="query">
    <cfargument name="thispage" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, a.appAuthor, c.compname, p.pgname, a.appId, a.appDescription, 
                a.appLogoName, a.colorTopBar, a.colorLeftSideBar, a.mocktoday, a.mock_yn, 
                c.compid, c.compDir, c.compTable, c.compowner, c.compIcon, c.menuYN, 
                c.menuOrder, c.compInner, c.compRecordName, c.compActive, p.pgid, p.pgDir, 
                p.pgTitle, p.pgHeading, p.pgFilename, p.datatables_YN, p.fullcalendar_YN,
                p.editable_YN, p.newdatatables_YN, p.pk, p.update_type
            FROM 
                pgpages p 
            INNER JOIN 
                pgcomps c ON c.compID = p.compID 
            INNER JOIN 
                pgapps a ON a.appID = c.appid 
            WHERE 
                p.pgDir = <cfqueryparam value="#trim(arguments.thispage)#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAppPageDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24004" access="public" returntype="query">
    <cfargument name="thispage" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, c.compname, p.pgname, f.fname, 
                a.appId, a.appName, a.appDescription, a.appLogoName, 
                a.colorTopBar, a.colorLeftSideBar, c.compid, c.compDir, 
                c.compTable, c.compowner, c.compIcon, c.menuYN, 
                c.menuOrder, c.compInner, c.compRecordName, c.compActive, 
                p.pgid, p.pgDir, p.pgTitle, p.pgHeading, p.pgFilename, 
                p.datatables_YN, p.fullcalendar_YN, p.editable_YN, 
                p.newdatatables_YN, p.pk, f.fieldid, f.pgid as fieldPgid,
                f.ftype, f.ftypefull, f.update_yn, f.updatename,
                f.updatetype, f.fkey, f.num_min, f.num_max
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid
            WHERE 
                p.pgDir = <cfqueryparam value="#trim(arguments.thispage)#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getDynamicQueryResults: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETpgpages_24197" access="public" returntype="query">
    <cfargument name="details_pgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT pgdir
            FROM pgpages
            WHERE pgid = <cfqueryparam value="#arguments.details_pgid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgdirByPgid: #cfcatch.message# - Query: SELECT pgdir FROM pgpages WHERE pgid = ? - Parameters: #arguments.details_pgid#">
            <cfset result = queryNew("pgdir")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24210" access="public" returntype="query">
    <cfargument name="compactive" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT p.pgid AS ID, p.pgname AS name
            FROM pgpages p
            INNER JOIN pgcomps c ON c.compid = p.compid
            WHERE c.compactive = <cfqueryparam value="#arguments.compactive#" cfsqltype="CF_SQL_CHAR">
            ORDER BY p.pgname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActivePages: #cfcatch.message#">
            <cfset result = queryNew("ID, name")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETpgpages_24259" access="public" returntype="query">
    <cfargument name="compid" type="numeric" required="true">
    <cfargument name="pgid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT pgid, pgdir 
            FROM pgpages 
            WHERE compid = <cfqueryparam value="#arguments.compid#" cfsqltype="CF_SQL_INTEGER"> 
            AND pgid <> <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND pgfilename = <cfqueryparam value="details.cfm" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgPagesDetails: #cfcatch.message# Query: SELECT pgid, pgdir FROM pgpages WHERE compid = #arguments.compid# AND pgid <> #arguments.pgid# AND pgfilename = 'details.cfm'">
            <cfthrow message="An error occurred while fetching page details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24300" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, a.appAuthor, c.compname, p.pgname, a.appId, a.appDescription, 
                a.appLogoName, a.colorTopBar, a.colorLeftSideBar, c.compid, c.compDir, 
                c.compTable, c.compowner, c.compIcon, c.menuYN, c.menuOrder, c.compInner, 
                c.compRecordName, c.compActive, p.pgid, p.pgDir, p.pgTitle, p.pgHeading, 
                p.pgFilename, p.datatables_YN, p.fullcalendar_YN, p.editable_YN, 
                p.newdatatables_YN, p.pk, p.update_type
            FROM 
                pgpages p 
            INNER JOIN 
                pgcomps c ON c.compID = p.compID 
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPgPagesData: #cfcatch.message# - #cfcatch.detail#">
            <cfthrow message="Database query error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELpgpages_24301" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, c.compname, p.pgname, f.fname, f.num_min, f.num_max, 
                f.required_yn, a.appId, a.appName, a.appDescription, a.appLogoName, 
                a.colorTopBar, a.colorLeftSideBar, c.compid, c.compDir, c.compTable, 
                c.compowner, c.compIcon, c.menuYN, c.menuOrder, c.compInner, 
                c.compRecordName, c.compActive, p.pgid, p.pgDir, p.pgTitle, 
                p.pgHeading, p.pgFilename, p.datatables_YN, p.fullcalendar_YN,
                p.editable_YN, p.newdatatables_YN, p.pk, f.fieldid, f.pgid,
                f.tableSelect, f.ftype, f.ftypefull, f.update_yn,
                f.updatename, f.updatetype, f.fkey, p.update_type
            FROM pgpages p
            INNER JOIN pgcomps c ON c.compID = p.compID
            INNER JOIN pgapps a ON a.appID = c.appid
            LEFT JOIN pgfields f ON f.pgid = p.pgid
            WHERE p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
            AND f.update_yn = <cfqueryparam value="y" cfsqltype="CF_SQL_CHAR">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getDynamicQuery: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="RESpgpages_24302" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, c.compname, p.pgname, f.fname, f.required_yn, f.num_min, f.num_max,
                a.appId, a.appName, a.appDescription, a.appLogoName, a.colorTopBar, a.colorLeftSideBar,
                c.compid, c.compDir, c.compTable, c.compowner, c.compIcon, c.menuYN, c.menuOrder,
                c.compInner, c.compRecordName, c.compActive,
                p.pgid, p.pgDir, p.pgTitle, p.pgHeading, p.pgFilename,
                p.datatables_YN, p.fullcalendar_YN, p.editable_YN, p.newdatatables_YN,
                p.pk,
                f.fieldid, f.pgid as fieldPgid, f.tableSelect, f.ftype, f.ftypefull,
                f.update_yn, f.updatename, f.updatetype, f.fkey,
                p.update_type
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            LEFT JOIN 
                pgfields f ON f.pgid = p.pgid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
            AND 
                f.results_yn = <cfqueryparam value="y" cfsqltype="CF_SQL_CHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDynamicQueryResults: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving query results." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24303" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT f.fname, f.ftype 
            FROM pgpages p 
            INNER JOIN pgcomps c ON c.compID = p.compID 
            INNER JOIN pgapps a ON a.appID = c.appid 
            LEFT JOIN pgfields f ON f.pgid = p.pgid 
            WHERE p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER"> 
              AND f.updatename = <cfqueryparam value="ID" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPgFields: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfreturn queryNew("fname,ftype")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24304" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, c.compname, p.pgname, f.fname, f.required_yn, f.num_min, f.num_max, 
                a.appId, a.appName, a.appDescription, a.appLogoName, a.colorTopBar, a.colorLeftSideBar, 
                c.compid, c.compDir, c.compTable, c.compowner, c.compIcon, c.menuYN, c.menuOrder, 
                c.compInner, c.compRecordName, c.compActive, p.pgid, p.pgDir, p.pgTitle, p.pgHeading,
                p.pgFilename, p.datatables_YN, p.fullcalendar_YN, p.editable_YN, p.newdatatables_YN,
                p.pk, f.fieldid, f.pgid AS fieldPgid, f.tableSelect, f.ftype, f.ftypefull,
                f.update_yn, f.add_yn, f.updatename, f.updatetype, f.fkey, p.update_type
            FROM pgpages p 
            INNER JOIN pgcomps c ON c.compID = p.compID 
            INNER JOIN pgapps a ON a.appID = c.appid 
            LEFT JOIN pgfields f ON f.pgid = p.pgid 
            WHERE p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND f.add_yn = <cfqueryparam value="y" cfsqltype="CF_SQL_CHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error executing query in getDynamicQueryResults: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24305" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.appname, c.compname, p.pgname, f.fname, f.num_min, f.num_max, 
                f.required_yn, a.appId, a.appName, a.appDescription, a.appLogoName, 
                a.colorTopBar, a.colorLeftSideBar, c.compid, c.compDir, c.compTable, 
                c.compowner, c.compIcon, c.menuYN, c.menuOrder, c.compInner, 
                c.compRecordName, c.compActive, p.pgid, p.pgDir, p.pgTitle, 
                p.pgHeading, p.pgFilename, p.datatables_YN, p.fullcalendar_YN,
                p.editable_YN, p.newdatatables_YN, p.pk, f.fieldid, f.pgid,
                f.tableSelect, f.ftype, f.ftypefull, f.update_yn, f.add_yn,
                f.updatename, f.updatetype, f.fkey, p.update_type
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            LEFT JOIN 
                pgfields f ON f.pgid = p.pgid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER"> 
                AND f.update_yn = <cfqueryparam value="y" cfsqltype="CF_SQL_CHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDynamicQueryResults: #cfcatch.message#">
            <cfthrow message="Error executing query." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="RESpgpages_24652" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                f.fname, f.fieldid, f.pgid, f.ftype, f.ftypefull, 
                f.update_yn, f.updatename, f.updatetype, f.fkey, 
                f.det_cols, c2.comptable AS comptableb, c.comptable, 
                CONCAT('t', f.fieldid) AS talias
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid
            LEFT JOIN 
                pgfields f2 ON f.fkey = f2.fieldid
            LEFT JOIN 
                pgpages p2 ON p2.pgid = f2.pgid
            LEFT JOIN 
                pgcomps c2 ON c2.compid = p2.compid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
                AND f.details_yn = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            ORDER BY 
                f.displayOrder
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDynamicQueryResults: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELpgpages_24653" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                f.fname, 
                f2.fname AS fnameb, 
                c2.comptable AS comptableb, 
                c.comptable, 
                f2.fieldid, 
                f2.fkey, 
                concat('t', f.fieldid) AS talias
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid
            LEFT JOIN 
                pgfields f2 ON f.fkey = f2.fieldid
            LEFT JOIN 
                pgpages p2 ON p2.pgid = f2.pgid
            LEFT JOIN 
                pgcomps c2 ON c2.compid = p2.compid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
                AND f.details_yn = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR"> 
                AND f.fkey <> ''
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDynamicQueryResults: #cfcatch.message#">
            <cfthrow message="An error occurred while executing the query." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="RESpgpages_24739" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                f.fname, 
                f.fieldid, 
                f.pgid, 
                f.ftype, 
                f.ftypefull, 
                f.update_yn, 
                f.updatename, 
                f.updatetype, 
                f.fkey, 
                c2.comptable AS comptableb, 
                c.comptable, 
                CONCAT('t', f.fieldid) AS talias
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid
            LEFT JOIN 
                pgfields f2 ON f.fkey = f2.fieldid
            LEFT JOIN 
                pgpages p2 ON p2.pgid = f2.pgid
            LEFT JOIN 
                pgcomps c2 ON c2.compid = p2.compid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND 
                f.results_yn = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            ORDER BY 
                f.displayOrder
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDynamicQueryResults: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cfscript>
function getDynamicQuery(required numeric pgid) {
    var result = "";
    try {
        var sql = "
            SELECT 
                f.fname, 
                f2.fname AS fnameb, 
                c2.comptable AS comptableb, 
                c.comptable, 
                f2.fieldid, 
                f2.fkey, 
                concat('t', f.fieldid) AS talias 
            FROM 
                pgpages p 
            INNER JOIN 
                pgcomps c ON c.compID = p.compID 
            INNER JOIN 
                pgapps a ON a.appID = c.appid 
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid 
            LEFT JOIN 
                pgfields f2 ON f.fkey = f2.fieldid 
            LEFT JOIN 
                pgpages p2 ON p2.pgid = f2.pgid 
            LEFT JOIN 
                pgcomps c2 ON c2.compid = p2.compid 
            WHERE 
                p.pgid = ? AND f.results_yn = 'Y' AND f.fkey <> ''";

        result = queryExecute(
            sql,
            {pgid={value=arguments.pgid, cfsqltype="CF_SQL_INTEGER"}},
            {datasource="abod"}
        );
    } catch (any e) {
        cflog(text="Error executing dynamic query: " & e.message, file="application");
        throw(type="DatabaseError", message="An error occurred while executing the query.", detail=e.message);
    }
    return result;
}
</cfscript>

<cffunction name="RESpgpages_24777" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                f.fname, f.fieldid, f.pgid, f.ftype, f.ftypefull, f.update_yn, 
                f.updatename, f.updatetype, f.fkey, f.det_cols, 
                c2.comptable AS comptableb, c.comptable, 
                CONCAT('t', f.fieldid) AS talias
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid
            LEFT JOIN 
                pgfields f2 ON f.fkey = f2.fieldid
            LEFT JOIN 
                pgpages p2 ON p2.pgid = f2.pgid
            LEFT JOIN 
                pgcomps c2 ON c2.compid = p2.compid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
                AND f.update_yn = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            ORDER BY 
                f.displayOrder
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDynamicQueryResults: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving the data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELpgpages_24778" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                f.fname, 
                f2.fname AS fnameb, 
                c2.comptable AS comptableb, 
                c.comptable, 
                f2.fieldid, 
                f2.fkey, 
                CONCAT('t', f.fieldid) AS talias
            FROM 
                pgpages p
            INNER JOIN 
                pgcomps c ON c.compID = p.compID
            INNER JOIN 
                pgapps a ON a.appID = c.appid
            INNER JOIN 
                pgfields f ON f.pgid = p.pgid
            LEFT JOIN 
                pgfields f2 ON f.fkey = f2.fieldid
            LEFT JOIN 
                pgpages p2 ON p2.pgid = f2.pgid
            LEFT JOIN 
                pgcomps c2 ON c2.compid = p2.compid
            WHERE 
                p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER"> 
                AND f.details_yn = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR"> 
                AND f.fkey <> ''
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDynamicQueryResults: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
