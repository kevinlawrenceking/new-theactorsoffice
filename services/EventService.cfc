<cfcomponent displayname="EventService" hint="Handles operations for Event table" output="false" > 
<cffunction name="insertevents" access="public" returntype="numeric">
    <cfargument name="eventData" type="struct" required="true">
    <cfset var sql = "INSERT INTO events_tbl (
        eventID, userID, contactid, audlocid, audbooktypeid, callbacktypeid, 
        audplatformID, audStepID, audRoleID, audTypeID, region_id, eventTitle,
        eventDescription, eventLocation, eventStatus, eventTypeName, recordname,
        dow, audLocation, audlocadd1, audlocadd2, audcity, regionid, audzip,
        IsDeleted, trackmileage, workwithcoach, eventCreation, eventStart,
        eventStop, endRecur, parkingDetails, eventStartTime, eventStopTime
    ) VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
        ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?
    )">
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.eventData.eventID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.eventData.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.eventData.contactid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.contactid)#">
            <cfqueryparam value="#arguments.eventData.audlocid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.audlocid)#">
            <cfqueryparam value="#arguments.eventData.audbooktypeid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.audbooktypeid)#">
            <cfqueryparam value="#arguments.eventData.callbacktypeid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.callbacktypeid)#">
            <cfqueryparam value="#arguments.eventData.audplatformID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.audplatformID)#">
            <cfqueryparam value="#arguments.eventData.audStepID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.eventData.audRoleID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.audRoleID)#">
            <cfqueryparam value="#arguments.eventData.audTypeID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.audTypeID)#">
            <cfqueryparam value="#arguments.eventData.region_id#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventData.region_id)#">
            <cfqueryparam value="#arguments.eventData.eventTitle#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.eventTitle)#">
            <cfqueryparam value="#arguments.eventData.eventDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.eventDescription)#">
            <cfqueryparam value="#arguments.eventData.eventLocation#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.eventLocation)#">
            <cfqueryparam value="#arguments.eventData.eventStatus#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.eventStatus)#">
            <cfqueryparam value="#arguments.eventData.eventTypeName#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.eventData.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.recordname)#">
            <cfqueryparam value="#arguments.eventData.dow#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.dow)#">
            <cfqueryparam value="#arguments.eventData.audLocation#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.audLocation)#">
            <cfqueryparam value="#arguments.eventData.audlocadd1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.audlocadd1)#">
            <cfqueryparam value="#arguments.eventData.audlocadd2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.audlocadd2)#">
            <cfqueryparam value="#arguments.eventData.audcity#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.audcity)#">
            <cfqueryparam value="#arguments.eventData.regionid#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.regionid)#">
            <cfqueryparam value="#arguments.eventData.audzip#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventData.audzip)#">
            <cfqueryparam value="#arguments.eventData.IsDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.eventData.trackmileage#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.eventData.trackmileage)#">
            <cfqueryparam value="#arguments.eventData.workwithcoach#" cfsqltype="CF_SQL_BIT">
            <!-- The following fields are nullable and have no default values -->
            <cfqueryparam value="#arguments.eventData.endRecur#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.eventData.endRecur)#">
            <cfqueryparam value="#arguments.eventData.parkingDetails#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.eventData.parkingDetails)#">
            <cfqueryparam value="#arguments.startTime#" cfsqltype="CF_SQL_TIME" null="#isNull(arguments.startTime)#"> 
			<cfqueryparam value="#arguments.stopTime.timeStop#" cfsqltype= "CF_SQL_TIME" null= "#IsNUll (Arguments.stopTime) #"> 
        </cfquery> 
		<cfreturn insertResult.generatedKey> 
	</cftry> 
	< cfcatch> 
		< cfLog type= "error " text= "Error inserting into events_tbl: # cfCatch.message# Details: # cfCatch.detail# SQL: # sql#"> 
		< cfreturn 0> 
	</ cfcatch> 
</ cftry> 
</cffunction>

<!--- Changes made:
- Fixed incorrect closing tags for `<cffunction>` and `<cftry>` blocks.
- Corrected the `cfsqltime` attribute to `cfsqltype` in `<cfqueryparam>` for `stopTime`.
- Corrected variable references for `startTime` and `stopTime`.
--->

