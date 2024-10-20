<cfcomponent displayname="AuditionImportService" hint="Handles operations for AuditionImport table" output="false" > 
<cffunction name="insertauditionsimport" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO auditionsimport (
                projDate, projName, audRoleName, audCatName, audSubCatName, audsource,
                cdfirstname, cdlastname, callback_yn, redirect_yn, pin_yn, booked_yn,
                projDescription, charDescription, note, uploadid, audprojectID,
                status, audsubcatid
            ) VALUES (
                <cfqueryparam value="#arguments.data.projDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.projDate)#">,
                <cfqueryparam value="#arguments.data.projName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.projName)#">,
                <cfqueryparam value="#arguments.data.audRoleName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.audRoleName)#">,
                <cfqueryparam value="#arguments.data.audCatName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.audCatName)#">,
                <cfqueryparam value="#arguments.data.audSubCatName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.audSubCatName)#">,
                <cfqueryparam value="#arguments.data.audsource#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.audsource)#">,
                <cfqueryparam value="#arguments.data.cdfirstname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.cdfirstname)#">,
                <cfqueryparam value="#arguments.data.cdlastname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.cdlastname)#">,
                <cfqueryparam value="#arguments.data.callback_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.callback_yn)#">,
                <cfqueryparam value="#arguments.data.redirect_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.redirect_yn)#">,
                <cfqueryparam value="#arguments.data.pin_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.pin_yn)#">,
                <cfqueryparam value="#arguments.data.booked_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.booked_yn)#">,
                <cfqueryparam value="#arguments.data.projDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.projDescription)#">,
                <cfqueryparam value="#arguments.data.charDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.charDescription)#">,
                <cfqueryparam value="#arguments.data.note#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.note)#">,
                <cfqueryparam value="#arguments.data.uploadid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.uploadid)#">,
                <cfqueryparam value="#arguments.data.audprojectID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.audprojectID)#">,
                <cfqueryparam value="#arguments.data.status#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.status)#">,
                <cfqueryparam value="#arguments.data.audsubcatid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.audsubcatid)#">
            )
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error in insertauditionsimport: #cfcatch.message# Details: #cfcatch.detail#">
            <cflog file="application" text="SQL Query: INSERT INTO auditionsimport ...">
        </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Added missing `null` attribute for `uploadid` and `audsubcatid` query parameters.
--->

<cffunction name="getauditionsimport" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ID">
    <cfset var result = "">
    <cfset var sql = "SELECT ID, uploadid, audprojectID, audsubcatid, projName, audRoleName, audCatName, audSubCatName, audsource, cdfirstname, cdlastname, projDescription, charDescription, note, status, `timestamp`, projDate, callback_yn, redirect_yn, pin_yn, booked_yn FROM auditionsimport WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "ID, uploadid, audprojectID, audsubcatid, projName, audRoleName, audCatName, audSubCatName, audsource, cdfirstname, cdlastname, projDescription, charDescription, note, status, `timestamp`, projDate, callback_yn, redirect_yn, pin_yn, booked_yn">
    <cfset var validOrderByColumns = listToArray(validColumns)>

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Add WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    <cfelse>
        <!--- Return an empty query if no filters are provided --->
        <cfreturn queryNew(listToArray(validColumns))>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(getMetaData(arguments.filters[key]).type))#" null="#isNull(arguments.filters[key])#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getauditionsimport: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew(listToArray(validColumns))>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The provided code is syntactically correct.
--->

<cffunction name="updateauditionsimport" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE auditionsimport SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "projDate,projName,audRoleName,audCatName,audSubCatName,audsource,cdfirstname,cdlastname,callback_yn,redirect_yn,pin_yn,booked_yn,projDescription,charDescription,note,status,audprojectID,audsubcatid">
    <cfset var result = false>

    <cftry>
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(setClauses) gt 0>
            <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfif listFindNoCase(validColumns, key)>
                        <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                    </cfif>
                </cfloop>
                <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <cfset result = true>
        </cfif>

        <cfcatch type="any">
            <cflog file="application" text="Error in updateauditionsimport: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset result = false>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added a check for valid columns inside the second cfloop to ensure only valid columns are used in cfqueryparam.
--->

<cffunction name="getvm_auditionsimport_uploads" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var validColumns = "uploadid,userid,audprojectid,uploadstatus,status,timestamp,total_adds">
    <cfset var validOrderByColumns = "uploadid,userid,audprojectid,uploadstatus,status,timestamp,total_adds">
    <cfset var sql = "SELECT uploadid, userid, audprojectid, uploadstatus, status, timestamp, total_adds FROM vm_auditionsimport_uploads WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">
    
    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=determineSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if any conditions are present --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Handle ORDER BY clause --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_auditionsimport_uploads: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("uploadid,userid,audprojectid,uploadstatus,status,timestamp,total_adds", "integer,integer,integer,varchar,varchar,timestamp,bigint")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction></cfcomponent>
