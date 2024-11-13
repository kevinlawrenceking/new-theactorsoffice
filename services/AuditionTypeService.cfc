<cfcomponent displayname="AuditionTypeService" hint="Handles operations for AuditionType table" output="false"> 
<cffunction name="SELaudtypes" access="public" returntype="query">
    <cfargument name="audcatid" type="string" required="true">
    <cfset var result = "">
        <cfquery name="result">
            SELECT 
                audtypeid AS id, 
                audtype AS name, 
                audcategories 
            FROM 
                audtypes 
            WHERE 
                isdeleted = 0 
                AND audcategories LIKE <cfquery result="result" param value="%#arguments.audcatid#%" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY 
                audtype
        </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELaudtypes_23793" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
        <cfquery name="result">
            SELECT DISTINCT audtype AS id, audtype AS name
            FROM audtypes
            WHERE audtype IN (
                SELECT t.audtype
                FROM events a
                INNER JOIN audtypes t ON t.audtypeid = a.audtypeid
                WHERE a.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
                AND a.isdeleted IS FALSE
            )
            ORDER BY audtype
        </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELaudtypes_24082" access="public" returntype="query">
    <cfargument name="new_audcatid" type="numeric" required="true">
    <cfset var result = "">
        <cfquery name="result">
            SELECT 
                audtypeid AS id, 
                audtype AS name, 
                audcatid 
            FROM 
                audtypes 
            WHERE 
                isdeleted = 0 
                AND audcatid = <cfquery result="result" param value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                audtype
        </cfquery>
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

    queryResult = queryExecute(
        sql,
        params
    );
    
    return queryResult;
}
</cfscript>

<cffunction name="SELaudtypes_24231" access="public" returntype="query">
    <cfargument name="audstepIds" type="array" required="true">
    <cfset var result = "">
        <cfquery name="result">
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
                        <cfquery result="result" param value="#arguments.audstepIds[i]#" cfsqltype="CF_SQL_INTEGER">
                        <cfif i LT arrayLen(arguments.audstepIds)>,</cfif>
                    </cfloop>
                )
            ORDER BY 
                audtypes.audtype, audsteps.audstep
        </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELaudtypes_24234" access="public" returntype="query">
    <cfargument name="audstepid" type="numeric" required="true">
    <cfargument name="new_audtypeid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
        <cfquery name="result">
            SELECT count(r.audroleid) as totals
            FROM audtypes t
            LEFT JOIN events a ON a.audtypeid = t.audtypeid
            LEFT JOIN audroles r ON a.audroleid = r.audroleid
            LEFT JOIN audprojects p ON p.audprojectid = r.audprojectid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            WHERE a.isDeleted = 0 
            AND p.isdeleted = 0 
            AND a.audstepid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.audstepid#" />
            AND t.audtypeid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audtypeid#" />
            AND p.projdate >= <cfquery result="result" param cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#" />
            AND p.projdate <= <cfquery result="result" param cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#" />
            AND p.userid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#" />
        </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELaudtypes_24526" access="public" returntype="query">
    <cfargument name="new_audtypeid" type="numeric" required="true">
    <cfset var result = "">
        <cfquery name="result">
            SELECT audtype 
            FROM audtypes 
            WHERE audtypeid = <cfquery result="result" param value="#arguments.new_audtypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="INSaudtypes" access="public" returntype="void">
    <cfargument name="new_audtype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

        <cfquery result="result"  datasource="abod">
            INSERT INTO audtypes (audtype, audCatid, isDeleted)
            VALUES (
                <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audtype#" maxlength="100" null="#NOT len(trim(arguments.new_audtype))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>

</cffunction>
<cffunction name="SELaudtypes_24608" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">
    
    <cfset var result = "">
    
        <cfquery name="result" datasource="abod">
            SELECT 
                audtypeid AS id, 
                audtype AS name, 
                audcategories 
            FROM 
                audtypes 
            WHERE 
                isdeleted = <cfquery result="result" param value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY 
                audtype
        </cfquery>
        
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDaudtypes" access="public" returntype="void">
    <cfargument name="new_audtype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audtypeid" type="numeric" required="true">

        <cfquery result="result"  datasource="abod">
            UPDATE audtypes 
            SET 
                audtype = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audtype)#" maxlength="100" null="#NOT len(trim(arguments.new_audtype))#">,
                audCatid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audtypeid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audtypeid#">
        </cfquery>
        

</cffunction>
</cfcomponent>
