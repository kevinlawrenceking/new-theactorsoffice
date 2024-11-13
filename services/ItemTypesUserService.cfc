<cfcomponent displayname="ItemTypesUserService" hint="Handles operations for ItemTypesUser table" output="false"> 
<cffunction name="INSitemtypes_user" access="public" returntype="void">
    <cfargument name="customtype" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO itemtypes_user (valuetype, userid)
        VALUES (
            <cfquery result="result" param value="#arguments.customtype#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="SELitemtypes_user" access="public" returntype="query">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM itemtypes_user
        WHERE valuetype = <cfquery result="result" param value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSitemtypes_user_24464" access="public" returntype="void">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="typeicon" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO itemtypes_user (valuetype, typeicon, userid) 
        VALUES (
            <cfquery result="result" param value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.typeicon#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="SELitemtypes_user_24466" access="public" returntype="query">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT typeid
        FROM itemtypes_user
        WHERE valuetype = <cfquery result="result" param value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>
</cfcomponent>