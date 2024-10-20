<cfcomponent displayname="AuditionProjectService" hint="Handles operations for AuditionProject table" output="false" > 
<cffunction name="insertaudprojects" access="public" returntype="numeric">
    <cfargument name="projName" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="isDirect" type="boolean" required="true">
    <cfargument name="projDescription" type="string" required="false" default="">
    <cfargument name="audSubCatID" type="numeric" required="false" default="">
    <cfargument name="unionID" type="numeric" required="false" default="">
    <cfargument name="networkID" type="numeric" required="false" default="">
    <cfargument name="toneID" type="numeric" required="false" default="">
    <cfargument name="contractTypeID" type="numeric" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="contactid" type="numeric" required="false" default="">
    <cfargument name="projDate" type="date" required="false">

    <cfset var insertResult = 0>

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO audprojects (
                projName, 
                projDescription, 
                userid, 
                audSubCatID, 
                unionID, 
                networkID, 
                toneID, 
                contractTypeID, 
                isDeleted, 
                recordname, 
                contactid, 
                projDate, 
                isDirect
            ) VALUES (
                <cfqueryparam value="#arguments.projName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.projDescription#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.projDescription)#">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audSubCatID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.audSubCatID)#">,
                <cfqueryparam value="#arguments.unionID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.unionID)#">,
                <cfqueryparam value="#arguments.networkID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.networkID)#">,
                <cfqueryparam value="#arguments.toneID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.toneID)#">,
                <cfqueryparam value="#arguments.contractTypeID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.contractTypeID)#">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">,
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.contactid)#">,
                <cfqueryparam value="#arguments.projDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.projDate)#">,
                <cfqueryparam value="#arguments.isDirect#" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>

        <!--- Return the generated key for the inserted record --->
        <cfset insertResult = queryResult.generatedKey>

        <!--- Error handling --->
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="/path/to/logfile.log"
                   text="[Error] #cfcatch.message# - #cfcatch.detail# - SQL: INSERT INTO audprojects (...) VALUES (...)">
            <!--- Return 0 or handle as needed --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <!--- Return the result of the insertion --->
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Added missing `<cfcatch>` tag to properly close the `<cftry>` block.
--->

<cffunction name="getaudprojects" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var sql = "SELECT `audprojectID`, `userid`, `audSubCatID`, `unionID`, `networkID`, `toneID`, `contractTypeID`, `contactid`, `projName`, `recordname`, `isDeleted`, `isDirect`, `audprojectdate`, `projDate`, `projDescription` FROM audprojects WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "audprojectID,userid,audSubCatID,unionID,networkID,toneID,contractTypeID,contactid,projName,recordname,isDeleted,isDirect,audprojectdate,projDate,projDescription">
    <cfset var validOrderColumns = "audprojectID,userid,audSubCatID,unionID,networkID,toneID,contractTypeID,contactid,projName,recordname,isDeleted,isDirect,audprojectdate,projDate">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Add ORDER BY clause if valid --->
        <cfif len(arguments.orderBy) and listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Return the result set --->
        <cfreturn result>

        <!--- Error handling --->
        <cfcatch type="any">
            <cflog text="Error in getaudprojects: #cfcatch.message# - #cfcatch.detail#" type="error">
            <!--- Return an empty query with the correct schema --->
            <cfreturn queryNew("audprojectID,userid,audSubCatID,unionID,networkID,toneID,contractTypeID,contactid,projName,recordname,isDeleted,isDirect,audprojectdate,projDate,projDescription", "integer,integer,integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,timestamp,date,longvarchar")>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- No syntax errors found. The code is correct as provided.
--->

<cffunction name="updateaudprojects" access="public" returntype="boolean">
    <cfargument name="audprojectID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfset var sql = "UPDATE audprojects SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "projName,projDescription,userid,audSubCatID,unionID,networkID,toneID,contractTypeID,isDeleted,recordname,contactid,audprojectdate,projDate,isDirect">
    <cfset var result = false>

    <cftry>
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(setClauses) gt 0>
            <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audprojectID = ?">

            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                </cfloop>
                <cfqueryparam value="#arguments.audprojectID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <cfset result = true>
        </cfif>

        <cfcatch type="any">
            <cflog file="application" text="Error updating audprojects: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getvm_audprojects_roles_events" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var queryResult = "">
    <cfset var sql = "">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "audprojectID,eventid,audlocid,audstepid,audroleid,audplatformid,audbooktypeid,region_id,projName,network,audSubCatName,unionName,audRoleName,audroletype,auddialect,audlocation,audtype,audstep,eventLocation,audlocadd1,audzip,audlocadd2,audcity,countryid,isDeleted,trackmileage,islocation,projdate,holdStartDate,holdEndDate,eventStart,projDescription,charDescription,parkingdetails,new_durhours,eventStartTime,eventStopTime">

    <cftry>
        <!--- Construct SQL query --->
        <cfset sql = "
            SELECT 
                audprojectID,
                eventid,
                audlocid,
                audstepid,
                audroleid,
                audplatformid,
                audbooktypeid,
                region_id,
                projName,
                network,
                audSubCatName,
                unionName,
                audRoleName,
                audroletype,
                auddialect,
                audlocation,
                audtype,
                audstep,
                eventLocation,
                audlocadd1,
                audzip,
                audlocadd2,
                audcity,
                countryid,
                isDeleted,
                trackmileage,
                islocation,
                projdate,
                holdStartDate,
                holdEndDate,
                eventStart,
                projDescription,
                charDescription,
                parkingdetails,
                new_durhours,
                eventStartTime,
                eventStopTime
            FROM 
                vm_audprojects_roles_events
            WHERE 
                1=1
        ">

        <!--- Add dynamic WHERE clause --->
        <cfif structKeyExists(arguments, "audroleid")>
            <cfset arrayAppend(whereClause, "audroleid = ?")>
        </cfif>

        <!--- Append WHERE clauses if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Add ORDER BY clause if valid --->
        <cfif len(arguments.orderBy) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfif structKeyExists(arguments, "audroleid")>
                <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.audroleid)#">
            </cfif>
        </cfquery>

    <cfcatch>
        <!--- Log error details --->
        <cflog file="application" text="Error in getvm_audprojects_roles_events: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset queryResult = queryNew("audprojectID,eventid,audlocid,audstepid,audroleid,audplatformid,audbooktypeid,region_id,projName,network,audSubCatName,unionName,audRoleName,audroletype,auddialect,audlocation,audtype,audstep,eventLocation,audlocadd1,audzip,audlocadd2,audcity,countryid,isDeleted,trackmileage,islocation,projdate,holdStartDate,holdEndDate,eventStart,projDescription,charDescription,parkingdetails,new_durhours,eventStartTime,eventStopTime", "integer,integer,integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,bit,bit,bit,date,date,date,date,longvarchar,longvarchar,longvarchar,decimal,time,time")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
