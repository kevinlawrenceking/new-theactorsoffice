<cfcomponent displayname="SiteLinkUserService" hint="Handles operations for SiteLinkUser table" output="false"> 
<cffunction name="UPDsitelinks_user" access="public" returntype="void">
    <cfargument name="fileName" type="string" required="true">
    <cfargument name="id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE sitelinks_user 
            SET siteicon = <cfqueryparam value="#arguments.fileName#" cfsqltype="cf_sql_varchar"> 
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating siteicon: #cfcatch.message# Query: UPDATE sitelinks_user SET siteicon = ? WHERE id = ? Parameters: #arguments.fileName#, #arguments.id#">
            <cfthrow message="An error occurred while updating the site icon." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELsitelinks_user" access="public" returntype="query">
    <cfargument name="siteIcon" type="string" required="false" default="unknown.png">
    
    <cfset var result = "">
    <cfset var sql = "SELECT id, sitename, siteurl, siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = ?">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.siteIcon#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getCustomSiteLinks: #cfcatch.message#; SQL: #sql#; Parameters: siteIcon=#arguments.siteIcon#">
            <cfset result = queryNew("id,sitename,siteurl,siteicon")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDsitelinks_user_23854" access="public" returntype="void" hint="Updates the site icon for a user.">
    <cfargument name="new_siteicon" type="string" required="true" hint="New site icon value."/>
    <cfargument name="id" type="numeric" required="true" hint="User ID."/>
    
    <cftry>
        <cfquery datasource="yourDatasourceName">
            UPDATE sitelinks_user 
            SET siteicon = <cfqueryparam value="#arguments.new_siteicon#" cfsqltype="CF_SQL_VARCHAR">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating site icon: #cfcatch.message# Query: UPDATE sitelinks_user SET siteicon = ? WHERE id = ? Parameters: new_siteicon=#arguments.new_siteicon#, id=#arguments.id#"/>
            <cfthrow message="An error occurred while updating the site icon." detail="#cfcatch.detail#"/>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDsitelinks_user_23883" access="public" returntype="void">
    <cfargument name="new_id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE sitelinks_user_tbl 
            SET isdeleted = 1 
            WHERE id = <cfqueryparam value="#arguments.new_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error updating sitelinks_user_tbl: #cfcatch.message# Query: UPDATE sitelinks_user_tbl SET isdeleted = 1 WHERE id = #arguments.new_id#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDsitelinks_user_23930" access="public" returntype="void">
    <cfargument name="new_id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE sitelinks_user_tbl
            SET isdeleted = 0
            WHERE id = <cfqueryparam value="#arguments.new_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating sitelinks_user_tbl: #cfcatch.message# Query: UPDATE sitelinks_user_tbl SET isdeleted = 0 WHERE id = #arguments.new_id#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELsitelinks_user_23943" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                s.id, 
                s.sitetypeid, 
                s.sitename, 
                s.siteurl, 
                s.siteicon, 
                s.sitetypeid, 
                t.sitetypename, 
                t.pntitle
            FROM 
                sitelinks_user s
            INNER JOIN 
                sitetypes_user t ON t.sitetypeid = s.siteTypeid
            WHERE 
                s.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                s.sitename
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getSiteLinksByUser: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELsitelinks_user_23958" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="siteTypeId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                s.id, 
                s.sitetypeid, 
                s.sitename, 
                s.siteurl, 
                s.siteicon, 
                s.sitetypeid, 
                t.sitetypename, 
                t.pntitle, 
                s.ver
            FROM 
                sitelinks_user s
            INNER JOIN 
                sitetypes_user t ON t.sitetypeid = s.siteTypeid
            WHERE 
                s.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND s.sitetypeid = <cfqueryparam value="#arguments.siteTypeId#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                s.sitename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteLinks: #cfcatch.message# Query: SELECT ... WHERE userid = #arguments.userId# AND sitetypeid = #arguments.siteTypeId#">
            <cfset result = queryNew("id,sitetypeid,sitename,siteurl,siteicon,sitetypename,pntitle,ver")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELsitelinks_user_23959" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="siteTypeId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                s.id, 
                s.sitetypeid, 
                s.sitename, 
                s.siteurl, 
                s.siteicon, 
                s.sitetypeid, 
                t.sitetypename, 
                t.pntitle, 
                s.ver
            FROM 
                sitelinks_user_tbl s
            INNER JOIN 
                sitetypes_user t ON t.sitetypeid = s.siteTypeid
            WHERE 
                s.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND s.sitetypeid = <cfqueryparam value="#arguments.siteTypeId#" cfsqltype="CF_SQL_INTEGER"> 
                AND s.isdeleted = 1 
                AND s.isCustom = 0
            ORDER BY 
                s.sitename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteLinks: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELsitelinks_user_24138" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_sitename" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM sitelinks_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND sitename = <cfqueryparam value="#arguments.new_sitename#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getSiteLinksUser: #cfcatch.message# Query: SELECT * FROM sitelinks_user WHERE userid = ? AND sitename = ?">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSsitelinks_user" access="public" returntype="numeric">
    <cfargument name="new_sitename" type="string" required="true">
    <cfargument name="new_siteurl" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    <cfargument name="ver" type="string" required="false" default="">

    <cfset var insertedID = 0>

<cftry>
    <cfquery datasource="abod" result="result">
        INSERT INTO sitelinks_user (
            sitename, 
            siteurl, 
            userid, 
            sitetypeid, 
            IsCustom
            <cfif len(arguments.ver) gt 0>, ver</cfif>
        ) VALUES (
            <cfqueryparam value="#arguments.new_sitename#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.new_siteurl#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            <cfif len(arguments.ver) gt 0>, 
                <cfqueryparam value="#arguments.ver#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
        );
    </cfquery>

    <!--- Capture the last inserted ID --->
    <cfset insertedID = result.generatedKey>

<cfcatch type="any">
    <!--- Log the error with the available information --->
    <cflog file="errorLog" type="error" text="[Error in add_242_2.cfm]: #cfcatch.detail#">
    <cfthrow message="Database error occurred while inserting site link." detail="#cfcatch.detail#">
</cfcatch>
</cftry>


    <!--- Return the inserted ID --->
    <cfreturn insertedID>
</cffunction>

<cffunction name="SELsitelinks_user_24448" access="public" returntype="query">
    <cfargument name="sitename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM sitelinks_user_tbl
            WHERE sitename = <cfqueryparam value="#arguments.sitename#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteLinksUser: #cfcatch.message# Query: SELECT * FROM sitelinks_user_tbl WHERE sitename = ? AND userid = ? Parameters: sitename=#arguments.sitename#, userid=#arguments.userid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSsitelinks_user_24449" access="public" returntype="void">
    <cfargument name="sitename" type="string" required="true">
    <cfargument name="siteurl" type="string" required="true">
    <cfargument name="siteicon" type="string" required="true">
    <cfargument name="sitetypeid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO sitelinks_user_tbl (siteName, siteURL, siteicon, siteTypeid, userid)
            VALUES (
                <cfqueryparam value="#arguments.sitename#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.siteurl#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.siteicon#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertSiteLink: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting site link.">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
