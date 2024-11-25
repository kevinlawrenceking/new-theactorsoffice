<cffunction output="false" name="INSevents_24096" access="public" returntype="numeric">
    <cfargument name="new_userid" type="string" required="yes">
    <cfargument name="new_audRoleID" type="numeric" required="no" default="">
    <cfargument name="new_audTypeID" type="numeric" required="no" default="">
    <cfargument name="new_audLocation" type="string" required="no" default="">
    <cfargument name="new_eventStart" type="date" required="no" default="">
    <cfargument name="new_eventStartTime" type="string" required="no" default="">
    <cfargument name="new_eventStopTime" type="string" required="no" default="">
    <cfargument name="new_audplatformid" type="numeric" required="no" default="">
    <cfargument name="new_audStepID" type="numeric" required="no" default="">
    <cfargument name="new_parkingDetails" type="string" required="no" default="">
    <cfargument name="new_workwithcoach" type="boolean" required="no" default="">
    <cfargument name="new_trackmileage" type="boolean" required="no" default="">
    <cfargument name="new_audlocid" type="numeric" required="no" default="">

    <!-- Execute the query -->
    <cfquery result="result">
        INSERT INTO events_tbl (
            userid
            <cfif structKeyExists(arguments, "new_audRoleID") AND isNumeric(arguments.new_audRoleID)>, audRoleID</cfif>
            <cfif structKeyExists(arguments, "new_audTypeID") AND isNumeric(arguments.new_audTypeID)>, audTypeID</cfif>
            <cfif structKeyExists(arguments, "new_audLocation") AND len(trim(arguments.new_audLocation))>, audLocation</cfif>
            <cfif structKeyExists(arguments, "new_eventStart") AND isDate(arguments.new_eventStart)>, eventStart</cfif>
            <cfif structKeyExists(arguments, "new_eventStartTime") AND len(trim(arguments.new_eventStartTime))>, eventStartTime</cfif>
            <cfif structKeyExists(arguments, "new_eventStopTime") AND len(trim(arguments.new_eventStopTime))>, eventStopTime</cfif>
            <cfif structKeyExists(arguments, "new_audplatformid") AND isNumeric(arguments.new_audplatformid)>, audplatformID</cfif>
            <cfif structKeyExists(arguments, "new_audStepID") AND isNumeric(arguments.new_audStepID)>, audStepID</cfif>
            <cfif structKeyExists(arguments, "new_parkingDetails") AND len(trim(arguments.new_parkingDetails))>, parkingDetails</cfif>
            <cfif structKeyExists(arguments, "new_workwithcoach") AND isBoolean(arguments.new_workwithcoach)>, workwithcoach</cfif>
            <cfif structKeyExists(arguments, "new_trackmileage") AND isBoolean(arguments.new_trackmileage)>, trackmileage</cfif>
            <cfif structKeyExists(arguments, "new_audlocid") AND isNumeric(arguments.new_audlocid)>, audlocid</cfif>,
            isdeleted
        )
        VALUES (
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#">
            <cfif structKeyExists(arguments, "new_audRoleID") AND isNumeric(arguments.new_audRoleID)>, <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#"></cfif>
            <cfif structKeyExists(arguments, "new_audTypeID") AND isNumeric(arguments.new_audTypeID)>, <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audTypeID#"></cfif>
            <cfif structKeyExists(arguments, "new_audLocation") AND len(trim(arguments.new_audLocation))>, <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audLocation#" maxlength="500"></cfif>
            <cfif structKeyExists(arguments, "new_eventStart") AND isDate(arguments.new_eventStart)>, <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_eventStart#"></cfif>
            <cfif structKeyExists(arguments, "new_eventStartTime") AND len(trim(arguments.new_eventStartTime))>, <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStartTime#"></cfif>
            <cfif structKeyExists(arguments, "new_eventStopTime") AND len(trim(arguments.new_eventStopTime))>, <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#"></cfif>
            <cfif structKeyExists(arguments, "new_audplatformid") AND isNumeric(arguments.new_audplatformid)>, <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#"></cfif>
            <cfif structKeyExists(arguments, "new_audStepID") AND isNumeric(arguments.new_audStepID)>, <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audStepID#"></cfif>
            <cfif structKeyExists(arguments, "new_parkingDetails") AND len(trim(arguments.new_parkingDetails))>, <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_parkingDetails#"></cfif>
            <cfif structKeyExists(arguments, "new_workwithcoach") AND isBoolean(arguments.new_workwithcoach)>, <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_workwithcoach#"></cfif>
            <cfif structKeyExists(arguments, "new_trackmileage") AND isBoolean(arguments.new_trackmileage)>, <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_trackmileage#"></cfif>
            <cfif structKeyExists(arguments, "new_audlocid") AND isNumeric(arguments.new_audlocid)>, <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audlocid#"></cfif>,
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="1">
        )
    </cfquery>

    <!-- Return the generated key -->
    <cfreturn result.generatedKey>
</cffunction>
