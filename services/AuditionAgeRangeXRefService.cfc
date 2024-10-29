<cfcomponent displayname="AuditionAgeRangeXRefService" hint="Handles operations for AuditionAgeRangeXRef table" output="false"> 
<cffunction name="getAuditionRanges" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="new_rangeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM audageranges_audtion_xref 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND rangeid = <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionRanges: #cfcatch.message# - Query: SELECT * FROM audageranges_audtion_xref WHERE audroleid = ? AND rangeid = ? - Parameters: #arguments.audroleid#, #arguments.new_rangeid#">
            <cfthrow message="An error occurred while retrieving audition ranges." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="deleteAudageRangesAudtionXref" access="public" returntype="void">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audageranges_audtion_xref
            WHERE audroleid = <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteAudageRangesAudtionXref: #cfcatch.message#">
            <cfthrow message="An error occurred while deleting records." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAudageRangesAudtionXref" access="public" returntype="void">
    <cfargument name="new_rangeid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audageranges_audtion_xref (rangeid, audroleid)
            VALUES (
                <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudageRangesAudtionXref: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionRangeXref" access="public" returntype="void">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_rangeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audageranges_audtion_xref (audRoleID, rangeid)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_rangeid#" null="#NOT len(trim(arguments.new_rangeid))#">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionRangeXref: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting audition range xref." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAuditionRange" access="public" returntype="void">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_rangeid" type="numeric" required="true">
    <cfargument name="new_id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audageranges_audtion_xref 
            SET 
                audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_rangeid#" null="#NOT len(trim(arguments.new_rangeid))#">
            WHERE 
                id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_id#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in updateAuditionRange: #cfcatch.message# - Query: UPDATE audageranges_audtion_xref SET audRoleID, rangeid WHERE id. Parameters: new_audRoleID=#arguments.new_audRoleID#, new_rangeid=#arguments.new_rangeid#, new_id=#arguments.new_id#">
            <cfthrow message="An error occurred while updating the audition range." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
