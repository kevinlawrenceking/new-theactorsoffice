<cfcomponent displayname="GenderPronounUserService" hint="Handles operations for GenderPronounUser table" output="false"> 

<cffunction name="SELgenderpronouns_users" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT genderPronoun
        FROM genderpronouns_users
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELgenderpronouns_users_24203" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="custom" type="string" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM genderpronouns_users 
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
        AND genderPronoun = <cfquery result="result" param value="#arguments.custom#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSgenderpronouns_users" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="custom" type="string" required="true">

    <cfquery result="result" >
        INSERT INTO genderpronouns_users_tbl (userid, isDeleted, isCustom, genderpronoun, genderpronounPlural)
        VALUES (
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">,
            <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">,
            <cfquery result="result" param value="#arguments.custom#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.custom#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="SELgenderpronouns_users_24444" access="public" returntype="query">
    <cfargument name="genderpronoun" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM genderpronouns_users 
        WHERE genderpronoun = <cfquery result="result" param value="#arguments.genderpronoun#" cfsqltype="CF_SQL_VARCHAR"> 
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSgenderpronouns_users_24445" access="public" returntype="void">
    <cfargument name="genderpronoun" type="string" required="true">
    <cfargument name="genderpronounplural" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO genderpronouns_users (genderpronoun, genderpronounplural, userid)
        VALUES (
            <cfquery result="result" param value="#arguments.genderpronoun#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.genderpronounplural#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="SELgenderpronouns_users_24627" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT genderPronoun
        FROM genderpronouns_users
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

</cfcomponent>