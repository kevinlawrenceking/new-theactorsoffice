<cfcomponent displayname="ItemCategoryXRefUserService" hint="Handles operations for ItemCategoryXRefUser table" output="false"> 
<cffunction name="INSitemcatxref_user" access="public" returntype="void">
    <cfargument name="new_typeid" type="numeric" required="true">
    <cfargument name="catid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO itemcatxref_user (typeid, catid, userid, IsCustom) 
        VALUES (
            <cfquery result="result" param value="#arguments.new_typeid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.catid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
        )
    </cfquery>
</cffunction>

<cffunction name="SELitemcatxref_user" access="public" returntype="query">
    <cfargument name="select_userid" type="numeric" required="true">
    <cfargument name="new_typeid" type="numeric" required="true">
    <cfargument name="new_catid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM itemcatxref_user
        WHERE userid = <cfquery result="result" param value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
        AND typeid = <cfquery result="result" param value="#arguments.new_typeid#" cfsqltype="CF_SQL_INTEGER">
        AND catid = <cfquery result="result" param value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSitemcatxref_user_24468" access="public" returntype="void" output="false">
    <cfargument name="new_typeid" type="numeric" required="true">
    <cfargument name="new_catid" type="numeric" required="true">
    <cfargument name="select_userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO itemcatxref_user (typeid, catid, userid)
        VALUES (
            <cfquery result="result" param value="#arguments.new_typeid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction></cfcomponent>