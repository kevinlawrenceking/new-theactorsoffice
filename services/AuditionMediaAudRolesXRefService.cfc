<cfcomponent displayname="AuditionMediaAudRolesXRefService" hint="Handles operations for AuditionMediaAudRolesXRef table" output="false"> 
<cffunction name="INSaudmedia_audroles_xref" access="public" returntype="void">
    <cfargument name="new_mediaid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">
    <cfargument name="new_mediaAudroleDescript" type="string" required="false" default="">
    <cfargument name="new_isDeleted" type="boolean" required="false" default=false>

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audmedia_audroles_xref (mediaid, audroleid, mediaAudroleDescript, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaid#" null="#NOT len(trim(arguments.new_mediaid))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audroleid#" null="#NOT len(trim(arguments.new_audroleid))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaAudroleDescript#" maxlength="500" null="#NOT len(trim(arguments.new_mediaAudroleDescript))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error inserting into audmedia_audroles_xref: #cfcatch.message#">
        <cfthrow message="Database error occurred." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudmedia_audroles_xref" access="public" returntype="void">
    <cfargument name="new_mediaid" required="true" type="numeric">
    <cfargument name="new_audroleid" required="true" type="numeric">
    <cfargument name="new_mediaAudroleDescript" required="true" type="string">
    <cfargument name="new_isDeleted" required="true" type="boolean">
    <cfargument name="conditionColumn" required="true" type="string">
    <cfargument name="conditionValue" required="true">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="#yourDataSource#">
            UPDATE audmedia_audroles_xref 
            SET 
                mediaid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaid#" null="#NOT len(trim(arguments.new_mediaid))#">,
                audroleid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audroleid#" null="#NOT len(trim(arguments.new_audroleid))#">,
                mediaAudroleDescript = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaAudroleDescript#" maxlength="500" null="#NOT len(trim(arguments.new_mediaAudroleDescript))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                #arguments.conditionColumn# = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.conditionValue#">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in updateAudmediaAudrolesXref: #cfcatch.message#" type="error">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
