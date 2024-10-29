<cfcomponent displayname="AuditionAgeRangeService" hint="Handles operations for AuditionAgeRange table" output="false"> 
<cffunction name="getAgeRanges" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT rangeid, rangename 
            FROM audageranges 
            WHERE isdeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY rangeid
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAgeRanges: #cfcatch.message# Query: SELECT rangeid, rangename FROM audageranges WHERE isdeleted = ? ORDER BY rangeid Parameters: #arguments.isDeleted#">
            <cfthrow>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertAgeRange" access="public" returntype="void">
    <cfargument name="new_rangename" type="string" required="true">
    <cfargument name="new_age_min" type="numeric" required="true">
    <cfargument name="new_age_max" type="numeric" required="true">
    <cfargument name="new_age_group" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audageranges (rangename, age_min, age_max, age_group, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_rangename)#" maxlength="100" null="#NOT len(trim(arguments.new_rangename))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_age_min#" null="#NOT len(trim(arguments.new_age_min))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_age_max#" null="#NOT len(trim(arguments.new_age_max))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_age_group)#" maxlength="45" null="#NOT len(trim(arguments.new_age_group))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAgeRange: #cfcatch.message# - Query: INSERT INTO audageranges (rangename, age_min, age_max, age_group, isDeleted) VALUES (...)" type="error">
            <cfthrow message="Failed to insert age range." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAgeRanges" access="public" returntype="void">
    <cfargument name="new_rangename" type="string" required="true">
    <cfargument name="new_age_min" type="numeric" required="true">
    <cfargument name="new_age_max" type="numeric" required="true">
    <cfargument name="new_age_group" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_rangeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audageranges 
            SET 
                rangename = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_rangename#" maxlength="100" null="#NOT len(trim(arguments.new_rangename))#">,
                age_min = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_age_min#" null="#NOT len(trim(arguments.new_age_min))#">,
                age_max = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_age_max#" null="#NOT len(trim(arguments.new_age_max))#">,
                age_group = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_age_group#" maxlength="45" null="#NOT len(trim(arguments.new_age_group))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_rangeid#">
        </cfquery>
        <cfcatch>
            <cflog text="Error updating audageranges: #cfcatch.message#" type="error">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getAgeRangesByRole" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT g.rangename, g.rangeid 
            FROM audageranges g 
            INNER JOIN audageranges_audtion_xref x ON x.rangeid = g.rangeid 
            WHERE x.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="cf_sql_integer"> 
            ORDER BY g.rangeid
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAgeRangesByRole: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving age ranges." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
