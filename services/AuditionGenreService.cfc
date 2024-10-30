<cfcomponent displayname="AuditionGenreService" hint="Handles operations for AuditionGenre table" output="false"> 
<cffunction name="INSaudgenres" access="public" returntype="void">
    <cfargument name="new_audgenre" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audgenres (audgenre, audCatid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audgenre)#" maxlength="100" null="#NOT len(trim(arguments.new_audgenre))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudGenre: #cfcatch.message#" />
            <cflog file="application" text="Query: INSERT INTO audgenres (audgenre, audCatid, isDeleted) VALUES (#arguments.new_audgenre#, #arguments.new_audCatid#, #arguments.new_isDeleted#)" />
            <cflog file="application" text="Error Detail: #cfcatch.detail#" />
            <cflog file="application" text="Stack Trace: #cfcatch.stackTrace#" />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudgenres" access="public" returntype="void">
    <cfargument name="new_audgenre" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audgenreid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audgenres 
            SET 
                audgenre = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audgenre)#" maxlength="100" null="#NOT len(trim(arguments.new_audgenre))#" />, 
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#" />, 
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#" /> 
            WHERE 
                audgenreid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audgenreid#" />
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error updating audgenres: #cfcatch.message# Query: #cfcatch.detail#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
