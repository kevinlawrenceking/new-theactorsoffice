<cfcomponent displayname="AuditionGenreUserService" hint="Handles operations for AuditionGenreUser table" output="false"> 
<cffunction name="getAudGenresUser" access="public" returntype="query">
    <cfargument name="audcatid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM audgenres_user
            WHERE audcatid = <cfqueryparam value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudGenresUser: #cfcatch.message# - Query: SELECT * FROM audgenres_user WHERE audcatid = ? AND userid = ? - Parameters: audcatid=#arguments.audcatid#, userid=#arguments.userid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getAudGenresUser" access="public" returntype="query">
    <cfargument name="new_audcatid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audgenres_user 
            WHERE audcatid = <cfqueryparam value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
              AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudGenresUser: #cfcatch.message# - Query: SELECT * FROM audgenres_user WHERE audcatid = #arguments.new_audcatid# AND userid = #arguments.userid#;">
            <cfthrow message="Error executing query in getAudGenresUser." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getAudGenresByUser" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audgenreid, audgenre, audcatid
            FROM audgenres_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND audcatid = <cfqueryparam value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY audgenre
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudGenresByUser: #cfcatch.message# Query: SELECT audgenreid, audgenre, audcatid FROM audgenres_user WHERE userid = ? AND audcatid = ? ORDER BY audgenre Parameters: userid=#arguments.userid#, new_audcatid=#arguments.new_audcatid#">
            <cfset result = queryNew("audgenreid,audgenre,audcatid","integer,varchar,integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getAudGenreId" access="public" returntype="query">
    <cfargument name="new_genre" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audgenreid
            FROM audgenres_user
            WHERE audgenre = <cfqueryparam value="#arguments.new_genre#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudGenreId: #cfcatch.message# Query: SELECT audgenreid FROM audgenres_user WHERE audgenre = #arguments.new_genre# AND userid = #arguments.userid#">
            <cfthrow message="Database error occurred while retrieving audgenreid.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertAudgenresUser" access="public" returntype="void">
    <cfargument name="new_genre" type="string" required="true">
    <cfargument name="new_catid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="yourDataSource">
            INSERT INTO audgenres_user (audgenre, audcatid, userid)
            VALUES (
                <cfqueryparam value="#arguments.new_genre#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into audgenres_user: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getAudGenres" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT g.audgenre 
            FROM audgenres_user g 
            INNER JOIN audgenres_audition_xref x ON x.audgenreID = g.audgenreID 
            WHERE x.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND g.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY g.audgenre
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudGenres: #cfcatch.message#">
            <cfset result = queryNew("audgenre")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
