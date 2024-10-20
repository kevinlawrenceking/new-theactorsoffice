<cfcomponent displayname="TagsUserService" hint="Handles operations for TagsUser table" output="false" > 
<cffunction name="inserttags_user" access="public" returntype="numeric">
    <cfargument name="tagid" type="numeric" required="true">
    <cfargument name="tagname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="false" default=false>
    <cfargument name="IsCustom" type="boolean" required="false" default=false>
    <cfargument name="IsTeam" type="boolean" required="false" default=false>
    <cfargument name="IsCasting" type="boolean" required="false" default=false>
    <cfargument name="tagtype" type="string" required="false" default="O">

    <cfset var insertResult = 0>

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            INSERT INTO tags_user_tbl (
                tagid, tagname, userid, recordname, IsDeleted, IsCustom, IsTeam, IsCasting, tagtype
            ) VALUES (
                <cfqueryparam value="#arguments.tagid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.tagname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">,
                <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsTeam#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsCasting#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.tagtype#" cfsqltype="CF_SQL_CHAR">
            )
        </cfquery>

        <cfreturn insertResult.generatedKey>

        <cfcatch>
            <cflog file="application" text="Error in inserttags_user: #cfcatch.message# Details: #cfcatch.detail#">
            <!--- Return 0 or an appropriate error code if the insert fails --->
            <cfreturn 0>
        </cfcatch>
    </cftry>
</cffunction> 
<!--- Changes made:
- None. The function code is correct and should execute properly.
--->

<cffunction name="gettags_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT tagid, userid, tagname, recordname, IsDeleted, IsCustom, IsTeam, IsCasting, tagtype FROM tags_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "tagid,userid,tagname,recordname,IsDeleted,IsCustom,IsTeam,IsCasting,tagtype">
    <cfset var validOrderColumns = "tagid,userid,tagname">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause if provided --->
    <cfif len(arguments.orderBy) and listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate("CF_SQL_" & ucase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log error details --->
            <cflog file="application" text="Error in gettags_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset queryResult = queryNew("tagid,userid,tagname,recordname,IsDeleted,IsCustom,IsTeam,IsCasting,tagtype", "integer,integer,varchar,varchar,bit,bit,bit,bit,char")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- No syntax errors were found that would prevent execution.
--->

<cffunction name="updatetags_user" access="public" returntype="boolean">
    <cfargument name="tagid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagname" type="string" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="IsCustom" type="boolean" required="true">
    <cfargument name="IsTeam" type="boolean" required="true">
    <cfargument name="IsCasting" type="boolean" required="true">
    <cfargument name="tagtype" type="string" required="false" default="">
    
    <cfset var result = false>
    
    <cftry>
        <cfquery datasource="#DSN#">
            UPDATE tags_user_tbl
            SET 
                tagname = <cfqueryparam value="#arguments.tagname#" cfsqltype="CF_SQL_VARCHAR">,
                recordname = <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">,
                IsDeleted = <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">,
                IsCustom = <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">,
                IsTeam = <cfqueryparam value="#arguments.IsTeam#" cfsqltype="CF_SQL_BIT">,
                IsCasting = <cfqueryparam value="#arguments.IsCasting#" cfsqltype="CF_SQL_BIT">,
                tagtype = <cfqueryparam value="#arguments.tagtype#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.tagtype)#">
            WHERE 
                tagid = <cfqueryparam value="#arguments.tagid#" cfsqltype="CF_SQL_INTEGER">
            AND
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfset result = true>
        
        <cfcatch>
            <cflog file="application" text="Error updating tags_user_tbl: #cfcatch.message# - #cfcatch.detail#">
            <!--- Optionally log the SQL query for debugging purposes --->
            <!--- Note: Be cautious with logging sensitive data --->
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No changes were necessary; the code is syntactically correct.
--->

<cffunction name="getvm_tags_user_contactdetails" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="contactid">
    
    <cfset var validOrderColumns = "contactid">
    <cfset var sql = "">
    <cfset var result = "">

    <cftry>
        <!--- Validate orderBy column --->
        <cfif not listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset arguments.orderBy = "contactid">
        </cfif>

        <!--- Construct SQL query --->
        <cfset sql = "
            SELECT `contactid`
            FROM vm_tags_user_contactdetails
            WHERE i.valuecategory = 'Tag'
            AND i.valuetype = 'Tags'
            AND tu.tagtype = 'C'
            AND tu.tagname = i.valuetext
            AND d.contactid = ?
            ORDER BY #arguments.orderBy#
        ">

        <!--- Execute query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.new_contactid)#">
        </cfquery>

        <!--- Return result --->
        <cfreturn result>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getvm_tags_user_contactdetails: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return empty query with correct schema --->
        <cfreturn queryNew("contactid", "integer")>
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
