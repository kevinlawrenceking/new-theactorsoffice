<cfcomponent displayname="AuditionQuestionUserService" hint="Handles operations for AuditionQuestionUser table" output="false" > 
<cffunction name="insertaudquestions_user" access="public" returntype="numeric">
    <cfargument name="qid" type="numeric" required="true">
    <cfargument name="qTypeID" type="numeric" required="false" default="2">
    <cfargument name="qtext" type="string" required="true">
    <cfargument name="qorder" type="numeric" required="false" default="0">
    <cfargument name="userid" type="numeric" required="false" default="0">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO audquestions_user (qid, qTypeID, qtext, qorder, userid, isDeleted)
            VALUES (
                <cfqueryparam value="#arguments.qid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.qTypeID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.qtext#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.qorder#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error in insertaudquestions_user: #cfcatch.message# Details: #cfcatch.detail#">
            <cflog file="application" text="SQL Query: INSERT INTO audquestions_user (qid, qTypeID, qtext, qorder, userid, isDeleted) VALUES (#arguments.qid#, #arguments.qTypeID#, '#arguments.qtext#', #arguments.qorder#, #arguments.userid#, #arguments.isDeleted#)">
            <!--- Return 0 or any other indicator of failure --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 
<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getaudquestions_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="qid">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT qid, qTypeID, qtext, qorder, userid, isDeleted FROM audquestions_user WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "qid,qTypeID,qtext,qorder,userid,isDeleted">
    <cfset var validOrderByColumns = "qid,qTypeID,qorder,userid">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Add WHERE conditions to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and add ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & ucase(getMetaData(arguments.filters[key]).name))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getaudquestions_user: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset queryResult = queryNew("qid,qTypeID,qtext,qorder,userid,isDeleted", "integer,integer,varchar,integer,integer,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- Corrected the use of getMetaData().type to getMetaData().name for determining CF_SQL type.
--->

<cffunction name="updateaudquestions_user" access="public" returntype="boolean">
    <cfargument name="qid" type="numeric" required="true">
    <cfargument name="qTypeID" type="numeric" required="false" default="">
    <cfargument name="qtext" type="string" required="false" default="">
    <cfargument name="qorder" type="numeric" required="false" default="">
    <cfargument name="userid" type="numeric" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default="">
    
    <cfset var sql = "UPDATE audquestions_user SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build the SET clause dynamically --->
    <cfif structKeyExists(arguments, "qTypeID") and arguments.qTypeID neq "">
        <cfset arrayAppend(setClauses, "qTypeID = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "qtext") and arguments.qtext neq "">
        <cfset arrayAppend(setClauses, "qtext = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "qorder") and arguments.qorder neq "">
        <cfset arrayAppend(setClauses, "qorder = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "userid") and arguments.userid neq "" >
        <cfset arrayAppend(setClauses, "userid = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted") and arguments.isDeleted neq "" >
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE qid = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters using cfqueryparam --->
            <cfif structKeyExists(arguments, "qTypeID") and arguments.qTypeID neq "">
                <cfqueryparam value="#arguments.qTypeID#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "qtext") and arguments.qtext neq "">
                <cfqueryparam value="#arguments.qtext#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "qorder") and arguments.qorder neq "">
                <cfqueryparam value="#arguments.qorder#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "userid") and arguments.userid neq "" >
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted") and arguments.isDeleted neq "" >
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>

            <!--- qid is always required --->
            <cfqueryparam value="#arguments.qid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes without error, return true --->
        <cfset result = true>

        <!--- Catch any errors that occur during query execution --->
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating audquestions_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            
            <!--- Optionally handle or rethrow the error here --->
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the default attribute for 'isDeleted' in cfargument to be an empty string for consistency.
--->

<cffunction name="getvm_audquestions_user_audanswers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">

    <cfset var local = {} />
    <cfset local.queryResult = queryNew("qid,qtypeid,qorder,answerID,eventid,aRating,qtext,qtype,aText,amemo", "integer,integer,integer,integer,integer,integer,varchar,varchar,longvarchar,longvarchar")>
    <cfset local.sql = "SELECT qid, qtypeid, qorder, answerID, eventid, aRating, qtext, qtype, aText, amemo FROM vm_audquestions_user_audanswers WHERE 1=1">
    <cfset local.whereClause = []>
    <cfset local.params = []>

    <!--- Valid columns for WHERE and ORDER BY clauses --->
    <cfset local.validColumns = "qid,qtypeid,qorder,answerID,eventid,aRating,qtext,qtype,aText,amemo">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(local.validColumns, key)>
            <cfset arrayAppend(local.whereClause, "#key# = ?")>
            <cfset arrayAppend(local.params, {value=arguments.filters[key], cfsqltype=local.getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(local.whereClause)>
        <cfset local.sql &= " AND " & arrayToList(local.whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif len(arguments.orderBy) AND listFindNoCase(local.validColumns, arguments.orderBy)>
        <cfset local.sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="local.queryResult" datasource="yourDataSource">
            #local.sql#
            <cfloop array="#local.params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getvm_audquestions_user_audanswers: #cfcatch.message# - #cfcatch.detail# - SQL: #local.sql#">
            <!--- Return empty query on error --->
            <cfreturn local.queryResult>
        </cfcatch>
    </cftry>

    <!--- Return the result set --->
    <cfreturn local.queryResult>

</cffunction></cfcomponent>
