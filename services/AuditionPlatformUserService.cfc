<cfcomponent displayname="AuditionPlatformUserService" hint="Handles operations for AuditionPlatformUser table" output="false"> 
<cffunction name="SELaudPlatforms_user_23778" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="CustomPlatform" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audplatformid 
            FROM audPlatforms_user_tbl 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND audplatform = <cfqueryparam value="#arguments.CustomPlatform#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudPlatformId: #cfcatch.message# - Query: SELECT audplatformid FROM audPlatforms_user_tbl WHERE userid = ? AND audplatform = ? - Parameters: userid=#arguments.userid#, CustomPlatform=#arguments.CustomPlatform#">
            <cfset result = queryNew("audplatformid", "integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudPlatforms_user_23779" access="public" returntype="void">
    <cfargument name="CustomPlatform" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audPlatforms_user_tbl (audPlatform, userid) 
            VALUES (
                <cfqueryparam value="#arguments.CustomPlatform#" cfsqltype="CF_SQL_VARCHAR">, 
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudPlatformUser: #cfcatch.message#">
            <cfthrow message="Error executing query in insertAudPlatformUser" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudplatforms_user_24582" access="public" returntype="query">
    <cfargument name="new_userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audplatformid AS ID, audplatform AS NAME
            FROM audplatforms_user
            WHERE userid = <cfqueryparam value="#arguments.new_userid#" cfsqltype="cf_sql_integer" />
            ORDER BY audplatform
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserAudPlatforms: #cfcatch.message# Query: SELECT audplatformid AS ID, audplatform AS NAME FROM audplatforms_user WHERE userid = ? ORDER BY audplatform Parameters: #arguments.new_userid#">
            <cfset result = queryNew("ID, NAME", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
