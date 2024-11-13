<cfcomponent displayname="AuditionPlatformsService" hint="Handles operations for AuditionPlatforms table" output="false"> 
<cffunction name="INSaudplatforms" access="public" returntype="void">
    <cfargument name="new_audplatform" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO audplatforms (audplatform, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audplatform)#" maxlength="100" null="#NOT len(trim(arguments.new_audplatform))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        )
    </cfquery>
</cffunction>
<cffunction name="UPDaudplatforms" access="public" returntype="void">
    <cfargument name="new_audplatform" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audplatformid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audplatforms 
        SET 
            audplatform = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audplatform#" maxlength="100" null="#NOT len(trim(arguments.new_audplatform))#">,
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        WHERE 
            audplatformid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#">
    </cfquery>
</cffunction></cfcomponent>