<cfcomponent displayname="PageFieldService" hint="Handles operations for PageField table" output="false" > 
<cffunction name="getpgfields" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">

    <cfset var validColumns = "fieldid,pgid,displayOrder,det_cols,fkey,OrderBy,num_min,num_max,fname,ftype,ftypefull,updatename,updatetype,recordname,tableSelect,OrderByClause,IsDeleted,update_yn,results_yn,details_yn,required_yn,add_yn,delete_yn,updatemodal_yn">
    <cfset var validOrderDirections = "ASC,DESC">
    <cfset var sql = "SELECT fieldid, pgid, displayOrder, det_cols, fkey, OrderBy, num_min, num_max, fname, ftype, ftypefull, updatename, updatetype, recordname, tableSelect, OrderByClause, IsDeleted, update_yn, results_yn, details_yn, required_yn, add_yn, delete_yn, updatemodal_yn FROM pgfields_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams,
                {value=arguments.filters[key], cfsqltype=getSQLType(key), null=isNull(arguments.filters[key])}
            )>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validColumns, arguments.orderBy) and listFindNoCase(validOrderDirections, arguments.orderDirection)>
        <cfset sql &= " ORDER BY #arguments.orderBy# #arguments.orderDirection#">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getpgfields: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("fieldid,int|pgid,int|displayOrder,int|det_cols,int|fkey,int|OrderBy,int|num_min,int|num_max,int|fname,varchar|ftype,varchar|ftypefull,varchar|updatename,varchar|updatetype,varchar|recordname,varchar|tableSelect,varchar|OrderByClause,varchar|IsDeleted,int|update_yn,char|results_yn,char|details_yn,char|required_yn,char|add_yn,char|delete_yn,char|updatemodal_yn,char")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
