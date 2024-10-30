<cfcomponent displayname="AuditionToneUserService" hint="Handles operations for AuditionToneUser table" output="false"> 
<cffunction name="INSaudtones_user" access="public" returntype="void">
    <cfargument name="tone" type="string" required="true">
    <cfargument name="audcatid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audtones_user (tone, audcatid, userid)
            VALUES (
                <cfqueryparam value="#arguments.tone#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audtones_user: #cfcatch.message#; Query: INSERT INTO audtones_user (tone, audcatid, userid) VALUES ('#arguments.tone#', #arguments.audcatid#, #arguments.userid#)">
            <cfthrow message="Database insertion error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudtones_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                a.toneid AS ID, 
                a.tone AS NAME, 
                a.audcatid, 
                a.userid 
            FROM 
                audtones_user a 
            WHERE 
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND audcatid = <cfqueryparam value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                a.tone
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserTones: #cfcatch.message# Query: SELECT a.toneid AS ID, a.tone AS NAME, a.audcatid, a.userid FROM audtones_user WHERE userid = #arguments.userid# AND audcatid = #arguments.new_audcatid# ORDER BY a.tone">
            <cfset result = queryNew("ID, NAME, audcatid, userid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
