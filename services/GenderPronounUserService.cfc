<cfcomponent displayname="GenderPronounUserService" hint="Handles operations for GenderPronounUser table" output="false"> 
<cffunction name="getGenderPronoun" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT genderPronoun
            FROM genderpronouns_users
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getGenderPronoun: #cfcatch.message#">
            <cfset result = queryNew("genderPronoun")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getGenderPronounsUsers" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="custom" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM genderpronouns_users 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND genderPronoun = <cfqueryparam value="#arguments.custom#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getGenderPronounsUsers: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertGenderPronounsUser" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="custom" type="string" required="true">

    <cftry>
        <cfquery datasource="yourDatasourceName">
            INSERT INTO genderpronouns_users_tbl (userid, isDeleted, isCustom, genderpronoun, genderpronounPlural)
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.custom#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.custom#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error in insertGenderPronounsUser: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserByGenderPronoun" access="public" returntype="query">
    <cfargument name="genderpronoun" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM genderpronouns_users 
            WHERE genderpronoun = <cfqueryparam value="#arguments.genderpronoun#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserByGenderPronoun: #cfcatch.message# - Query: SELECT * FROM genderpronouns_users WHERE genderpronoun = ? AND userid = ? - Parameters: #arguments.genderpronoun#, #arguments.userid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertGenderPronounsUser" access="public" returntype="void">
    <cfargument name="genderpronoun" type="string" required="true">
    <cfargument name="genderpronounplural" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO genderpronouns_users (genderpronoun, genderpronounplural, userid)
            VALUES (
                <cfqueryparam value="#arguments.genderpronoun#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.genderpronounplural#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" type="error" text="Error inserting into genderpronouns_users: #cfcatch.message#">
            <cfthrow message="Database insertion error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getGenderPronoun" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT genderPronoun
            FROM genderpronouns_users
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getGenderPronoun: #cfcatch.message# Query: SELECT genderPronoun FROM genderpronouns_users WHERE userid = ? Parameters: #arguments.userid#">
            <cfset result = queryNew("genderPronoun")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
