<cfcomponent displayname="AuditionTonesService" hint="Handles operations for AuditionTones table" output="false"> 
<cffunction name="INSaudtones" access="public" returntype="void">
    <cfargument name="new_tone" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audtones (tone, audCatid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_tone#" maxlength="100" null="#NOT len(trim(arguments.new_tone))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudtones: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting into audtones." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudtones" access="public" returntype="void">
    <cfargument name="new_tone" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_toneid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="yourDatasourceName">
            UPDATE audtones 
            SET 
                tone = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_tone#" maxlength="100" null="#NOT len(trim(arguments.new_tone))#">,
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                toneid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_toneid#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audtones: #cfcatch.message#" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
