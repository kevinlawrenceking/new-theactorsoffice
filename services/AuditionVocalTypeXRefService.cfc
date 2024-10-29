<cfcomponent displayname="AuditionVocalTypeXRefService" hint="Handles operations for AuditionVocalTypeXRef table" output="false"> 
<cffunction name="getAuditionVocalTypes" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audvocaltypes_audition_xref 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND vocaltypeid = <cfqueryparam value="#arguments.new_vocaltypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionVocalTypes: #cfcatch.message# Query: SELECT * FROM audvocaltypes_audition_xref WHERE audroleid = ? AND vocaltypeid = ? Parameters: #arguments.audroleid#, #arguments.new_vocaltypeid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="deleteAudVocalTypesAuditionXref" access="public" returntype="void">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audvocaltypes_audition_xref
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteAudVocalTypesAuditionXref: #cfcatch.message# Query: DELETE FROM audvocaltypes_audition_xref WHERE audroleid = #arguments.audroleid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAudVocalTypesAuditionXref" access="public" returntype="void">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audvocaltypes_audition_xref (vocaltypeid, audroleid)
            VALUES (
                <cfqueryparam value="#arguments.new_vocaltypeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudVocalTypesAuditionXref: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionVocalType" access="public" returntype="void">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audvocaltypes_audition_xref (audRoleID, vocaltypeid)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_vocaltypeid#" null="#NOT len(trim(arguments.new_vocaltypeid))#">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionVocalType: #cfcatch.message# Query: INSERT INTO audvocaltypes_audition_xref (audRoleID, vocaltypeid) VALUES (#arguments.new_audRoleID#, #arguments.new_vocaltypeid#)" type="error">
            <cfthrow message="Database error occurred while inserting audition vocal type." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAudVocalTypesAuditionXref" access="public" returntype="void" output="false">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">
    <cfargument name="new_id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audvocaltypes_audition_xref
            SET 
                audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                vocaltypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_vocaltypeid#" null="#NOT len(trim(arguments.new_vocaltypeid))#">
            WHERE 
                id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_id#" null="#NOT len(trim(arguments.new_id))#">
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error updating audvocaltypes_audition_xref: #cfcatch.message#">
        <cfthrow message="Database update failed." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
