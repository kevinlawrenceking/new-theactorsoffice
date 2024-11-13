<cfcomponent displayname="AuditionImportErrorService" hint="Handles operations for AuditionImportError table" output="false"> 

<cffunction name="SELauditionsimport_error" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT error_msg 
        FROM auditionsimport_error 
        WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="INSauditionsimport_error" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Duplicate project">

    <cfquery result="result">
        INSERT INTO auditionsimport_error (id, error_msg)
        VALUES (
            <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="INSauditionsimport_error_24355" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Missing project name">

    <cfquery result="result">
        INSERT INTO auditionsimport_error (id, error_msg)
        VALUES (
            <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="INSauditionsimport_error_24356" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Missing Role name">

    <cfquery result="result">
        INSERT INTO auditionsimport_error (id, error_msg) 
        VALUES (
            <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">, 
            <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="INSauditionsimport_error_24358" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Invalid Category">

    <cfquery result="result">
        INSERT INTO auditionsimport_error (id, error_msg)
        VALUES (
            <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="INSauditionsimport_error_24360" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Invalid Source">

    <cfquery result="result">
        INSERT INTO auditionsimport_error (id, error_msg)
        VALUES (
            <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

</cfcomponent>