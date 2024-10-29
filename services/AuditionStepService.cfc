<cfcomponent displayname="AuditionStepService" hint="Handles operations for AuditionStep table" output="false"> 
<cffunction name="getAudSteps" access="public" returntype="query">
    <cfargument name="stepinfo1" type="string" required="false">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM audsteps
            WHERE stepinfo1 IS NOT NULL
            <cfif structKeyExists(arguments, "stepinfo1") and len(arguments.stepinfo1)>
                AND stepinfo1 = <cfqueryparam value="#arguments.stepinfo1#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudSteps: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="getAudStepById" access="public" returntype="query">
    <cfargument name="new_audstepid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT audstep
            FROM audsteps
            WHERE audstepid = <cfqueryparam value="#arguments.new_audstepid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudStepById: #cfcatch.message#">
            <cfset result = queryNew("audstep")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getAudStepsByUserId" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "" />

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT audstepid AS id, audstep AS name
            FROM audsteps
            WHERE audstepid IN (
                SELECT audstepid
                FROM events
                WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" />
                AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT" />
            )
            ORDER BY audstep
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudStepsByUserId: #cfcatch.message# Query: #cfcatch.detail#" />
            <cfthrow message="An error occurred while retrieving the steps." detail="#cfcatch.detail#" />
        </cfcatch>
    </cftry>

    <cfreturn result />
</cffunction>
<cffunction name="getAudSteps" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                audstepid AS id, 
                audstep AS NAME 
            FROM 
                audsteps 
            WHERE 
                isdeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT"> 
            ORDER BY 
                audstep
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudSteps: #cfcatch.message#">
            <cfreturn queryNew("id,NAME")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertAudStep" access="public" returntype="void">
    <cfargument name="new_audstep" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audsteps (audstep, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audstep#" maxlength="100" null="#NOT len(trim(arguments.new_audstep))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudStep: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting audstep.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAudStep" access="public" returntype="void">
    <cfargument name="new_audstep" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audstepid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audsteps 
            SET 
                audstep = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audstep#" maxlength="100" null="#NOT len(trim(arguments.new_audstep))#">, 
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#"> 
            WHERE 
                audstepid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audstepid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audsteps: #cfcatch.message#">
            <cfthrow message="Error updating audsteps." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
