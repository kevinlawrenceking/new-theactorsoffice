<cfcomponent displayname="PanelUserService" hint="Handles operations for PanelUser table" output="false"> 
<cffunction name="getPanelsByUserId" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                p.pnid, 
                p.pntitle, 
                p.pnColXl, 
                p.pnColMd, 
                p.pnFilename, 
                -1 AS new_pnorderno, 
                p.isvisible
            FROM 
                pgpanels_user p
            WHERE 
                p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                p.pnorderno
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPanelsByUserId: #cfcatch.message#">
            <cfset result = queryNew("pnid,pntitle,pnColXl,pnColMd,pnFilename,new_pnorderno,isvisible")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateUserVisibility" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE pgpanels_user 
            SET isvisible = 0 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating user visibility: #cfcatch.message# Query: UPDATE pgpanels_user SET isvisible = 0 WHERE userid = #arguments.userid#">
            <cfthrow message="An error occurred while updating user visibility." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserVisibility" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_isvisible" type="array" required="true">

    <cfset var sql = "">
    <cfset var pnidList = "">
    
    <cftry>
        <!--- Validate and prepare the pnidList for SQL IN clause --->
        <cfif arrayLen(arguments.new_isvisible) gt 0>
            <cfset pnidList = listQualify(arrayToList(arguments.new_isvisible), "'", ",")>
        </cfif>

        <!--- Construct the SQL query --->
        <cfset sql = "
            UPDATE pgpanels_user 
            SET isvisible = 1 
            WHERE userid = ? 
            AND pnid IN (#pnidList#)
        ">

        <!--- Execute the query with parameter binding --->
        <cfquery datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in updateUserVisibility: #cfcatch.message#; SQL: #sql#; UserID: #arguments.userid#; PNID List: #pnidList#">
        <!--- Optionally rethrow or handle the error as needed --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updatePgpanelsUser" access="public" returntype="void">
    <cfargument name="pnid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE pgpanels_user
            SET isdeleted = 1
            WHERE pnid = <cfqueryparam value="#arguments.pnid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating pgpanels_user: #cfcatch.message#; SQLState: #cfcatch.sqlstate#; Error Code: #cfcatch.errorCode#">
            <cfthrow message="Database update failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updatePgpanelsUserVisibility" access="public" returntype="void">
    <cfargument name="isvisible" type="boolean" required="true">
    <cfargument name="pnid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE pgpanels_user
            SET isvisible = <cfqueryparam value="#arguments.isvisible#" cfsqltype="CF_SQL_BIT">
            WHERE pnid = <cfqueryparam value="#arguments.pnid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error updating pgpanels_user visibility. Error: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the visibility." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getPanelTitles" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                p.pnid, 
                p.pntitle, 
                s.pnTitle AS correct_title
            FROM 
                pgpanels_user p
            LEFT JOIN 
                sitetypes_user s ON s.pnid = p.pnid
            WHERE 
                p.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND p.pntitle <> s.pntitle
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getPanelTitles: #cfcatch.message# Query: SELECT p.pnid, p.pntitle, s.pnTitle AS correct_title FROM pgpanels_user p LEFT JOIN sitetypes_user s ON s.pnid = p.pnid WHERE p.userid = ? AND p.pntitle <> s.pntitle Parameters: userId=#arguments.userId#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updatePgpanelsUser" access="public" returntype="void">
    <cfargument name="correctTitle" type="string" required="true">
    <cfargument name="pnid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE pgpanels_user 
            SET pntitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.correctTitle#" /> 
            WHERE pnid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pnid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating pgpanels_user: #cfcatch.message# Query: #cfcatch.query#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getNewPnOrderNo" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT p.pnOrderno + 1 AS new_pnOrderNo
            FROM pgpanels_user p
            WHERE p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY p.pnOrderno DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getNewPnOrderNo: #cfcatch.message#; SQL: #cfcatch.Sql#; Data: #arguments.userid#">
            <cfset result = queryNew("new_pnOrderNo", "integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertPgpanelsUser" access="public" returntype="void">
    <cfargument name="new_pnTitle" type="string" required="true">
    <cfargument name="new_pnOrderNo" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO pgpanels_user (
                pnTitle, 
                pnFilename, 
                pnorderno, 
                pncolxl, 
                pncolMd, 
                pnDescription, 
                IsDeleted, 
                IsVisible, 
                userid
            ) VALUES (
                <cfqueryparam value="#arguments.new_pnTitle#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="mylinks_user.cfm" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_pnOrderNo#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertPgpanelsUser: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting user panel." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserPanels" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="pnFilename" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM pgpanels_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND pnFilename = <cfqueryparam value="#arguments.pnFilename#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserPanels: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertPgPanelsUser" access="public" returntype="void">
    <cfargument name="select_userid" type="numeric" required="true">
    <cfargument name="m" type="struct" required="true">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            INSERT INTO pgpanels_user_tbl (
                userid, 
                pnTitle, 
                pnFilename, 
                pnOrderNo, 
                pnColXl, 
                pnColMd, 
                pnDescription, 
                IsVisible
            ) VALUES (
                <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.m.pntitle#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.m.pnfilename#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.m.pnOrderNo#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.m.pnColXl#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.m.pnColMd#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.m.pnDescription#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <!--- Handle any potential errors --->
        <cfcatch type="any">
            <cflog file="application" text="Error in insertPgPanelsUser: #cfcatch.message#; SQL: #cfcatch.sqlstate#; Error Code: #cfcatch.nativeerrorcode#">
            <!--- Optionally rethrow or handle the error as needed --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getNewPnOrderNo" access="public" returntype="query">
    <cfargument name="select_userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT p.pnOrderno + 1 AS new_pnOrderNo
            FROM pgpanels_user p
            WHERE p.userid = <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY p.pnOrderno DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNewPnOrderNo: #cfcatch.message#">
            <cfthrow message="An error occurred while executing the query." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertPgpanelsUser" access="public" returntype="void">
    <cfargument name="new_pnTitle" type="string" required="true">
    <cfargument name="new_pnOrderNo" type="numeric" required="true">
    <cfargument name="select_userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO pgpanels_user (
                pnTitle, 
                pnFilename, 
                pnorderno, 
                pncolxl, 
                pncolMd, 
                pnDescription, 
                IsDeleted, 
                IsVisible, 
                userid
            ) VALUES (
                <cfqueryparam value="#arguments.new_pnTitle#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="mylinks_user.cfm" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_pnOrderNo#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error inserting into pgpanels_user: #cfcatch.message# - Query: INSERT INTO pgpanels_user (pnTitle, pnFilename, pnorderno, pncolxl, pncolMd, pnDescription, IsDeleted, IsVisible, userid) VALUES (#arguments.new_pnTitle#, mylinks_user.cfm, #arguments.new_pnOrderNo#, 3, 3, '', 0, 1, #arguments.select_userid#)">
        <cfthrow>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getPanelsForUser" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                p.pnid, 
                p.pntitle, 
                p.pnColXl, 
                p.pnColMd, 
                p.pnFilename, 
                p.pnorderno AS new_pnorderno
            FROM 
                pgpanels_user p
            WHERE 
                p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND p.isvisible = <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            ORDER BY 
                p.pnorderno
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPanelsForUser: #cfcatch.message#">
            <cfset result = queryNew("pnid,pntitle,pnColXl,pnColMd,pnFilename,new_pnorderno")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getPanelsByUserId" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                p.pnid, 
                p.pntitle, 
                p.pnColXl, 
                p.pnColMd, 
                p.pnFilename, 
                p.pnorderno AS new_pnorderno, 
                p.isvisible 
            FROM 
                pgpanels_user p 
            WHERE 
                p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                pnOrderno
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPanelsByUserId: #cfcatch.message#">
            <cfthrow message="An error occurred while fetching panels." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