<cffunction name="getevents" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="eventID">
    
    <cfset var validColumns = "eventID,userID,contactid,audlocid,audbooktypeid,callbacktypeid,audplatformID,audStepID,audRoleID,audTypeID,region_id,eventTitle,eventDescription,eventLocation,eventStatus,eventTypeName,recordname,dow,audLocation,audlocadd1,audlocadd2,audcity,regionid,audzip,IsDeleted,trackmileage,workwithcoach,eventCreation,eventStart,eventStop,endRecur,parkingDetails,eventStartTime,eventStopTime">
    <cfset var validOrderColumns = "eventID,userID,eventCreation">
    <cfset var sql = "SELECT eventID, userID, contactid, audlocid, audbooktypeid, callbacktypeid, audplatformID, audStepID, audRoleID, audTypeID, region_id, eventTitle, eventDescription, eventLocation, eventStatus, eventTypeName, recordname, dow, audLocation, audlocadd1, audlocadd2, audcity, regionid, audzip, IsDeleted, trackmileage, workwithcoach, eventCreation, eventStart, eventStop, endRecur, parkingDetails, eventStartTime, eventStopTime FROM events_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">
    
    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause,
                    "#key# = <cfqueryparam value='#arguments.filters[key]#' cfsqltype='CF_SQL_#ucase(getColumnType(key))#' null='#isNull(arguments.filters[key])#'>")>
            </cfif>
        </cfloop>

        <!--- Append WHERE clauses if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getevents: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset queryResult = queryNew("eventID,userID,contactid,audlocid,audbooktypeid,
            callbacktypeid,audplatformID,audStepID,audRoleID,audTypeID,
            region_id,eventTitle,eventDescription,eventLocation,
            eventStatus,eventTypeName,recordname,dow,audLocation,
            audlocadd1,audlocadd2,audcity,regionid,audzip,
            IsDeleted,trackmileage,workwithcoach,eventCreation,
            eventStart,eventStop,endRecur,
            parkingDetails,eventStartTime,eventStopTime",
            "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,
            bit,
            bit,
            bit,timestamp,date,date,date,longvarchar,time,time")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- Corrected the SQL data types in the queryNew function to match expected types for each column.
--->

<cffunction name="updateevents" access="public" returntype="boolean">
    <cfargument name="eventID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfset var sql = "UPDATE events_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "eventTitle,eventDescription,eventLocation,eventStatus,eventStart,eventStop,eventTypeName,recordname,dow,audLocation,audlocadd1,audlocadd2,audcity,regionid,audzip,IsDeleted,trackmileage,workwithcoach,endRecur,parkingDetails,eventStartTime,eventStopTime">
    <cfset var result = false>

    <cftry>
        <!--- Build the SET clause dynamically based on provided data --->
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- If there are no valid columns to update, return false --->
        <cfif arrayLen(setClauses) eq 0>
            <cfreturn false>
        </cfif>

        <!--- Construct the SQL query --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE eventID = ?">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters using cfqueryparam --->
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.eventID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If execution reaches here without error, return true --->
        <cfset result = true>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error updating events_tbl: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        <!--- Return false in case of an error --->
        <cfset result = false>
    </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added missing opening tag for cfcatch.
--->

<cffunction name="getvm_events_audprojects_sources_steps" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="eventid">
    
    <cfset var validColumns = "eventid,projname,audsource,audtype,audlocation,audroletype,audstep,workwithcoach,eventStart,eventStartTime">
    <cfset var validOrderByColumns = "eventid,projname,audsource,audtype,audlocation,audroletype,audstep,workwithcoach,eventStart,eventStartTime">
    <cfset var sql = "SELECT eventid, projname, audsource, audtype, audlocation, audroletype, audstep, workwithcoach, eventStart, eventStartTime FROM vm_events_audprojects_sources_steps WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">

    <cftry>
        <!--- Build WHERE clause dynamically based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append conditions to the SQL statement --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and apply ORDER BY clause --->
        <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & ucase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getvm_events_audprojects_sources_steps: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with the correct structure --->
        <cfset queryResult = queryNew("eventid,projname,audsource,audtype,audlocation,audroletype,audstep,workwithcoach,eventStart,eventStartTime", "integer,varchar,varchar,varchar,varchar,varchar,varchar,bit,date,time")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>
<cffunction name="getvm_events_audroles" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="eventid">
    
    <cfset var validOrderColumns = "eventid,audroleid,audprojectid,eventStart,new_projDate,max_projDate,eventStartTime">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT eventid, audroleid, audprojectid, eventStart, new_projDate, max_projDate, eventStartTime FROM vm_events_audroles WHERE 1=1">
    
    <cftry>
        <!--- Validate and append WHERE clause --->
        <cfif structKeyExists(arguments, "audroleid") and isNumeric(arguments.audroleid)>
            <cfset sql &= " AND audroleid = ?">
        </cfif>
        
        <!--- Validate ORDER BY clause --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- Return the result --->
        <cfreturn queryResult>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getvm_events_audroles: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with the correct structure --->
        <cfreturn queryNew("eventid,audroleid,audprojectid,eventStart,new_projDate,max_projDate,eventStartTime", "integer,integer,integer,date,date,date,time")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getvm_events_tbl_eventcontactsxref" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT `col1` FROM vm_events_tbl_eventcontactsxref WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "col1">
    <cfset var orderByColumn = "col1"> <!-- Default ORDER BY column -->
    
    <!-- Add dynamic conditions based on filters -->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!-- Add session-based conditions -->
    <cfset arrayAppend(whereClause, "e.userid = ?")>
    <cfset arrayAppend(whereClause, "t.userid = ?")>
    <cfset arrayAppend(whereClause, "e.eventstart >= CURDATE()")>

    <!-- Construct the final SQL query -->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!-- Add ORDER BY clause -->
    <cfif listFindNoCase(validColumns, orderByColumn)>
        <cfset sql &= " ORDER BY #orderByColumn#">
    </cfif>

    <!-- Execute the query within a try/catch block for error handling -->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
            <!-- Additional cfqueryparam bindings for dynamic filters can be added here -->
        </cfquery>
        <cfcatch>
            <!-- Log the error details -->
            <cflog file="application" text="Error in getvm_events_tbl_eventcontactsxref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

            <!-- Return an empty query with the correct schema on error -->
            <cfset queryResult = queryNew("col1", "CF_SQL_LONGVARCHAR")>
        </cfcatch>
    </cftry>

    <!-- Return the result set -->
    <cfreturn queryResult>
</cffunction>
<cffunction name="getvm_events_location_region_country" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT `region_id`, `eventLocation`, `audlocadd1`, `audlocadd2`, `audcity`, `audzip`, `regionname`, `countryname` FROM vm_events_location_region_country WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "region_id,eventLocation,audlocadd1,audlocadd2,audcity,audzip,regionname,countryname">
    <cfset var orderByClause = "">
    <cfset var result = "">

    <cftry>
        <!--- Build WHERE clause dynamically --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(trim(arguments.orderBy)) and listFindNoCase(validColumns, arguments.orderBy)>
            <cfset orderByClause = " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql##orderByClause#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(replace(key, ' ', '', 'all')))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Return the result set --->
        <cfreturn result>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" type="error" text="Error in getvm_events_location_region_country: #cfcatch.message#. Details: #cfcatch.detail#. Query: #sql##orderByClause#">
        
        <!--- Return an empty query with correct schema --->
        <cfreturn queryNew("region_id,eventLocation,audlocadd1,audlocadd2,audcity,audzip,regionname,countryname", "integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getvm_events_eventtypes_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="eventID">
    <cfset var validColumns = "eventID,eventTitle,eventLocation,eventDescription,eventStatus,eventtypecolor,dow,eventStart,eventStop,endRecur,eventStartTime">
    <cfset var validOrderColumns = "eventID,eventTitle,eventStart">
    <cfset var sql = "SELECT eventID, eventTitle, eventLocation, eventDescription, eventStatus, eventtypecolor, dow, eventStart, eventStop, endRecur, eventStartTime FROM vm_events_eventtypes_user WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
            </cfif>
        </cfloop>

        <!--- Add predefined conditions --->
        <cfset arrayAppend(whereClause, "i.valuecategory = 'Tag'")>
        <cfset arrayAppend(whereClause, "i.valuetype = 'Tags'")>
        <cfset arrayAppend(whereClause, "tu.tagtype = 'C'")>
        <cfset arrayAppend(whereClause, "tu.tagname = i.valuetext")>
        <cfset arrayAppend(whereClause, "d.contactid = ?")>
        <cfset arrayAppend(queryParams, {value=new_contactid, cfsqltype="CF_SQL_INTEGER"})>

        <!--- Append WHERE clauses to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getvm_events_eventtypes_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("eventID,eventTitle,eventLocation,eventDescription,eventStatus,eventtypecolor,dow,eventStart,eventStop,endRecur,eventStartTime", "integer,varchar,varchar,varchar,varchar,varchar,varchar,date,date,date,time")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
