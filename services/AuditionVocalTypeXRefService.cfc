<cfcomponent displayname="AuditionVocalTypeXRefService" hint="Handles operations for AuditionVocalTypeXRef table" output="false" > 
<cffunction name="deleteaudvocaltypes_audition_xref" access="public" returntype="boolean">
    <cfargument name="audRoleID" type="numeric" required="true">
    <cfargument name="vocaltypeid" type="numeric" required="true">
    
    <cfset var result = false>
    
    <cftry>
        <cfquery datasource="#DSN#">
            DELETE FROM audvocaltypes_audition_xref
            WHERE audRoleID = <cfqueryparam value="#arguments.audRoleID#" cfsqltype="CF_SQL_INTEGER">
            AND vocaltypeid = <cfqueryparam value="#arguments.vocaltypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfset result = true>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteaudvocaltypes_audition_xref: #cfcatch.message# - #cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->
<cffunction name="insertaudvocaltypes_audition_xref" access="public" returntype="numeric">
    <cfargument name="audRoleID" type="numeric" required="true">
    <cfargument name="vocaltypeid" type="numeric" required="true">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            INSERT INTO audvocaltypes_audition_xref (audRoleID, vocaltypeid)
            VALUES (
                <cfqueryparam value="#arguments.audRoleID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.vocaltypeid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfreturn insertResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audvocaltypes_audition_xref: #cfcatch.message# Details: #cfcatch.detail#">
            <cfreturn 0>
        </cfcatch>
    </cftry>
</cffunction> 


<!--- Changes made:
- No syntax errors were found in the provided code.
--->

<cffunction name="getaudvocaltypes_audition_xref" access="public" returntype="query">
    <cfargument name="audRoleID" type="numeric" required="false">
    <cfargument name="vocaltypeid" type="numeric" required="false">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var local = {} />
    <cfset local.sql = "SELECT audRoleID, vocaltypeid FROM audvocaltypes_audition_xref WHERE 1=1" />
    <cfset local.whereClause = [] />
    <cfset local.queryParams = [] />
    <cfset local.validOrderByColumns = "audRoleID,vocaltypeid" />
    
    <!--- Build WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "audRoleID") and not isNull(arguments.audRoleID)>
        <cfset arrayAppend(local.whereClause, "audRoleID = ?")>
        <cfset arrayAppend(local.queryParams, {value=arguments.audRoleID, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>
    
    <cfif structKeyExists(arguments, "vocaltypeid") and not isNull(arguments.vocaltypeid)>
        <cfset arrayAppend(local.whereClause, "vocaltypeid = ?")>
        <cfset arrayAppend(local.queryParams, {value=arguments.vocaltypeid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>
    
    <!--- Append WHERE clauses to SQL --->
    <cfif arrayLen(local.whereClause) gt 0>
        <cfset local.sql &= " AND " & arrayToList(local.whereClause, " AND ") />
    </cfif>

    <!--- Handle ORDER BY clause --->
    <cfif len(trim(arguments.orderBy)) gt 0 and listFindNoCase(local.validOrderByColumns, arguments.orderBy)>
        <cfset local.sql &= " ORDER BY " & arguments.orderBy />
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="local.result" datasource="yourDataSource">
            #local.sql#
            <cfloop array="#local.queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
        <cfreturn local.result>
        
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getaudvocaltypes_audition_xref: #cfcatch.message# Details: #cfcatch.detail# SQL: #local.sql#">
            
            <!--- Return an empty query with correct schema --->
            <cfreturn queryNew("audRoleID,vocaltypeid", "integer,integer")>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- Corrected missing closing tag for cfargument.
--->

<cffunction name="updateaudvocaltypes_audition_xref" access="public" returntype="boolean">
    <cfargument name="audRoleID" type="numeric" required="true">
    <cfargument name="vocaltypeid" type="numeric" required="true">
    
    <cfset var result = false>
    <cfset var sql = "">
    
    <cftry>
        <!--- Construct the SQL UPDATE statement --->
        <cfset sql = "
            UPDATE audvocaltypes_audition_xref
            SET vocaltypeid = ?
            WHERE audRoleID = ?
        ">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.vocaltypeid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audRoleID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no error occurs, set result to true --->
        <cfset result = true>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" type="error" text="Error in updateaudvocaltypes_audition_xref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        
        <!--- Optionally, create an empty query to maintain structure consistency --->
        <!--- queryNew("audRoleID,vocaltypeid", "integer,integer") --->
    </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected missing closing tag for cfcatch.
--->
</cfcomponent>
