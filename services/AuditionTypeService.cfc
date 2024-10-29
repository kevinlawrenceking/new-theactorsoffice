<cfcomponent displayname="AuditionTypeService" hint="Handles operations for AuditionType table" output="false"> 
<cffunction name="getAudTypes" access="public" returntype="query">
    <cfargument name="audcatid" type="string" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                audtypeid AS id, 
                audtype AS name, 
                audcategories 
            FROM 
                audtypes 
            WHERE 
                isdeleted = 0 
                AND audcategories LIKE <cfqueryparam value="%#arguments.audcatid#%" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY 
                audtype
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudTypes: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("id,name,audcategories", "integer,varchar,varchar")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="getDistinctAudtypes" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT DISTINCT audtype AS id, audtype AS name
            FROM audtypes
            WHERE audtype IN (
                SELECT t.audtype
                FROM events a
                INNER JOIN audtypes t ON t.audtypeid = a.audtypeid
                WHERE a.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
                AND a.isdeleted IS FALSE
            )
            ORDER BY audtype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDistinctAudtypes: #cfcatch.message#">
            <cfreturn queryNew("id,name", "varchar,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getAudTypes" access="public" returntype="query">
    <cfargument name="new_audcatid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                audtypeid AS id, 
                audtype AS name, 
                audcatid 
            FROM 
                audtypes 
            WHERE 
                isdeleted = 0 
                AND audcatid = <cfqueryparam value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                audtype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudTypes: #cfcatch.message#" />
            <cfset result = queryNew("id,name,audcatid", "integer,varchar,integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cfscript>
function getAudtypes(new_audcatid) {
    var queryResult = "";
    var sql = "SELECT audtypeid AS id, audtype AS name, audcategories FROM audtypes WHERE isdeleted = 0";
    var params = [];
    
    if (len(trim(new_audcatid))) {
        sql &= " AND audcategories LIKE ?";
        arrayAppend(params, {value="%#new_audcatid#%", cfsqltype="CF_SQL_VARCHAR"});
    }

    try {
        queryResult = queryExecute(
            sql,
            params,
            {datasource="abod"}
        );
    } catch (any e) {
        cflog(text="Error executing query in getAudtypes: " & e.message, file="application");
        return [];
    }
    
    return queryResult;
}
</cfscript>

<cffunction name="getDynamicQuery" access="public" returntype="query">
    <cfargument name="audstepIds" type="array" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                audstepid, 
                4 AS new_reportid, 
                audtypeid AS NEW_audtypeid, 
                audtype, 
                audtype AS new_label, 
                audstep AS new_itemDataset
            FROM 
                audtypes, audsteps
            WHERE 
                audstepid IN (
                    <cfloop index="i" from="1" to="#arrayLen(arguments.audstepIds)#">
                        <cfqueryparam value="#arguments.audstepIds[i]#" cfsqltype="CF_SQL_INTEGER">
                        <cfif i LT arrayLen(arguments.audstepIds)>,</cfif>
                    </cfloop>
                )
            ORDER BY 
                audtypes.audtype, audsteps.audstep
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in getDynamicQuery: #cfcatch.message#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getTotalAudRoles" access="public" returntype="query">
    <cfargument name="audstepid" type="numeric" required="true">
    <cfargument name="new_audtypeid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT count(r.audroleid) as totals
            FROM audtypes t
            LEFT JOIN events a ON a.audtypeid = t.audtypeid
            LEFT JOIN audroles r ON a.audroleid = r.audroleid
            LEFT JOIN audprojects p ON p.audprojectid = r.audprojectid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            WHERE a.isDeleted = 0 
            AND p.isdeleted = 0 
            AND a.audstepid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.audstepid#" />
            AND t.audtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audtypeid#" />
            AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#" />
            AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#" />
            AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#" />
        </cfquery>
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getTotalAudRoles: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving the total aud roles." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getAudtypeById" access="public" returntype="query">
    <cfargument name="new_audtypeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT audtype 
            FROM audtypes 
            WHERE audtypeid = <cfqueryparam value="#arguments.new_audtypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudtypeById: #cfcatch.message# Query: SELECT audtype FROM audtypes WHERE audtypeid = ? Parameters: #arguments.new_audtypeid#">
            <cfthrow message="Database query failed" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertAudType" access="public" returntype="void">
    <cfargument name="new_audtype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audtypes (audtype, audCatid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audtype#" maxlength="100" null="#NOT len(trim(arguments.new_audtype))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudType: #cfcatch.message# - Query: INSERT INTO audtypes (audtype, audCatid, isDeleted) VALUES (#arguments.new_audtype#, #arguments.new_audCatid#, #arguments.new_isDeleted#)">
            <cfthrow message="An error occurred while inserting the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getAudTypes" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                audtypeid AS id, 
                audtype AS name, 
                audcategories 
            FROM 
                audtypes 
            WHERE 
                isdeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY 
                audtype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudTypes: #cfcatch.message#; Query: SELECT audtypeid AS id, audtype AS name, audcategories FROM audtypes WHERE isdeleted = ? ORDER BY audtype; Parameters: isDeleted=#arguments.isDeleted#">
            <cfset result = queryNew("id,name,audcategories")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateAudtypes" access="public" returntype="void">
    <cfargument name="new_audtype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audtypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audtypes 
            SET 
                audtype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audtype)#" maxlength="100" null="#NOT len(trim(arguments.new_audtype))#">,
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audtypeid#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audtypes: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
