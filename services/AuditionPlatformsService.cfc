<cfcomponent displayname="AuditionPlatformsService" hint="Handles operations for AuditionPlatforms table" output="false"> 
<cffunction name="insertAudPlatform" access="public" returntype="void">
    <cfargument name="new_audplatform" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="yourDataSource">
            INSERT INTO audplatforms (audplatform, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audplatform)#" maxlength="100" null="#NOT len(trim(arguments.new_audplatform))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudPlatform: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting audplatform." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAudplatform" access="public" returntype="void">
    <cfargument name="new_audplatform" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audplatformid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audplatforms 
            SET 
                audplatform = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audplatform#" maxlength="100" null="#NOT len(trim(arguments.new_audplatform))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audplatformid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audplatforms: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfthrow message="Database update failed." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
