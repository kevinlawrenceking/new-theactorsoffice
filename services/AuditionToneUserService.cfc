<cfcomponent displayname="AuditionToneUserService" hint="Handles operations for AuditionToneUser table" output="false"> 

<cffunction name="INSaudtones_user" access="public" returntype="void">
    <cfargument name="tone" type="string" required="true">
    <cfargument name="audcatid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO audtones_user (tone, audcatid, userid)
        VALUES (
            <cfquery result="result" param value="#arguments.tone#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="SELaudtones_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT 
            a.toneid AS ID, 
            a.tone AS NAME, 
            a.audcatid, 
            a.userid 
        FROM 
            audtones_user a 
        WHERE 
            userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND audcatid = <cfquery result="result" param value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
        ORDER BY 
            a.tone
    </cfquery>
    
    <cfreturn result>
</cffunction>

</cfcomponent>