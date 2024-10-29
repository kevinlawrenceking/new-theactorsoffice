<cfcomponent displayname="TagsUserService" hint="Handles operations for TagsUser table" output="false"> 
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT tagid AS id, tagname AS name
            FROM tags_user
            WHERE iscasting = <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_INTEGER">
            ORDER BY tagname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTags: #cfcatch.message#">
            <cfset result = queryNew("id,name")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT tagname AS col1
            FROM tags_user
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY tagname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTags: #cfcatch.message#">
            <cfreturn queryNew("col1")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT tagid, tagname 
            FROM tags_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY tagname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTags: #cfcatch.message# Query: SELECT tagid, tagname FROM tags_user WHERE userid = ? ORDER BY tagname Parameters: #arguments.userid#">
            <cfthrow message="An error occurred while retrieving user tags." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getTagsUser" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagtypes" type="string" required="false" default="">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM tags_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfif arguments.tagtypes eq "team">
                AND isteam = <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            </cfif>
            ORDER BY tagname
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getTagsUser: #cfcatch.message#; SQL: #cfcatch.sql#; Parameters: userid=#arguments.userid#, tagtypes=#arguments.tagtypes#">
            <cfthrow message="An error occurred while retrieving tags." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM tags_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY tagname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getUserTags: #cfcatch.message# Query: SELECT * FROM tags_user WHERE userid = ? ORDER BY tagname Parameters: userid=#arguments.userid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="new_valuetext" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM tags_user
            WHERE tagname = <cfqueryparam value="#left(arguments.new_valuetext, 40)#" cfsqltype="CF_SQL_VARCHAR">
              AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTags: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertTagUser" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_valuetext" type="string" required="true">

    <cfset var trimmedValueText = left(arguments.new_valuetext, 40)>

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO tags_user (userid, tagname, IsCustom)
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#trimmedValueText#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into tags_user: #cfcatch.message# Query: INSERT INTO tags_user (userid, tagname, IsCustom) VALUES (#arguments.userid#, #trimmedValueText#, 1)">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM tags_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND iscustom = <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTags: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateTagsUserTbl" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagname" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE tags_user_tbl 
            SET isdeleted = 1 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND iscustom = 1 
            AND tagname = <cfqueryparam value="#left(arguments.tagname, 40)#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error updating tags_user_tbl: #cfcatch.message#">
            <cfthrow message="Database update failed" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getContactIdByTag" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT d.contactid 
            FROM tags_user tu 
            INNER JOIN taousers u ON u.userid = tu.userid 
            INNER JOIN contactdetails d ON d.userid = u.userid 
            INNER JOIN contactitems i ON i.contactID = d.contactid 
            WHERE i.valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
              AND i.valuetype = <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR"> 
              AND tu.tagtype = <cfqueryparam value="C" cfsqltype="CF_SQL_CHAR"> 
              AND tu.tagname = i.valuetext 
              AND d.contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactIdByTag: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getTagsUser" access="public" returntype="query">
    <cfargument name="tagname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM tags_user 
            WHERE tagname = <cfqueryparam value="#arguments.tagname#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getTagsUser: #cfcatch.message#; SQL: #cfcatch.sql#; Parameters: tagname=#arguments.tagname#, userid=#arguments.userid#">
            <cfthrow message="Error executing query in getTagsUser." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertTagUser" access="public" returntype="void">
    <cfargument name="tagname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagtype" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO tags_user (tagname, userid, tagtype)
            VALUES (
                <cfqueryparam value="#arguments.tagname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.tagtype#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertTagUser: #cfcatch.message# Query: INSERT INTO tags_user (tagname, userid, tagtype) VALUES (#arguments.tagname#, #arguments.userid#, #arguments.tagtype#)">
            <cfthrow message="Error executing query in insertTagUser function." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserTags" access="public" returntype="void">
    <cfargument name="select_userid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="yourDataSource" name="updateQuery">
            UPDATE tags_user 
            SET IsTeam = 1 
            WHERE userid = <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND tagname IN (
                SELECT tagname 
                FROM tags 
                WHERE isteam = <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user tags: #cfcatch.message#" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateTagsUser" access="public" returntype="void">
    <cfargument name="select_userid" type="numeric" required="true">
    
    <cfset var sql = "">
    <cfset var params = []>
    
    <cftry>
        <cfset sql = "
            UPDATE tags_user 
            SET Iscasting = 1 
            WHERE userid = ? 
            AND tagname IN (
                SELECT tagname 
                FROM tags 
                WHERE Iscasting = 1
            )
        ">
        
        <cfset arrayAppend(params, {value=arguments.select_userid, cfsqltype="CF_SQL_INTEGER"})>
        
        <cfquery name="updateQuery" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in updateTagsUser: #cfcatch.message# Query: #sql# Parameters: #params#">
            <cfthrow message="Database error occurred. Please check the logs for more details.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserTags" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            SELECT tagname 
            FROM tags_user 
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY tagname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTags: #cfcatch.message# - Query: SELECT tagname FROM tags_user WHERE userid = ? ORDER BY tagname - UserID: #arguments.userId#">
            <cfreturn queryNew("tagname")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
