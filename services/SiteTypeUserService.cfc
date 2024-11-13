<cfcomponent displayname="SiteTypeUserService" hint="Handles operations for SiteTypeUser table" output="false"> 
<cffunction name="SELsitetypes_user" access="public" returntype="query">
    <cfargument name="sitetypeid" type="numeric" required="true">

    <cfset var result = "">
    <cfset var sql = "SELECT pnid FROM sitetypes_user_tbl WHERE sitetypeid = ?">

    <cfquery name="result">
        #sql#
        <cfquery result="result" param value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>
<cffunction name="UPDsitetypes_user" access="public" returntype="void">
    <cfargument name="sitetypeid" type="numeric" required="true">

    <cfquery result="result"  name="queryResult">
        UPDATE sitetypes_user_tbl 
        SET isdeleted = 1 
        WHERE sitetypeid = <cfquery result="result" param value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>
<cffunction name="SELsitetypes_user_24133" access="public" returntype="query">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT 
            p.pnid, 
            p.isvisible, 
            s.sitetypeid, 
            s.sitetypename, 
            s.sitetypedescription, 
            s.pntitle 
        FROM 
            sitetypes_user s 
        LEFT JOIN 
            pgpanels_user p ON p.pnid = s.pnid 
        WHERE 
            s.sitetypeid = <cfquery result="result" param value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
        
    <cfreturn result>
</cffunction>
<cffunction name="UPDsitetypes_user_24134" access="public" returntype="void">
    <cfargument name="new_sitetypename" type="string" required="true">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
 
    <cfquery result="result"  >
        UPDATE sitetypes_user 
        SET sitetypename = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.new_sitetypename#" />
        WHERE sitetypeid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.new_sitetypeid#" />
    </cfquery>

</cffunction>
<cffunction name="SELsitetypes_user_24144" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_sitetypename" type="string" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM sitetypes_user
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND sitetypename = <cfquery result="result" param value="#arguments.new_sitetypename#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSsitetypes_user" access="public" returntype="void">
    <cfargument name="new_siteTypeName" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO sitetypes_user_tbl (siteTypeName, siteTypeDescription, userid, IsDeleted) 
        VALUES (
            <cfquery result="result" param value="#arguments.new_siteTypeName#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
        )
    </cfquery>
</cffunction>
<cffunction name="SELsitetypes_user_24146" access="public" returntype="query">
    <cfargument name="sitetypeid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM sitetypes_user
        WHERE sitetypeid = <cfquery result="result" param value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDsitetypes_user_24149" access="public" returntype="void">
    <cfargument name="new_pnid" type="numeric" required="true">
    <cfargument name="new_sitetypeid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE sitetypes_user
        SET pnid = <cfquery result="result" param value="#arguments.new_pnid#" cfsqltype="CF_SQL_INTEGER">
        WHERE sitetypeid = <cfquery result="result" param value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>
<cffunction name="SELsitetypes_user_24438" access="public" returntype="query">
    <cfargument name="sitetypename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM sitetypes_user 
        WHERE sitetypename = <cfquery result="result" param value="#arguments.sitetypename#" cfsqltype="CF_SQL_VARCHAR"> 
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>
<cffunction name="INSsitetypes_user_24439" access="public" returntype="void">
    <cfargument name="siteTypeName" type="string" required="true">
    <cfargument name="siteTypeDescription" type="string" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO sitetypes_user (siteTypeName, siteTypeDescription, userid) 
        VALUES (
            <cfquery result="result" param value="#arguments.siteTypeName#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.siteTypeDescription#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>
<cffunction name="SELsitetypes_user_24447" access="public" returntype="query">
    <cfargument name="sitetypename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT sitetypeid 
            FROM sitetypes_user 
            WHERE sitetypename = <cfquery result="result" param value="#arguments.sitetypename#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypeId: #cfcatch.message#">
            <cfset result = queryNew("sitetypeid")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELsitetypes_user_24752" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT sitetypeid, sitetypename, sitetypedescription, pntitle
            FROM sitetypes_user
            WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY sitetypename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypesByUserId: #cfcatch.message# Query: SELECT sitetypeid, sitetypename, sitetypedescription, pntitle FROM sitetypes_user WHERE userid = ? ORDER BY sitetypename Parameters: #arguments.userid#">
            <cfset result = queryNew("sitetypeid,sitetypename,sitetypedescription,pntitle")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
