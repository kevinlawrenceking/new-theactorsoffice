<cfcomponent displayname="AuditionQuestionTypeService" hint="Handles operations for AuditionQuestionType table" output="false"> 
<cffunction name="insertAudqtypes" access="public" returntype="void">
    <cfargument name="new_qtype" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery name="insertQuery" datasource="yourDataSource">
            INSERT INTO audqtypes (qtype, isDeleted) 
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtype#" maxlength="100" null="#NOT len(trim(arguments.new_qtype))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            );
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudqtypes: #cfcatch.message# - #cfcatch.detail#">
            <cfthrow message="Database error" detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAudQTypes" access="public" returntype="void">
    <cfargument name="new_qtype" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_qtypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audqtypes 
            SET 
                qtype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtype#" maxlength="100" null="#NOT len(trim(arguments.new_qtype))#">, 
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#"> 
            WHERE 
                qtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qtypeid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audqtypes: #cfcatch.message# - Query: UPDATE audqtypes SET qtype = ?, isDeleted = ? WHERE qtypeid = ?">
            <cfthrow message="Error updating audqtypes." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
