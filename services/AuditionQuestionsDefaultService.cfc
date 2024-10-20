<cfcomponent displayname="AuditionQuestionsDefaultService" hint="Handles operations for AuditionQuestionsDefault table" output="false" > 
<cffunction name="insertaudquestions_default" access="public" returntype="numeric">
    <cfargument name="qID" type="numeric" required="true">
    <cfargument name="qTypeID" type="numeric" required="false" default="2">
    <cfargument name="qtext" type="string" required="true">
    <cfargument name="qorder" type="numeric" required="false" default="0">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audquestions_default (qID, qTypeID, qtext, qorder, isDeleted, recordname) VALUES (?, ?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.qID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.qTypeID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.qtext#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.qorder#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        <cfset insertResult = insertQuery.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into audquestions_default: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return 0 or some error code to indicate failure --->
            <cfreturn 0>
        </cfcatch>
    </cftry>

    <!--- Return the generated key from the insert operation --->
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- No syntax errors were found in the provided code.
--->

<cffunction name="updateaudquestions_default" access="public" returntype="boolean">
    <cfargument name="qID" type="numeric" required="true">
    <cfargument name="qTypeID" type="numeric" required="false" default="">
    <cfargument name="qtext" type="string" required="false" default="">
    <cfargument name="qorder" type="numeric" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var result = false>
    <cfset var sql = "UPDATE audquestions_default SET">
    <cfset var setClauses = []>
    
    <!--- Build SET clause dynamically --->
    <cfif len(arguments.qTypeID)>
        <cfset arrayAppend(setClauses, "qTypeID = ?")>
    </cfif>
    <cfif len(arguments.qtext)>
        <cfset arrayAppend(setClauses, "qtext = ?")>
    </cfif>
    <cfif len(arguments.qorder)>
        <cfset arrayAppend(setClauses, "qorder = ?")>
    </cfif>
    <cfif isDefined("arguments.isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>
    <cfif len(arguments.recordname)>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Complete SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE qID = ?">

    <!--- Execute the query --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif len(arguments.qTypeID)>
                <cfqueryparam value="#arguments.qTypeID#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif len(arguments.qtext)>
                <cfqueryparam value="#arguments.qtext#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif len(arguments.qorder)>
                <cfqueryparam value="#arguments.qorder#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif isDefined("arguments.isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfif len(arguments.recordname)>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <!--- qID is always required --->
            <cfqueryparam value="#arguments.qID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes without error, return true --->
        <cfset result = true>

        <!--- Error handling --->
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error updating audquestions_default: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return result --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code was syntactically correct.
--->
</cfcomponent>
