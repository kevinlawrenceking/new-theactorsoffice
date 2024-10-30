<cfcomponent displayname="AuditionContractTypeService" hint="Handles operations for AuditionContractType table" output="false"> 
<cffunction name="INSaudcontracttypes" access="public" returntype="void">
    <cfargument name="new_contracttype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audcontracttypes (contracttype, audCatid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_contracttype#" maxlength="100" null="#NOT len(trim(arguments.new_contracttype))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audcontracttypes: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudcontracttypes" access="public" returntype="void">
    <cfargument name="new_contracttype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_contracttypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audcontracttypes 
            SET 
                contracttype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_contracttype#" maxlength="100" null="#NOT len(trim(arguments.new_contracttype))#">,
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                contracttypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contracttypeid#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audcontracttypes: #cfcatch.message#. Query: UPDATE audcontracttypes SET contracttype = ?, audCatid = ?, isDeleted = ? WHERE contracttypeid = ?. Parameters: new_contracttype=#arguments.new_contracttype#, new_audCatid=#arguments.new_audCatid#, new_isDeleted=#arguments.new_isDeleted#, new_contracttypeid=#arguments.new_contracttypeid#">
            <cfthrow message="An error occurred while updating the contract types." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
