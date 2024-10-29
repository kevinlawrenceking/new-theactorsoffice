<cfcomponent displayname="SiteTypeUserService" hint="Handles operations for SiteTypeUser table" output="false"> 
<cffunction name="getPNIDBySiteTypeID" access="public" returntype="query">
    <cfargument name="sitetypeid" type="numeric" required="true">

    <cfset var result = "">
    <cfset var sql = "SELECT pnid FROM sitetypes_user_tbl WHERE sitetypeid = ?">

    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPNIDBySiteTypeID: #cfcatch.message# Query: #sql# Parameters: #arguments.sitetypeid#">
            <cfthrow message="An error occurred while retrieving PNID by SiteTypeID." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateSiteTypeAsDeleted" access="public" returntype="void">
    <cfargument name="sitetypeid" type="numeric" required="true">

    <cfset var queryResult = "">
    <cftry>
        <cfquery name="queryResult" datasource="yourDatasourceName">
            UPDATE sitetypes_user_tbl 
            SET isdeleted = 1 
            WHERE sitetypeid = <cfqueryparam value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating sitetypes_user_tbl: #cfcatch.message# Query: #cfcatch.detail# Parameters: sitetypeid=#arguments.sitetypeid#">
            <cfthrow message="Database update failed." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSiteTypeDetails" access="public" returntype="query">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                p.pnid, 
                p.isvisible, 
                s.sitetypeid, 
                s.sitetypename, 
                s.sitetypedescription, 
                s.pntitle 
            FROM 
                sitetypes_user s 
            INNER JOIN 
                pgpanels_user p ON p.pnid = s.pnid 
            WHERE 
                s.sitetypeid = <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getSiteTypeDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateSiteTypeName" access="public" returntype="void">
    <cfargument name="new_sitetypename" type="string" required="true">
    <cfargument name="new_sitetypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE sitetypes_user 
            SET sitetypename = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_sitetypename#" />
            WHERE sitetypeid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_sitetypeid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating sitetypes_user: #cfcatch.message# Query: UPDATE sitetypes_user SET sitetypename = ? WHERE sitetypeid = ? Parameters: #arguments.new_sitetypename#, #arguments.new_sitetypeid#">
            <cfthrow message="An error occurred while updating the site type name." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSiteTypesUser" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_sitetypename" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM sitetypes_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND sitetypename = <cfqueryparam value="#arguments.new_sitetypename#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypesUser: #cfcatch.message# Query: SELECT * FROM sitetypes_user WHERE userid = ? AND sitetypename = ? Parameters: #arguments.userid#, #arguments.new_sitetypename#">
            <cfthrow message="Database query failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertSiteType" access="public" returntype="void">
    <cfargument name="new_siteTypeName" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO sitetypes_user_tbl (siteTypeName, siteTypeDescription, userid, IsDeleted) 
            VALUES (
                <cfqueryparam value="#arguments.new_siteTypeName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into sitetypes_user_tbl: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting site type." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSiteTypesUserBySitetypeId" access="public" returntype="query">
    <cfargument name="sitetypeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM sitetypes_user
            WHERE sitetypeid = <cfqueryparam value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypesUserBySitetypeId: #cfcatch.message# Query: SELECT * FROM sitetypes_user WHERE sitetypeid = ? Parameters: #arguments.sitetypeid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateSiteTypesUser" access="public" returntype="void">
    <cfargument name="new_pnid" type="numeric" required="true">
    <cfargument name="new_sitetypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE sitetypes_user
            SET pnid = <cfqueryparam value="#arguments.new_pnid#" cfsqltype="CF_SQL_INTEGER">
            WHERE sitetypeid = <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating sitetypes_user: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the sitetypes_user table." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSiteTypesUser" access="public" returntype="query">
    <cfargument name="sitetypename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM sitetypes_user 
            WHERE sitetypename = <cfqueryparam value="#arguments.sitetypename#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypesUser: #cfcatch.message# Query: SELECT * FROM sitetypes_user WHERE sitetypename = ? AND userid = ? Parameters: #arguments.sitetypename#, #arguments.userid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertSiteTypeUser" access="public" returntype="void">
    <cfargument name="siteTypeName" type="string" required="true">
    <cfargument name="siteTypeDescription" type="string" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO sitetypes_user (siteTypeName, siteTypeDescription, userid) 
            VALUES (
                <cfqueryparam value="#arguments.siteTypeName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.siteTypeDescription#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into sitetypes_user: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting site type user.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSiteTypeId" access="public" returntype="query">
    <cfargument name="sitetypename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT sitetypeid 
            FROM sitetypes_user 
            WHERE sitetypename = <cfqueryparam value="#arguments.sitetypename#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypeId: #cfcatch.message#">
            <cfset result = queryNew("sitetypeid")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getSiteTypesByUserId" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT sitetypeid, sitetypename, sitetypedescription, pntitle
            FROM sitetypes_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY sitetypename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypesByUserId: #cfcatch.message# Query: SELECT sitetypeid, sitetypename, sitetypedescription, pntitle FROM sitetypes_user WHERE userid = ? ORDER BY sitetypename Parameters: #arguments.userid#">
            <cfset result = queryNew("sitetypeid,sitetypename,sitetypedescription,pntitle")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
