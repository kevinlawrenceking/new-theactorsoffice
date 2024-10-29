<cfcomponent displayname="AuditionEssenceXRefService" hint="Handles operations for AuditionEssenceXRef table" output="false"> 
<cffunction name="getAuditionEssences" access="public" returntype="query">
    <cfargument name="essencename" type="string" required="true">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM audessences_audtion_xref x
            INNER JOIN essences e ON e.essenceid = x.essenceid
            WHERE e.essencename = <cfqueryparam value="#arguments.essencename#" cfsqltype="CF_SQL_VARCHAR">
            AND x.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            AND e.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND e.isdeleted = 0
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch>
            <cflog file="application" text="Error in getAuditionEssences: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="deleteAudessencesAudtionXref" access="public" returntype="void">
    <cfargument name="new_audroleid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audessences_audtion_xref 
            WHERE audroleid = <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteAudessencesAudtionXref: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionXref" access="public" returntype="void">
    <cfargument name="new_essenceid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audessences_audtion_xref (essenceid, audroleid)
            VALUES (
                <cfqueryparam value="#arguments.new_essenceid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertAuditionXref: #cfcatch.message#">
            <cfthrow message="Database insertion error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
