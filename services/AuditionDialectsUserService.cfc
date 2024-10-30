<cfcomponent displayname="AuditionDialectsUserService" hint="Handles operations for AuditionDialectsUser table" output="false"> 
<cffunction name="INSauddialects_user" access="public" returntype="void">
    <cfargument name="CustomDialect" type="string" required="true">
    <cfargument name="new_catid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auddialects_user_tbl (auddialect, audcatid, userid)
            VALUES (
                <cfqueryparam value="#arguments.CustomDialect#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertAuddialectsUser: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting into auddialects_user_tbl.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELauddialects_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.auddialectid AS ID, 
                a.auddialect AS NAME, 
                a.audcatid, 
                a.userid 
            FROM 
                auddialects_user a 
            WHERE 
                a.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND a.audcatid = <cfqueryparam value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                a.auddialect
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudDialectsUser: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving the data.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
