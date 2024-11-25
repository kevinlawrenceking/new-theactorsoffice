<cffunction output="false" name="INSevents_24096" access="public" returntype="numeric">
    <cfargument name="new_userid" type="string" required="yes">
    <cfargument name="new_audRoleID" type="numeric" required="no">
    <cfargument name="new_audTypeID" type="numeric" required="no">
    <cfargument name="new_audLocation" type="string" required="no">
    <cfargument name="new_eventStart" type="date" required="no">
    <cfargument name="new_eventStartTime" type="string" required="no">
    <cfargument name="new_eventStopTime" type="string" required="no">
    <cfargument name="new_audplatformid" type="numeric" required="no">
    <cfargument name="new_audStepID" type="numeric" required="no">
    <cfargument name="new_parkingDetails" type="string" required="no">
    <cfargument name="new_workwithcoach" type="boolean" required="no">
    <cfargument name="new_trackmileage" type="boolean" required="no">
    <cfargument name="new_audlocid" type="numeric" required="no">

    <!--- Initialize dynamic column and queryparam lists --->
    <cfset local.columnList = []>
    <cfset local.paramList = []>

    <!--- Add required arguments --->
    <cfset arrayAppend(local.columnList, "userid")>
    <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.new_userid#'>")>

    <!--- Add optional arguments if they exist and are valid --->
    <cfif structKeyExists(arguments, "new_audRoleID") AND isNumeric(arguments.new_audRoleID)>
        <cfset arrayAppend(local.columnList, "audRoleID")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.new_audRoleID#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_audTypeID") AND isNumeric(arguments.new_audTypeID)>
        <cfset arrayAppend(local.columnList, "audTypeID")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.new_audTypeID#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_audLocation") AND len(trim(arguments.new_audLocation))>
        <cfset arrayAppend(local.columnList, "audLocation")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_VARCHAR' value='#arguments.new_audLocation#' maxlength='500'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_eventStart") AND isDate(arguments.new_eventStart)>
        <cfset arrayAppend(local.columnList, "eventStart")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_DATE' value='#arguments.new_eventStart#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_eventStartTime") AND len(trim(arguments.new_eventStartTime))>
        <cfset arrayAppend(local.columnList, "eventStartTime")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_TIME' value='#arguments.new_eventStartTime#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_eventStopTime") AND len(trim(arguments.new_eventStopTime))>
        <cfset arrayAppend(local.columnList, "eventStopTime")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_TIME' value='#arguments.new_eventStopTime#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_audplatformid") AND isNumeric(arguments.new_audplatformid)>
        <cfset arrayAppend(local.columnList, "audplatformID")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.new_audplatformid#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_audStepID") AND isNumeric(arguments.new_audStepID)>
        <cfset arrayAppend(local.columnList, "audStepID")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.new_audStepID#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_parkingDetails") AND len(trim(arguments.new_parkingDetails))>
        <cfset arrayAppend(local.columnList, "parkingDetails")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_LONGVARCHAR' value='#arguments.new_parkingDetails#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_workwithcoach") AND isBoolean(arguments.new_workwithcoach)>
        <cfset arrayAppend(local.columnList, "workwithcoach")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_BIT' value='#arguments.new_workwithcoach#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_trackmileage") AND isBoolean(arguments.new_trackmileage)>
        <cfset arrayAppend(local.columnList, "trackmileage")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_BIT' value='#arguments.new_trackmileage#'>")>
    </cfif>

    <cfif structKeyExists(arguments, "new_audlocid") AND isNumeric(arguments.new_audlocid)>
        <cfset arrayAppend(local.columnList, "audlocid")>
        <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.new_audlocid#'>")>
    </cfif>

    <!--- Always include isdeleted column --->
    <cfset arrayAppend(local.columnList, "isdeleted")>
    <cfset arrayAppend(local.paramList, "<cfqueryparam cfsqltype='CF_SQL_BIT' value='1'>")>

    <!--- Execute the query --->
    <cfquery result="result">
        INSERT INTO events_tbl (#arrayToList(local.columnList)#)
        VALUES (#arrayToList(local.paramList)#)
    </cfquery>

    <!--- Return the auto-generated key --->
    <cfreturn result.generatedKey>
</cffunction>
