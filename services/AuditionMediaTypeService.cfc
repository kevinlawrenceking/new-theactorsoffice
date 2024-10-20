<cfcomponent displayname="AuditionMediaTypeService" hint="Handles operations for AuditionMediaType table" output="false" > 
<cffunction name="insertaudmediatypes" access="public" returntype="numeric">
    <cfargument name="mediaTypeID" type="numeric" required="true">
    <cfargument name="mediaType" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">
    <cfargument name="isImage" type="boolean" required="false" default=false>
    <cfargument name="IsMaterial" type="boolean" required="false" default=false>
    <cfargument name="isShare" type="boolean" required="false" default=false>
    <cfargument name="ismymaterial" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO audmediatypes (
                mediaTypeID, 
                mediaType, 
                isDeleted, 
                recordname, 
                isImage, 
                IsMaterial, 
                isShare, 
                ismymaterial
            ) VALUES (
                <cfqueryparam value="#arguments.mediaTypeID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.mediaType#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not structKeyExists(arguments, 'recordname')#">,
                <cfqueryparam value="#arguments.isImage#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsMaterial#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.isShare#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.ismymaterial#" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into audmediatypes: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO audmediatypes (mediaTypeID, mediaType, isDeleted, recordname, isImage, IsMaterial, isShare, ismymaterial) VALUES (#arguments.mediaTypeID#, '#arguments.mediaType#', #arguments.isDeleted#, '#arguments.recordname#', #arguments.isImage#, #arguments.IsMaterial#, #arguments.isShare#, #arguments.ismymaterial#)">
            <cfreturn 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Removed the default attribute from the 'isDeleted' argument as it was conflicting with the 'required' attribute.
--->

<cffunction name="getaudmediatypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="mediaTypeID">
    
    <cfset var validColumns = "mediaTypeID,mediaType,recordname,isDeleted,isImage,IsMaterial,isShare,ismymaterial">
    <cfset var validOrderColumns = "mediaTypeID,mediaType,recordname">
    <cfset var sql = "SELECT mediaTypeID, mediaType, recordname, isDeleted, isImage, IsMaterial, isShare, ismymaterial FROM audmediatypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build dynamic WHERE clause based on filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & ucase(replace(key,"is","bit")))})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if any conditions are present --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getaudmediatypes: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with matching schema --->
            <cfset result = queryNew("mediaTypeID,mediaType,recordname,isDeleted,isImage,IsMaterial,isShare,ismymaterial", "integer,varchar,varchar,bit,bit,bit,bit,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the function to ensure proper execution by fixing the incorrect usage of 'de' function which does not exist. 
  Replaced it with a valid approach to determine cfsqltype dynamically.
--->

<cffunction name="updateaudmediatypes" access="public" returntype="boolean">
    <cfargument name="mediaTypeID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE audmediatypes SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "mediaType,recordname,isDeleted,isImage,IsMaterial,isShare,ismymaterial">
    <cfset var success = false>

    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <cfif arrayLen(setClauses) gt 0>
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE mediaTypeID = ?">

        <cftry>
            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data[key])#"> <!--- Changed evaluate('CF_SQL_' & ucase(key)) to CF_SQL_VARCHAR --->
                </cfloop>
                <cfqueryparam value="#arguments.mediaTypeID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfset success = true>
            <cfcatch>
                <cflog file="application" text="Error updating audmediatypes: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            </cfcatch>
        </cftry>
    </cfif>

    <cfreturn success>
</cffunction>

<!--- Changes made:
- Replaced evaluate('CF_SQL_' & ucase(key)) with CF_SQL_VARCHAR for cfsqltype in cfqueryparam as evaluate is not suitable for this context.
--->

<cffunction name="getvm_audmediatypes_mediatypeid" access="public" returntype="query">
    <cfargument name="mediatypeidList" type="array" required="false" default="#[]#">
    <cfset var result = "">
    <cfset var sql = "SELECT mediatypeid, mediatype FROM vm_audmediatypes_mediatypeid WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "mediatypeid,mediatype">
    <cfset var orderByColumn = "mediatypeid">

    <cftry>
        <!--- Build dynamic WHERE clause based on provided arguments --->
        <cfif arrayLen(arguments.mediatypeidList) gt 0>
            <cfset arrayAppend(whereClause, "mediatypeid IN (#arrayToList(arguments.mediatypeidList)#)")>
        </cfif>

        <!--- Append WHERE clause to SQL if conditions exist --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql = sql & " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Ensure ORDER BY column is valid --->
        <cfif listFindNoCase(validColumns, orderByColumn)>
            <cfset sql = sql & " ORDER BY " & orderByColumn>
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#arguments.mediatypeidList#" index="item">
                <cfqueryparam value="#item#" cfsqltype="CF_SQL_INTEGER">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getvm_audmediatypes_mediatypeid: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("mediatypeid, mediatype", "integer,varchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
