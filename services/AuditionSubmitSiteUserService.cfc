<cfcomponent displayname="AuditionSubmitSiteUserService" hint="Handles operations for AuditionSubmitSiteUser table" output="false"> 

<cffunction name="SELaudsubmitsites_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT submitsiteid, submitsitename, catlist
        FROM audsubmitsites_user
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND submitsitename <> ''
        ORDER BY submitsitename
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELaudsubmitsites_user_24034" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT submitsiteid 
        FROM audsubmitsites_user 
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
          AND submitsitename = <cfqueryparam value="#arguments.new_submitsitename#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="UPDaudsubmitsites_user" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="sortedCatList" type="string" required="false" default="">
    <cfargument name="submitsiteid" type="numeric" required="true">
    <cfquery result="result">
        UPDATE audsubmitsites_user 
        SET submitsitename = <cfqueryparam value="#arguments.new_submitsitename#" cfsqltype="CF_SQL_VARCHAR">,
            isDeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            <cfif arguments.sortedCatList neq "">,
                catlist = <cfqueryparam value="#arguments.sortedCatList#" cfsqltype="CF_SQL_VARCHAR">
            <cfelse>,
                catlist = NULL
            </cfif>
        WHERE submitsiteid = <cfqueryparam value="#arguments.submitsiteid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudsubmitsites_user" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="sortedCatList" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfquery result="result">
        INSERT INTO audsubmitsites_user (submitsitename, catlist, userid)
        VALUES (
            <cfqueryparam value="#arguments.new_submitsitename#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.sortedCatList#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="DETaudsubmitsites_user" access="public" returntype="query">
    <cfargument name="submitsiteid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT submitsiteid, submitsitename, catlist
        FROM audsubmitsites_user
        WHERE submitsiteid = <cfqueryparam value="#arguments.submitsiteid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="UPDaudsubmitsites_user_24167" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="isdeleted" type="boolean" required="true">
    <cfargument name="catlist" type="string" required="false" default="">
    <cfargument name="sortedCatList" type="string" required="false" default="">
    <cfargument name="submitsiteid" type="numeric" required="true">
    <cfset var sql = "">
    <cfset var params = []>
    <cfset sql = "
        UPDATE audsubmitsites_user 
        SET submitsitename = ?, 
            isDeleted = ? 
            #iif(arguments.catlist neq '', ', catlist = ?', ', catlist = NULL')#
        WHERE submitsiteid = ?
    ">
    <cfset arrayAppend(params, {value=arguments.new_submitsitename, cfsqltype='CF_SQL_VARCHAR'})>
    <cfset arrayAppend(params, {value=arguments.isdeleted, cfsqltype='CF_SQL_BIT'})>
    <cfif arguments.catlist neq "">
        <cfset arrayAppend(params, {value=arguments.sortedCatList, cfsqltype='CF_SQL_VARCHAR'})>
    </cfif>
    <cfset arrayAppend(params, {value=arguments.submitsiteid, cfsqltype='CF_SQL_INTEGER'})>
    <cfquery result="result">
        #sql#
        <cfloop array="#params#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>
</cffunction>

<cffunction name="SELaudsubmitsites_user_24265" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="string" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT submitsiteid, submitsitename 
        FROM audsubmitsites_user 
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
        AND catlist LIKE <cfqueryparam value="%#arguments.new_audcatid#%" cfsqltype="CF_SQL_VARCHAR"> 
        AND isdeleted = 0 
        ORDER BY submitsitename
    </cfquery>
    <cfreturn result>
</cffunction>


<cffunction name="SELaudsubmitsites_user_24295" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_submitsitename" type="string" required="true">

    <cfset var result = "">
    
        <cfquery name="result" datasource="abod">
            SELECT 
                submitsiteid AS new_submitsiteid, 
                catlist AS new_catlist 
            FROM 
                audsubmitsites_user 
            WHERE 
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND submitsitename = <cfqueryparam value="#trim(arguments.new_submitsitename)#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>


    <cfreturn result>
</cffunction>
<cffunction name="UPDaudsubmitsites_user_24296" access="public" returntype="void">
    <cfargument name="new_catlist" type="string" required="true">
    <cfargument name="new_submitsiteid" type="numeric" required="true">


        <cfquery result="result" datasource="abod">
            UPDATE audsubmitsites_user 
            SET catlist = <cfqueryparam value="#arguments.new_catlist#" cfsqltype="CF_SQL_VARCHAR">
            WHERE submitsiteid = <cfqueryparam value="#arguments.new_submitsiteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

</cffunction>
<cffunction name="INSaudsubmitsites_user_24297" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_catid" type="string" required="true">

        <cfquery result="result" datasource="abod">
            INSERT INTO audsubmitsites_user_tbl (submitsiteName, userid, catlist)
            VALUES (
                <cfqueryparam value="#trim(arguments.new_submitsitename)#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
 
</cffunction></cfcomponent>
