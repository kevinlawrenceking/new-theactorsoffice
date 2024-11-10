<cfcomponent displayname="AuditionContractTypeService" hint="Handles operations for AuditionContractType table" output="false"> 
<cffunction name="INSaudcontracttypes" access="public" returntype="void">
    <cfargument name="new_contracttype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery>
        INSERT INTO audcontracttypes (contracttype, audCatid, isDeleted)
        VALUES (
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_contracttype#" maxlength="100" null="#NOT len(trim(arguments.new_contracttype))#">,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        )
    </cfquery>
</cffunction>
<cffunction name="UPDaudcontracttypes" access="public" returntype="void">
    <cfargument name="new_contracttype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_contracttypeid" type="numeric" required="true">

    <cfquery>
        UPDATE audcontracttypes 
        SET 
            contracttype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_contracttype#" maxlength="100" null="#NOT len(trim(arguments.new_contracttype))#">,
            audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
            isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        WHERE 
            contracttypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contracttypeid#">
    </cfquery>
</cffunction></cfcomponent>