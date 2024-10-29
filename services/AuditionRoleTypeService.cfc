<cfcomponent displayname="AuditionRoleTypeService" hint="Handles operations for AuditionRoleType table" output="false"> 
<cffunction name="getAudRoleTypes" access="public" returntype="query">
    <cfargument name="audcatid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT audroletypeid AS id, audroletype AS name
            FROM audroletypes
            WHERE audcatid = <cfqueryparam value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="false" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoleTypes: #cfcatch.message# Query: SELECT audroletypeid AS id, audroletype AS name FROM audroletypes WHERE audcatid = #arguments.audcatid# AND isdeleted IS false">
            <cfset result = queryNew("id,name", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertAudRoleType" access="public" returntype="void">
    <cfargument name="new_audroletype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="yourDataSource">
            INSERT INTO audroletypes (audroletype, audCatid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audroletype#" maxlength="100" null="#NOT len(trim(arguments.new_audroletype))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audroletypes: #cfcatch.message#">
            <cfthrow message="Error inserting into audroletypes." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAudRoleType" access="public" returntype="void">
    <cfargument name="new_audroletype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audroletypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="yourDataSource">
            UPDATE audroletypes 
            SET 
                audroletype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audroletype)#" maxlength="100" null="#NOT len(trim(arguments.new_audroletype))#">,
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audroletypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audroletypeid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audroletypes: #cfcatch.message# Query: #cfcatch.Detail#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.Detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
