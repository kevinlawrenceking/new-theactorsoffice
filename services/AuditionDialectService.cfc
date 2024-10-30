<cfcomponent displayname="AuditionDialectService" hint="Handles operations for AuditionDialect table" output="false"> 
<cffunction name="INSauddialects" access="public" returntype="void">
    <cfargument name="new_auddialect" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auddialects (auddialect, audCatid, isDeleted) 
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_auddialect#" maxlength="100" null="#NOT len(trim(arguments.new_auddialect))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="databaseErrors" text="Error inserting into auddialects: #cfcatch.message#; SQL: INSERT INTO auddialects (auddialect, audCatid, isDeleted) VALUES (#arguments.new_auddialect#, #arguments.new_audCatid#, #arguments.new_isDeleted#)">
            <cfthrow message="Database error occurred while inserting record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDauddialects" access="public" returntype="void">
    <cfargument name="new_auddialect" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_auddialectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE auddialects 
            SET 
                auddialect = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_auddialect)#" maxlength="100" null="#NOT len(trim(arguments.new_auddialect))#" />, 
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#" />, 
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#" /> 
            WHERE 
                auddialectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_auddialectid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating auddialects: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
