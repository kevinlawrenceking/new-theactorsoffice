<cfcomponent displayname="AuditionMediaTypeService"  > 
<cffunction output="false" name="SELaudmediatypes" access="public" returntype="query">
    <cfargument name="mediaTypeIds" type="array" required="true">
    
    
    
    <cfquery name="result">
        SELECT * 
        FROM audmediatypes 
        WHERE mediatypeid IN (
            <cfloop array="#arguments.mediaTypeIds#" index="mediaTypeId">
                <cfqueryparam value="#mediaTypeId#" cfsqltype="CF_SQL_INTEGER" />
                <cfif arrayLen(arguments.mediaTypeIds) GT 1 AND mediaTypeId NEq arrayLast(arguments.mediaTypeIds)>,</cfif>
            </cfloop>
        )
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction output="false" name="SELaudmediatypes_23753" access="public" returntype="query">
    <cfargument name="mediaTypeIds" type="array" required="true">
    
    
    
    <cfquery name="result">
        SELECT mediatypeid, mediatype
        FROM audmediatypes
        WHERE mediatypeid IN (
            <cfloop array="#arguments.mediaTypeIds#" index="id">
                <cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER" />
                <cfif id neq arrayLast(arguments.mediaTypeIds)>,</cfif>
            </cfloop>
        )
    </cfquery>

    <cfreturn result>
</cffunction>

<cfscript>
function getMediaTypes(required array mediaTypeIds) {
    var result = queryNew("mediatypeid, mediatype", "integer,varchar");
    if (arrayLen(arguments.mediaTypeIds) == 0) {
        return result;
    }
    
    var sql = "
        SELECT mediatypeid, mediatype 
        FROM audmediatypes 
        WHERE mediatypeid IN (#repeatString('?', arrayLen(arguments.mediaTypeIds), ',')#)
    ";
    
    var queryParams = [];
    for (var id in arguments.mediaTypeIds) {
        arrayAppend(queryParams, {value=id, cfsqltype="CF_SQL_INTEGER"});
    }

    result = queryExecute(
        sql,
        queryParams
    );
    
    return result;
}
</cfscript>

<cffunction output="false" name="SELaudmediatypes_24067" access="public" returntype="query">
    <cfargument name="src" type="string" required="false" default="">
    
    <cfset var queryResult = "">
    <cfset var sqlQuery = "SELECT mediatypeid, mediatype FROM audmediatypes WHERE mediatype <> ? AND isdeleted = ?">
    <cfset var params = [ { value="Headshot", cfsqltype="CF_SQL_VARCHAR" }, { value=0, cfsqltype="CF_SQL_BIT" } ]>
    
    <cfif arguments.src EQ "account">
        <cfset sqlQuery &= " AND ismymaterial = ?">
        <cfset arrayAppend(params, { value=1, cfsqltype="CF_SQL_BIT" })>
    </cfif>
    
    <cfset sqlQuery &= " ORDER BY mediatype">

    <cfquery result="result" name="queryResult">
        #sqlQuery#
        <cfloop array="#params#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>
    
    <cfreturn queryResult>
</cffunction>

<cffunction output="false" name="SELaudmediatypes_24198" access="public" returntype="query">
    <cfargument name="src" type="string" required="true">
    
    <cfset var queryResult = "">
    <cfset var sqlQuery = "">
    <cfset var params = []>
    
    <cfset sqlQuery = "
        SELECT 
            mediatypeid, 
            mediatype 
        FROM 
            audmediatypes 
        WHERE 
            mediatype <> ? 
            AND isdeleted = ?">

    <cfset arrayAppend(params, {value='Headshot', cfsqltype='CF_SQL_VARCHAR'})>
    <cfset arrayAppend(params, {value=0, cfsqltype='CF_SQL_BIT'})>

    <cfif arguments.src eq "account">
        <cfset sqlQuery &= " AND ismymaterial = ?">
        <cfset arrayAppend(params, {value=1, cfsqltype='CF_SQL_BIT'})>
    </cfif>

    <cfquery result="result" name="queryResult">
        #sqlQuery#
        <cfloop array="#params#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn queryResult>
</cffunction>

<cffunction output="false" name="INSaudmediatypes" access="public" returntype="void" >
    <cfargument name="new_mediaType" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result">
        INSERT INTO audmediatypes (mediaType, isDeleted)
        VALUES (
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaType#" maxlength="100" null="#NOT len(trim(arguments.new_mediaType))#">,
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        )
    </cfquery>
</cffunction>

<cffunction output="false" name="UPDaudmediatypes" access="public" returntype="void">
    <cfargument name="new_mediaType" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_mediaTypeID" type="numeric" required="true">

    <cfquery result="result">
        UPDATE audmediatypes 
        SET 
            mediaType = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaType#" maxlength="100" null="#NOT len(trim(arguments.new_mediaType))#">,
            isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        WHERE 
            mediaTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaTypeID#">
    </cfquery>
</cffunction></cfcomponent>