<cfcomponent displayname="AuditionSubmitSiteUserService" hint="Handles operations for AuditionSubmitSiteUser table" output="false"> 
<cffunction name="getSubmitSites" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT submitsiteid, submitsitename, catlist
            FROM audsubmitsites_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND submitsitename <> ''
            ORDER BY submitsitename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSubmitSites: #cfcatch.message#; SQL: #cfcatch.Sql#; Data: #arguments.userid#">
            <cfset result = QueryNew("submitsiteid, submitsitename, catlist")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getSubmitSiteId" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_submitsitename" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT submitsiteid 
            FROM audsubmitsites_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
              AND submitsitename = <cfqueryparam value="#arguments.new_submitsitename#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSubmitSiteId: #cfcatch.message#; Query: SELECT submitsiteid FROM audsubmitsites_user WHERE userid = ? AND submitsitename = ?; Parameters: userid=#arguments.userid#, new_submitsitename=#arguments.new_submitsitename#">
            <cfreturn queryNew("submitsiteid", "integer")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateSubmitSite" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="sortedCatList" type="string" required="false" default="">
    <cfargument name="submitsiteid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating submit site: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAudSubmitSitesUser" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="sortedCatList" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audsubmitsites_user (submitsitename, catlist, userid)
            VALUES (
                <cfqueryparam value="#arguments.new_submitsitename#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.sortedCatList#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audsubmitsites_user: #cfcatch.message# Query: INSERT INTO audsubmitsites_user (submitsitename, catlist, userid) VALUES ('#arguments.new_submitsitename#', '#arguments.sortedCatList#', #arguments.userid#)">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSubmitSiteDetails" access="public" returntype="query">
    <cfargument name="submitsiteid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT submitsiteid, submitsitename, catlist
            FROM audsubmitsites_user
            WHERE submitsiteid = <cfqueryparam value="#arguments.submitsiteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSubmitSiteDetails: #cfcatch.message# - Query: SELECT submitsiteid, submitsitename, catlist FROM audsubmitsites_user WHERE submitsiteid = #arguments.submitsiteid#">
            <cfset result = queryNew("submitsiteid, submitsitename, catlist")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateSubmitSite" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="isdeleted" type="boolean" required="true">
    <cfargument name="catlist" type="string" required="false" default="">
    <cfargument name="sortedCatList" type="string" required="false" default="">
    <cfargument name="submitsiteid" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var params = []>

    <cftry>
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

        <cfquery datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <cflog file="application" text="Error in updateSubmitSite: #cfcatch.message#" type="error">
        <!--- Optionally rethrow or handle the error --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSubmitSites" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT submitsiteid, submitsitename 
            FROM audsubmitsites_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND catlist LIKE <cfqueryparam value="%#arguments.new_audcatid#%" cfsqltype="CF_SQL_VARCHAR"> 
            AND isdeleted = 0 
            ORDER BY submitsitename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getSubmitSites: #cfcatch.message# Query: SELECT submitsiteid, submitsitename FROM audsubmitsites_user WHERE userid = ? AND catlist LIKE ? AND isdeleted = 0 ORDER BY submitsitename Parameters: userid=#arguments.userid#, new_audcatid=#arguments.new_audcatid#">
            <cfset result = queryNew("submitsiteid,submitsitename", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getSubmitSiteDetails" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_submitsitename" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                submitsiteid AS new_submitsiteid, 
                catlist AS new_catlist 
            FROM 
                audsubmitsites_user 
            WHERE 
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND submitsitename = <cfqueryparam value="#trim(arguments.new_submitsitename)#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getSubmitSiteDetails: #cfcatch.message#">
            <cfset result = queryNew("new_submitsiteid,new_catlist", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateAudSubmitSitesUser" access="public" returntype="void">
    <cfargument name="new_catlist" type="string" required="true">
    <cfargument name="new_submitsiteid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audsubmitsites_user 
            SET catlist = <cfqueryparam value="#arguments.new_catlist#" cfsqltype="CF_SQL_VARCHAR">
            WHERE submitsiteid = <cfqueryparam value="#arguments.new_submitsiteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audsubmitsites_user: #cfcatch.message#">
            <cfthrow message="Error updating record in audsubmitsites_user table.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertSubmitSite" access="public" returntype="void">
    <cfargument name="new_submitsitename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_catid" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audsubmitsites_user_tbl (submitsiteName, userid, catlist)
            VALUES (
                <cfqueryparam value="#trim(arguments.new_submitsitename)#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audsubmitsites_user_tbl: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
