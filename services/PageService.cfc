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
<cffunction name="getDynamicQuery" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
            WHERE p.pgid = <cfqueryparam value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
            AND f.results_yn = 'Y'
            ORDER BY f.displayOrder
        </cfquery>
        
        <cfcatch type="any">
            <cflog type="error" text="Error executing dynamic query: #cfcatch.message#">
            <cfthrow type="DatabaseError" message="An error occurred while fetching data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>


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
function getDynamicQueryx(required numeric pgid) {
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
</cffunction>

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
                        CONCAT('<link href="', l.linkurl, '?ver=6', <cfqueryparam value="#arguments.version#" cfsqltype="cf_sql_varchar">, '" ', 
                               IF(l.rel IS NOT NULL, CONCAT('rel="', l.rel, '" '), ''), 
                               IF(l.hrefid IS NOT NULL, CONCAT('id="', l.hrefid, '" '), ''), 
                               'type="text/css" />')
                    WHEN l.linktype = 'script' THEN 
                        CONCAT('<script src="', l.linkurl, '?ver=6', <cfqueryparam value="#arguments.version#" cfsqltype="cf_sql_varchar">, '"></script>')
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
            SELECT l.linkurl
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
</cfcomponent>
