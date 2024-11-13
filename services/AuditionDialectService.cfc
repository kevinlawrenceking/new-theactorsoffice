<cfcomponent displayname="AuditionDialectService" hint="Handles operations for AuditionDialect table" output="false"> 
<cffunction name="INSauddialects" access="public" returntype="void">
    <cfargument name="new_auddialect" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO auddialects (auddialect, audCatid, isDeleted) 
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_auddialect#" maxlength="100" null="#NOT len(trim(arguments.new_auddialect))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDauddialects" access="public" returntype="void">
    <cfargument name="new_auddialect" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_auddialectid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE auddialects 
        SET 
            auddialect = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_auddialect)#" maxlength="100" null="#NOT len(trim(arguments.new_auddialect))#" />, 
            audCatid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#" />, 
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#" /> 
        WHERE 
            auddialectid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_auddialectid#" />
    </cfquery>
</cffunction>
</cfcomponent>