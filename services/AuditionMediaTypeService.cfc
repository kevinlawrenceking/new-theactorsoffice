<cfcomponent displayname="AuditionMediaTypeService" hint="Handles operations for AuditionMediaType table" output="false"> 
<cffunction name="SELaudmediatypes" access="public" returntype="query">
    <cfargument name="mediaTypeIds" type="array" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audmediatypes 
            WHERE mediatypeid IN (
                <cfloop array="#arguments.mediaTypeIds#" index="mediaTypeId">
                    <cfqueryparam value="#mediaTypeId#" cfsqltype="CF_SQL_INTEGER" />
                    <cfif arrayLen(arguments.mediaTypeIds) GT 1 AND mediaTypeId NE arrayLast(arguments.mediaTypeIds)>,</cfif>
                </cfloop>
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaTypes: #cfcatch.message# - Query: SELECT * FROM audmediatypes WHERE mediatypeid IN (#arguments.mediaTypeIds#)">
            <cfthrow message="An error occurred while fetching media types." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudmediatypes_23753" access="public" returntype="query">
    <cfargument name="mediaTypeIds" type="array" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT mediatypeid, mediatype
            FROM audmediatypes
            WHERE mediatypeid IN (
                <cfloop array="#arguments.mediaTypeIds#" index="id">
                    <cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER" />
                    <cfif id neq arrayLast(arguments.mediaTypeIds)>,</cfif>
                </cfloop>
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaTypes: #cfcatch.message# - Query: SELECT mediatypeid, mediatype FROM audmediatypes WHERE mediatypeid IN (#arguments.mediaTypeIds#)">
            <cfset result = queryNew("mediatypeid,mediatype", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cfscript>
function getMediaTypes(required array mediaTypeIds) {
    var result = queryNew("mediatypeid, mediatype", "integer,varchar");
    if (arrayLen(arguments.mediaTypeIds) == 0) {
        return result;
    }
    
    try {
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
    } catch (any e) {
        cflog(type="error", text="Error executing getMediaTypes: #e.message#");
    }
    
    return result;
}
</cfscript>

<cffunction name="SELaudmediatypes_24067" access="public" returntype="query">
    <cfargument name="src" type="string" required="false" default="">
    
    <cfset var queryResult = "">
    <cfset var sqlQuery = "SELECT mediatypeid, mediatype FROM audmediatypes WHERE mediatype <> ? AND isdeleted = ?">
    <cfset var params = [ { value="Headshot", cfsqltype="CF_SQL_VARCHAR" }, { value=0, cfsqltype="CF_SQL_BIT" } ]>
    
    <cfif arguments.src EQ "account">
        <cfset sqlQuery &= " AND ismymaterial = ?">
        <cfset arrayAppend(params, { value=1, cfsqltype="CF_SQL_BIT" })>
    </cfif>
    
    <cfset sqlQuery &= " ORDER BY mediatype">

    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sqlQuery#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
        <cfreturn queryResult>

        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getMediaTypes: #cfcatch.message# - Query: #sqlQuery# - Params: #serializeJSON(params)#">
            <cfreturn queryNew("mediatypeid,mediatype", "integer,varchar")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmediatypes_24198" access="public" returntype="query">
    <cfargument name="src" type="string" required="true">
    
    <cfset var queryResult = "">
    <cfset var sqlQuery = "">
    <cfset var params = []>
    
    <cftry>
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

        <cfquery name="queryResult" datasource="abod">
            #sqlQuery#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <cfreturn queryResult>

    <cfcatch type="any">
        <cflog file="errorLog" text="Error in getMediaTypes: #cfcatch.message# - Query: #sqlQuery# - Parameters: #params#">
        <cfreturn queryNew("mediatypeid,mediatype", "integer,varchar")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudmediatypes" access="public" returntype="void" output="false">
    <cfargument name="new_mediaType" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audmediatypes (mediaType, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaType#" maxlength="100" null="#NOT len(trim(arguments.new_mediaType))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertMediaType: #cfcatch.message#" />
            <cflog file="application" text="Query: INSERT INTO audmediatypes (mediaType, isDeleted) VALUES (?, ?)" />
            <cflog file="application" text="Parameters: #serializeJSON(arguments)#" />
            <cfthrow message="Error inserting media type." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudmediatypes" access="public" returntype="void">
    <cfargument name="new_mediaType" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_mediaTypeID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audmediatypes 
            SET 
                mediaType = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaType#" maxlength="100" null="#NOT len(trim(arguments.new_mediaType))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                mediaTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaTypeID#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating media type: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the media type." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
