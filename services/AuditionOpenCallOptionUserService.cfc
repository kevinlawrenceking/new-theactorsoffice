<cfcomponent displayname="AuditionOpenCallOptionUserService" hint="Handles operations for AuditionOpenCallOptionUser table" output="false"> 
<cffunction name="SELaudopencalloptions_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT opencallid, opencallname
        FROM audopencalloptions_user
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        ORDER BY opencallname
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELaudopencalloptions_user_24262" access="public" returntype="query">
    <cfargument name="new_opencallid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT opencallid, opencallname
        FROM audopencalloptions_user
        WHERE opencallid = <cfquery result="result" param value="#arguments.new_opencallid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELaudopencalloptions_user_24280" access="public" returntype="query">
    <cfargument name="new_opencallname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM audopencalloptions_user
        WHERE opencallname = <cfquery result="result" param value="#arguments.new_opencallname#" cfsqltype="CF_SQL_VARCHAR">
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSaudopencalloptions_user" access="public" returntype="void">
    <cfargument name="new_opencallname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO audopencalloptions_user (opencallname, userid, isdeleted)
        VALUES (
            <cfquery result="result" param value="#arguments.new_opencallname#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
        )
    </cfquery>
</cffunction></cfcomponent>