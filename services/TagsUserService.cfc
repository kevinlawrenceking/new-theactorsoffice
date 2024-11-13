<cfcomponent displayname="TagsUserService" hint="Handles operations for TagsUser table" output="false"> 
<cffunction name="SELtags_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT tagid AS id, tagname AS name
        FROM tags_user
        WHERE iscasting = <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_INTEGER">
        ORDER BY tagname
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELtags_user_23804" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT tagname AS col1
        FROM tags_user
        WHERE userid = <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        ORDER BY tagname
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELtags_user_23844" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT tagid, tagname 
        FROM tags_user 
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
        ORDER BY tagname
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELtags_user_24047" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagtypes" type="string" required="false" default="">
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM tags_user 
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        <cfif arguments.tagtypes eq "team">
            AND isteam = <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
        </cfif>
        ORDER BY tagname
    </cfquery>
        
    <cfreturn result>
</cffunction>

<cffunction name="SELtags_user_24063" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM tags_user
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        ORDER BY tagname
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELtags_user_24324" access="public" returntype="query">
    <cfargument name="new_valuetext" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM tags_user
        WHERE tagname = <cfquery result="result" param value="#left(arguments.new_valuetext, 40)#" cfsqltype="CF_SQL_VARCHAR">
          AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INStags_user" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_valuetext" type="string" required="true">

    <cfset var trimmedValueText = left(arguments.new_valuetext, 40)>

    <cfquery result="result" >
        INSERT INTO tags_user (userid, tagname, IsCustom)
        VALUES (
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#trimmedValueText#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
        )
    </cfquery>
</cffunction>

<cffunction name="SELtags_user_24328" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM tags_user
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND iscustom = <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="UPDtags_user" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagname" type="string" required="true">

    <cfquery result="result" >
        UPDATE tags_user_tbl 
        SET isdeleted = 1 
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
        AND iscustom = 1 
        AND tagname = <cfquery result="result" param value="#left(arguments.tagname, 40)#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
</cffunction>

<cffunction name="SELtags_user_24341" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT d.contactid 
        FROM tags_user tu 
        INNER JOIN taousers u ON u.userid = tu.userid 
        INNER JOIN contactdetails d ON d.userid = u.userid 
        INNER JOIN contactitems i ON i.contactID = d.contactid 
        WHERE i.valuecategory = <cfquery result="result" param value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
          AND i.valuetype = <cfquery result="result" param value="Tags" cfsqltype="CF_SQL_VARCHAR"> 
          AND tu.tagtype = <cfquery result="result" param value="C" cfsqltype="CF_SQL_CHAR"> 
          AND tu.tagname = i.valuetext 
          AND d.contactid = <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELtags_user_24457" access="public" returntype="query">
    <cfargument name="tagname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM tags_user 
            WHERE tagname = <cfquery result="result" param value="#arguments.tagname#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        

    <cfreturn result>
</cffunction>
<cffunction name="INStags_user_24458" access="public" returntype="void">
    <cfargument name="tagname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagtype" type="string" required="true">

    
        <cfquery result="result"  datasource="abod">
            INSERT INTO tags_user (tagname, userid, tagtype)
            VALUES (
                <cfquery result="result" param value="#arguments.tagname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfquery result="result" param value="#arguments.tagtype#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

</cffunction>
<cffunction name="UPDtags_user_24459" access="public" returntype="void">
    <cfargument name="select_userid" type="numeric" required="true">
    
    
        <cfquery result="result"  datasource="abod" name="updateQuery">
            UPDATE tags_user 
            SET IsTeam = 1 
            WHERE userid = <cfquery result="result" param value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND tagname IN (
                SELECT tagname 
                FROM tags 
                WHERE isteam = <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
</cffunction>
<cffunction name="UPDtags_user_24460" access="public" returntype="void">
    <cfargument name="select_userid" type="numeric" required="true">
    
    <cfset var sql = "">
    <cfset var params = []>
    
    
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
        
        <cfquery result="result"  name="updateQuery" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfquery result="result" param value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

</cffunction>
<cffunction name="SELtags_user_24765" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var queryResult = "">
    
    
        <cfquery result="result"  name="queryResult" datasource="abod">
            SELECT tagname 
            FROM tags_user 
            WHERE userid = <cfquery result="result" param value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY tagname
        </cfquery>
    

    <cfreturn queryResult>
</cffunction></cfcomponent>
