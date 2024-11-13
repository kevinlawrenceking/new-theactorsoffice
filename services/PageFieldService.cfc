<cfcomponent displayname="PageFieldService" hint="Handles operations for PageField table" output="false"> 

<cffunction name="SELpgfields" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT fname 
        FROM pgfields 
        WHERE pgid = <cfquery result="result" param value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER"> 
        AND updatename = <cfquery result="result" param value="ID" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELpgfields_24115" access="public" returntype="query">
    <cfargument name="rpgid" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM pgfields
        WHERE pgid = <cfquery result="result" param value="#arguments.rpgid#" cfsqltype="CF_SQL_INTEGER">
        AND updatename = <cfquery result="result" param value="ID" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELpgfields_24651" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfargument name="updatename" type="string" required="true" default="ID">

    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM pgfields 
        WHERE pgid = <cfquery result="result" param value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
        AND updatename = <cfquery result="result" param value="#arguments.updatename#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>

</cfcomponent>