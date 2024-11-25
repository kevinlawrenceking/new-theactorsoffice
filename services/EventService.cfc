<cfcomponent displayname="EventService" hint="Handles operations for Event table" > 

<cffunction output="false" name="eventresults" access="public" returntype="struct">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="currentid" type="numeric" required="false" default="">
 

    <!--- Query for event results --->
    <cfquery result="result" name="eventresults">
        SELECT 
            e.eventID,
            e.eventID AS recid,
            e.eventTitle AS col1,
            e.eventDescription,
            e.eventLocation AS col2,
            e.eventStatus AS col4,
            e.eventCreation,
            e.eventStart AS col3,
            e.eventStop,
            e.eventTypeName AS col5,
            'Appointment' AS head1,
            'Location' AS head2,
            'Date' AS head3,
            'Status' AS head4,
            'Type' AS head5,
            e.userid,
            e.eventStartTime,
            e.eventStopTime,
            t.eventtypecolor,
            e.eventid,
            r.audprojectid,
            s.audstep
        FROM events e
        INNER JOIN eventtypes_user t ON t.eventtypename = e.eventtypename
        LEFT JOIN events a ON e.eventid = a.eventid
        LEFT JOIN audroles r ON r.audroleid = a.audroleid
        LEFT JOIN audsteps s ON s.audstepid = a.audstepid
        WHERE e.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
          AND t.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">

        <cfif arguments.currentid neq "">
            AND e.eventid IN (SELECT eventid FROM eventcontactsxref WHERE contactid = <cfqueryparam value="#arguments.currentid#" cfsqltype="cf_sql_integer">)
        </cfif>

        ORDER BY e.eventstart DESC
    </cfquery>

    <cfset var resultStruct = structNew()>
    <cfset resultStruct.eventresults = eventresults>
    <cfset resultStruct.recordcount = eventresults.recordcount>

    <cfreturn resultStruct>
</cffunction>




<cffunction output="false" name="INSevents" access="public" returntype="numeric">
    <cfargument name="eventTitle" type="string" required="true">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="eventDescription" type="string" required="true">
    <cfargument name="eventLocation" type="string" required="true">
    <cfargument name="eventStart" type="date" required="false">
    <cfargument name="eventStartTime" type="time" required="false">
    <cfargument name="eventStopTime" type="time" required="false">
    <cfargument name="dow" type="string" required="false" default="">
    <cfargument name="endRecur" required="false"> <!--- Remove type="date" to prevent the initial error --->
    <cfargument name="userid" type="numeric" required="true">

    <!--- Check if endRecur is a valid date or set it to null --->
    <cfif not isDate(arguments.endRecur)>
        <cfset arguments.endRecur = JavaCast("null", "")>
    </cfif>

    <cfquery name="insertEventQuery" result="insertResult">
        INSERT INTO events_tbl (
            eventTitle,
            eventTypeName,
            eventDescription,
            eventLocation,
            userid
            <cfif structKeyExists(arguments, "eventStart") and isDate(arguments.eventStart)>, eventStart</cfif>
            <cfif structKeyExists(arguments, "eventStartTime")>, eventStartTime</cfif>
            <cfif structKeyExists(arguments, "eventStopTime")>, eventStopTime</cfif>
            <cfif structKeyExists(arguments, "dow") and len(arguments.dow) gt 0>, dow</cfif>
            <cfif structKeyExists(arguments, "endRecur") and isDate(arguments.endRecur)>, endRecur</cfif>
        ) VALUES (
            <cfqueryparam value="#arguments.eventTitle#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.eventTypeName#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.eventDescription#" cfsqltype="CF_SQL_LONGVARCHAR">,
            <cfqueryparam value="#arguments.eventLocation#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfif structKeyExists(arguments, "eventStart") and isDate(arguments.eventStart)>, <cfqueryparam value="#arguments.eventStart#" cfsqltype="CF_SQL_DATE"></cfif>
            <cfif structKeyExists(arguments, "eventStartTime")>, <cfqueryparam value="#arguments.eventStartTime#" cfsqltype="CF_SQL_TIME"></cfif>
            <cfif structKeyExists(arguments, "eventStopTime")>, <cfqueryparam value="#arguments.eventStopTime#" cfsqltype="CF_SQL_TIME"></cfif>
            <cfif structKeyExists(arguments, "dow") and len(arguments.dow) gt 0>, <cfqueryparam value="#arguments.dow#" cfsqltype="CF_SQL_VARCHAR"></cfif>
            <cfif structKeyExists(arguments, "endRecur") and isDate(arguments.endRecur)>, <cfqueryparam value="#arguments.endRecur#" cfsqltype="CF_SQL_DATE"></cfif>
        )
    </cfquery>

    <!--- Return the primary key of the newly inserted record --->
    <cfreturn insertResult.generatedKey>
</cffunction>


<cffunction output="false" name="UPDevents" access="public" returntype="void">
    <cfargument name="newStartTime" type="string" required="true">
    
    <cfset var queryResult = "">

        <cfquery result="result" name="queryResult" >
            UPDATE events 
            SET eventstarttime = <cfqueryparam value="#arguments.newStartTime#" cfsqltype="CF_SQL_TIME">
            WHERE eventstarttime IS NULL
        </cfquery>
    
</cffunction>
<cffunction output="false" name="UPDevents_23725" access="public" returntype="void">
    <cfargument name="eventStartTime" type="date" required="true">
    
    
        <cfquery result="result" name="updateQuery" >
            UPDATE events 
            SET eventstoptime = TIME( (ADDTIME(TIME(eventstarttime), TIME('01:00:00'))) % (TIME('24:00:00')))
            WHERE eventstarttime = <cfqueryparam value="#arguments.eventStartTime#" cfsqltype="CF_SQL_TIME">
            AND eventstoptime IS NULL
        </cfquery>
        
        
            
        
    
</cffunction>
<cffunction output="false" name="UPDevents_23726" access="public" returntype="void">
    <cfargument name="eventStart" type="date" required="true">
    
    
        <cfquery result="result" name="updateQuery" >
            UPDATE events 
            SET eventstop = <cfqueryparam value="#arguments.eventStart#" cfsqltype="CF_SQL_TIMESTAMP">
            WHERE eventstop IS NULL 
            AND eventstart IS NOT NULL
        </cfquery>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="UPDevents_23731" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">

    
        <cfquery result="result" >
            UPDATE events_tbl 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
        </cfquery>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="UPDevents_23733" access="public" returntype="void">
    <cfargument name="eventTitle" required="true">
    <cfargument name="eventTypeName" required="true">
    <cfargument name="eventDescription" required="true">
    <cfargument name="eventLocation" required="true">
    <cfargument name="eventStart" required="false" default="#JavaCast('null', '')#">
    <cfargument name="eventStartTime" required="false" default="#JavaCast('null', '')#">
    <cfargument name="dow" required="false" default="#JavaCast('null', '')#">
    <cfargument name="eventStopTime" required="false" default="#JavaCast('null', '')#">
    <cfargument name="endRecur" required="false" default="#JavaCast('null', '')#">
    <cfargument name="eventid" required="true">

    <cfquery result="result">
        UPDATE events 
        SET 
            eventTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventTitle#" />,
            eventTypeName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventTypeName#" />,
            eventDescription = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventDescription#" />,
            eventLocation = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventLocation#" />
            
 
            <cfif isDate(arguments.eventStart)>,
                eventStart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.eventStart#" />,
                eventStop = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.eventStart#" />
            <cfelse>,
                eventStart = NULL,
                eventStop = NULL
            </cfif>
            
            <cfif len(arguments.eventStartTime)>,
                eventStartTime = <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.eventStartTime#" />
            <cfelse>,
                eventStartTime = NULL
            </cfif>
            
            <cfif len(arguments.dow)>,
                dow = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.dow#" />
            <cfelse>,
                dow = NULL
            </cfif>
            
            <cfif isDate(arguments.eventStopTime)>,
                eventStopTime = <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.eventStopTime#" />
            <cfelse>,
                eventStopTime = NULL
            </cfif>
            
            <cfif isDate(arguments.endRecur) and len(arguments.dow)>,
                endRecur = <cfqueryparam cfsqltype="cf_sql_date" value="#dateAdd('d', 1, arguments.endRecur)#" />
            <cfelse>,
                endRecur = NULL
            </cfif>
        
        WHERE 
            eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
    </cfquery>
</cffunction>

<cffunction output="false" name="RESevents" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="eventid" type="numeric" required="true">

    
    
    
        <cfquery name="result" >
            SELECT 
                a.eventid AS recid, 
                'Date' AS head1, 
                'Project' AS head2, 
                'Source' AS head3, 
                'Type' AS head4, 
                'Role' AS head5, 
                a.audstepid, 
                a.eventStart AS col1, 
                p.projname AS col2, 
                s.audsourceid AS col3, 
                t.audtype AS col4, 
                rt.audroletype AS col5, 
                st.audstep
            FROM events a
            LEFT JOIN audroles r ON r.audroleid = a.audroleid
            LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
            LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
            LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
            LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            WHERE a.isdeleted = 0 
              AND r.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
              AND a.eventid <> <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER"> 
              AND a.audstepid <> 4
            ORDER BY a.eventStart
        </cfquery>
        
            
            
        
    

    <cfreturn result>
</cffunction>
<cffunction output="false" name="UPDevents_23762" access="public" returntype="void">
    <cfargument name="eventTitle" type="string" required="true">
    <cfargument name="projName" type="string" required="true">

    
        <cfquery result="result" name="updateQuery" >
            UPDATE events_tbl e
            INNER JOIN audroles r ON r.audroleid = e.audroleid
            INNER JOIN audprojects p ON p.audprojectid = r.audprojectid
            SET e.eventtitle = <cfqueryparam value="#arguments.projName#" cfsqltype="CF_SQL_VARCHAR">,
                e.eventdescription = LEFT(REPLACE(REPLACE(p.projDescription, CHAR(13), ''), CHAR(10), ''), 5000)
            WHERE e.eventtitle != <cfqueryparam value="#arguments.projName#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT DISTINCT 
                p.contactid, 
                c.contactfullname, 
                c.userid, 
                e.eventStart
            FROM 
                events e 
            INNER JOIN 
                audroles r ON r.audroleid = e.audroleid 
            INNER JOIN 
                audprojects p ON p.audprojectid = r.audprojectid 
            INNER JOIN 
                contactdetails c ON c.contactid = p.contactid 
            WHERE 
                e.isdeleted = 0 
                AND r.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER"> 
                AND p.contactid NOT IN (
                    SELECT contactid FROM fusystemusers WHERE sustatus = 'Active'
                )
            ORDER BY 
                e.eventid DESC
        </cfquery>
        
        <cfreturn result>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_23785" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT *
            FROM events
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            AND audstepid = <cfqueryparam value="2" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="SELevents_23786" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT * 
            FROM events 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT"> 
            AND audstepid = <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="SELevents_23787" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT *
            FROM events
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            AND audstepid = <cfqueryparam value="4" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="SELevents_23788" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    
    
        <cfquery name="result" >
            SELECT * 
            FROM events 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT"> 
            AND audstepid = <cfqueryparam value="5" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="SELevents_23789" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT * 
            FROM events e 
            INNER JOIN audroles r ON r.audroleid = e.audroleid 
            WHERE r.audprojectid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.audprojectid#">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="INSevents_23790" access="public" returntype="numeric">
    <cfargument name="new_eventtitle" type="string" required="true">
    <cfargument name="new_eventdescription" type="string" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_audTypeID" type="numeric" required="true">
    <cfargument name="new_audLocation" type="string" required="true">
    <cfargument name="new_eventStart" type="date" required="true">
    <cfargument name="new_eventStartTime" type="time" required="true">
    <cfargument name="new_eventStopTime" type="time" required="true">
    <cfargument name="new_audplatformid" type="numeric" required="true">
    <cfargument name="new_audStepID" type="numeric" required="true">
    <cfargument name="new_parkingDetails" type="string" required="false">
    <cfargument name="new_workwithcoach" type="boolean" required="false">
    <cfargument name="new_trackmileage" type="boolean" required="false">
    <cfargument name="new_audlocid" type="numeric" required="true">

        <cfquery result="result"  name="insertEventQuery">
            INSERT INTO events_tbl (
                eventtitle, 
                eventdescription, 
                userid, 
                audRoleID, 
                audTypeID, 
                audLocation, 
                eventStart, 
                eventStartTime, 
                eventStopTime, 
                audplatformID, 
                audStepID, 
                parkingDetails, 
                workwithcoach, 
                trackmileage, 
                audlocid
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_eventtitle#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_eventdescription#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audTypeID#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audLocation#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_eventStart#">,
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStartTime#">,
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audStepID#">,
                <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_parkingDetails#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_workwithcoach#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_trackmileage#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audlocid#">
            )
        </cfquery>
     <cfreturn result.generatedKey>
</cffunction>
<cffunction output="false" name="SELevents_23803" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT DISTINCT 
                CONCAT(
                    DATE_FORMAT(e.eventstart, '%m/%d/%Y'), 
                    ": ", 
                    c.recordname, 
                    " - ", 
                    e.eventtitle
                ) AS col1
            FROM 
                events e 
            INNER JOIN 
                eventtypes_user t ON t.eventtypename = e.eventtypename 
            INNER JOIN 
                eventcontactsxref x ON x.eventID = e.eventid 
            INNER JOIN 
                contactdetails c ON c.contactid = x.contactid 
            WHERE 
                e.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND t.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND e.eventstart >= CURDATE()
        </cfquery>
        
        <cfreturn result>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="UPDevents_23860" access="public" returntype="void">
    <cfargument name="recid" type="numeric" required="true">
    
    
        <cfquery result="result" >
            UPDATE events 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24012" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    
    
    
        <cfquery name="result" >
            SELECT 
                p.audprojectID, 
                MIN(a.eventStart) AS new_projDate 
            FROM 
                events a 
            INNER JOIN 
                audroles r ON r.audroleid = a.audroleid 
            INNER JOIN 
                audprojects p ON p.audprojectid = r.audprojectid 
            WHERE 
                r.isDeleted <> 1 
                AND a.isdeleted <> 1 
                AND a.eventStart IS NOT NULL 
                AND r.isdeleted <> 1 
                AND p.isdeleted <> 1 
                AND a.eventStart >= CURDATE() 
                AND p.projdate IS NULL 
                AND p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            GROUP BY 
                p.audprojectID
        </cfquery>
        
        
            
            
        
    

    <cfreturn result>
</cffunction>
<cffunction output="false" name="SELevents_24014" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT 
                p.audprojectID, 
                MAX(a.eventStart) AS new_projDate 
            FROM 
                events a  
            INNER JOIN 
                audroles r ON r.audroleid = a.audroleid  
            INNER JOIN 
                audprojects p ON p.audprojectid = r.audprojectid  
            WHERE 
                r.isDeleted <> 1 
                AND a.isdeleted <> 1 
                AND a.eventStart IS NOT NULL 
                AND r.isdeleted <> 1 
                AND p.isdeleted <> 1  
                AND p.projdate IS NULL 
                AND p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">  
            GROUP BY 
                p.audprojectID
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="UPDevents_24018" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

        <cfquery result="result" name="updateQuery" >
            UPDATE events 
            SET isdeleted = 1 
            WHERE isdeleted = 0 
            AND eventStart IS NULL 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
</cffunction>
<cffunction output="false" name="INSevents_24096" access="public" returntype="numeric">
    <cfargument name="new_userid" type="numeric" required="yes">
    <cfargument name="new_audRoleID" type="numeric" required="yes">
    <cfargument name="new_audTypeID" type="numeric" required="yes">
    <cfargument name="new_audLocation" type="string" required="yes">
    <cfargument name="new_eventStart" type="date" required="yes">
    <cfargument name="new_eventStartTime" type="string" required="yes">
    <cfargument name="new_eventStopTime" type="string" required="yes">
    <cfargument name="new_audplatformid" type="numeric" required="yes">
    <cfargument name="new_audStepID" type="numeric" required="yes">
    <cfargument name="new_parkingDetails" type="string" required="no" default="">
    <cfargument name="new_workwithcoach" type="boolean" required="no" default="">
    <cfargument name="new_trackmileage" type="boolean" required="no" default="">
    <cfargument name="new_audlocid" type="numeric" required="yes">

    <!--- Local Variables for NULL Checks --->
    <cfset local.null_userid = NOT len(trim(arguments.new_userid))>
    <cfset local.null_audRoleID = NOT len(trim(arguments.new_audRoleID))>
    <cfset local.null_audTypeID = NOT len(trim(arguments.new_audTypeID))>
    <cfset local.null_audLocation = NOT len(trim(arguments.new_audLocation))>
    <cfset local.null_eventStart = NOT len(trim(arguments.new_eventStart))>
    <cfset local.null_eventStartTime = NOT len(trim(arguments.new_eventStartTime))>
    <cfset local.null_eventStopTime = NOT len(trim(arguments.new_eventStopTime))>
    <cfset local.null_audplatformid = NOT len(trim(arguments.new_audplatformid))>
    <cfset local.null_audStepID = NOT len(trim(arguments.new_audStepID))>
    <cfset local.null_parkingDetails = NOT len(trim(arguments.new_parkingDetails))>
    <cfset local.null_workwithcoach = NOT len(trim(arguments.new_workwithcoach))>
    <cfset local.null_trackmileage = NOT len(trim(arguments.new_trackmileage))>
    <cfset local.null_audlocid = NOT len(trim(arguments.new_audlocid))>

    <!--- Insert Query --->
    <cfquery result="result">
        INSERT INTO events_tbl (
            userid, audRoleID, audTypeID, audLocation, eventStart, eventStartTime, eventStopTime, 
            audplatformID, audStepID, parkingDetails, workwithcoach, trackmileage, audlocid, isdeleted
        ) VALUES (
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#local.null_userid#" />,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#local.null_audRoleID#" />,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audTypeID#" null="#local.null_audTypeID#" />,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audLocation#" maxlength="500" null="#local.null_audLocation#" />,
            <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_eventStart#" null="#local.null_eventStart#" />,
            <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStartTime#" null="#local.null_eventStartTime#" />,
            <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#" null="#local.null_eventStopTime#" />,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#" null="#local.null_audplatformid#" />,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audStepID#" null="#local.null_audStepID#" />,
            <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_parkingDetails#" null="#local.null_parkingDetails#" />,
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_workwithcoach#" null="#local.null_workwithcoach#" />,
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_trackmileage#" null="#local.null_trackmileage#" />,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audlocid#" null="#local.null_audlocid#" />,
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="1" />
        )
    </cfquery>

    <cfreturn result.generatedKey>
</cffunction>

<cffunction output="false" name="UPDevents_24104" access="public" returntype="void">
    <cfargument name="new_eventid" type="numeric" required="true">

        <cfquery result="result" >
            UPDATE events_tbl 
            SET isdeleted = 0 
            WHERE eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
</cffunction>
<cffunction output="false" name="SELevents_24105" access="public" returntype="query">
    <cfargument name="new_eventid" type="numeric" required="true">
    
    
    
        <cfquery name="result" >
            SELECT eventid, eventstart, eventstarttime, eventstoptime
            FROM events
            WHERE eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="UPDevents_24108" access="public" returntype="void">
    <cfargument name="eventId" type="numeric" required="true">
    <cfargument name="newEventStart" type="date" required="false" default="">
    <cfargument name="newEventStartTime" type="time" required="false" default="">
    <cfargument name="newEventStopTime" type="time" required="false" default="">

    <cfquery>
        UPDATE events
        SET 
            eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.eventId#">
            <cfif len(trim(arguments.newEventStart))>
                , eventstart = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.newEventStart#" null="#NOT len(trim(arguments.newEventStart))#">
            </cfif>
            <cfif len(trim(arguments.newEventStartTime))>
                , eventStartTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.newEventStartTime#" null="#NOT len(trim(arguments.newEventStartTime))#">
            </cfif>
            <cfif len(trim(arguments.newEventStopTime))>
                , eventstoptime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.newEventStopTime#" null="#NOT len(trim(arguments.newEventStopTime))#">
            </cfif>
        WHERE 
            eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.eventId#">
    </cfquery>
</cffunction>

<cffunction output="false" name="DETevents" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">

    
    
    
        <cfquery name="result" >
            SELECT *
            FROM events
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    

    <cfreturn result>
</cffunction>
<cffunction output="false" name="UPDevents_24118" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">

    
        <cfquery result="result" >
            UPDATE events
            SET isdeleted = 1
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        
            
            
        
    
</cffunction>
<cffunction output="false" name="UPDevents_24119" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">

    
        <cfquery result="result" name="updateQuery" >
            UPDATE events_tbl 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24123" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT eventid 
            FROM events 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="UPDevents_24124" access="public" returntype="void" >
    <cfargument name="new_eventid" type="numeric" required="true">

    
        <cfquery result="result" >
            UPDATE events_tbl 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24379" access="public" returntype="query">
    <cfargument name="eventtypename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT * FROM events 
            WHERE eventtypename = <cfqueryparam value="#arguments.eventtypename#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="DETevents_24487" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    
        <cfquery name="result" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle, 
                e.eventDescription, 
                e.eventLocation, 
                e.eventStatus, 
                e.eventCreation, 
                e.eventStart, 
                e.eventStop, 
                e.eventTypeName, 
                e.userid, 
                e.eventStartTime, 
                e.eventStopTime, 
                e.contactid, 
                e.dow, 
                e.endRecur
            FROM events e
            WHERE e.eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
</cffunction>
<cffunction output="false" name="DETevents_24492" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle, 
                e.eventDescription, 
                e.eventLocation, 
                e.eventStatus, 
                e.eventCreation, 
                e.eventStart, 
                e.eventStop, 
                e.eventTypeName, 
                e.userid, 
                e.eventStartTime, 
                e.eventStopTime, 
                e.contactid, 
                e.dow, 
                e.endRecur,
                e.eventstarttime,
                e.eventstoptime,
                TRUNCATE(HOUR(TIMEDIFF(e.eventStopTime, e.eventStartTime)), 2) + TRUNCATE(MINUTE(TIMEDIFF(e.eventStopTime, e.eventStartTime)), 2) / 60 AS new_durhours
            FROM events e
            WHERE e.eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="SELevents_24527" access="public" returntype="query">
    <cfargument name="new_eventid" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT 
                ad.eventLocation, 
                ad.audlocadd1, 
                ad.audlocadd2, 
                ad.audcity, 
                ad.region_id, 
                ad.audzip, 
                rg.regionname, 
                c.countryname 
            FROM 
                events ad 
            LEFT OUTER JOIN 
                regions rg ON rg.region_id = ad.region_id 
            LEFT OUTER JOIN 
                countries c ON rg.countryid = c.countryid 
            WHERE 
                ad.eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="INSevents_24528" access="public" returntype="numeric">
    <cfargument name="new_projname" type="string" required="true">
    <cfargument name="new_projDescription" type="string" required="true">
    <cfargument name="eventLocation" type="string" required="true">
    <cfargument name="eventStart" type="date" required="false" default="">
    <cfargument name="eventStartTime" type="string" required="false" default="">
    <cfargument name="eventStopTime" type="time" required="false" default="">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">

        <cfquery result="result">
            INSERT INTO events (
                eventTitle, 
                eventTypeName, 
                eventDescription, 
                eventLocation
                <cfif len(trim(arguments.eventStart))>
                    , eventStart
                </cfif>
                <cfif len(trim(arguments.eventStartTime))>
                    , eventStartTime
                </cfif>
                <cfif len(trim(arguments.eventStopTime))>
                    , eventStopTime
                </cfif>
                , userid, 
                eventid
            ) VALUES (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.new_projname#" />, 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="Audition" />, 
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.new_projDescription#" />, 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventLocation#" />
                <cfif len(trim(arguments.eventStart))>
                    , <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.eventStart#" />
                </cfif>
                <cfif len(trim(arguments.eventStartTime))>
                    , '#arguments.eventStartTime#'
                </cfif>
                <cfif len(trim(arguments.eventStopTime))>
                    , <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.eventStopTime#" />
                </cfif>
                , <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_eventid#" />
            )
        </cfquery>
<cfreturn result.generatedKey>

</cffunction>
<cffunction output="false" name="UPDevents_24530" access="public" returntype="void">
    <cfargument name="eventStartTime" type="string" required="true">
    
    <cfset var queryResult = "">
    
    
        <cfquery result="result" name="queryResult" >
            UPDATE events 
            SET eventstoptime = TIME((ADDTIME(TIME(eventstarttime), TIME('01:00:00'))) % (TIME('24:00:00')))
            WHERE eventstarttime = <cfqueryparam value="#arguments.eventStartTime#" cfsqltype="CF_SQL_TIME">
            AND eventstoptime IS NULL
        </cfquery>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="UPDevents_24540" access="public" returntype="void">
    <cfargument name="new_eventLocation" type="string" required="true">
    <cfargument name="new_audlocadd1" type="string" required="true">
    <cfargument name="new_audlocadd2" type="string" required="true">
    <cfargument name="new_audcity" type="string" required="true">
    <cfargument name="new_region_id" type="numeric" required="true">
    <cfargument name="new_audzip" type="string" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">

    
        <cfquery result="result" >
            UPDATE events 
            SET 
                eventLocation = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_eventLocation)#" maxlength="500" null="#NOT len(trim(arguments.new_eventLocation))#">,
                audlocadd1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd1)#" maxlength="500" null="#NOT len(trim(arguments.new_audlocadd1))#">,
                audlocadd2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd2)#" maxlength="500" null="#NOT len(trim(arguments.new_audlocadd2))#">,
                audcity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audcity)#" maxlength="500" null="#NOT len(trim(arguments.new_audcity))#">,
                region_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_region_id#" null="#NOT len(trim(arguments.new_region_id))#">,
                audzip = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audzip)#" maxlength="10" null="#NOT len(trim(arguments.new_audzip))#">
            WHERE 
                eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">
        </cfquery>
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24546" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">

    
    
    
        <cfquery name="result" >
            SELECT 
                a.eventid, 
                a.eventStart, 
                a.eventstarttime, 
                p.projname AS col2, 
                s.audsource AS col3, 
                t.audtype, 
                a.audlocation, 
                rt.audroletype AS col5, 
                st.audstep, 
                a.workwithcoach
            FROM events a
            LEFT JOIN audroles r ON r.audroleid = a.audroleid
            LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
            LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
            LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
            WHERE 
                a.isdeleted = 0 
                AND p.isdeleted = 0 
                AND r.isdeleted = 0 
                AND r.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="cf_sql_integer">
            ORDER BY a.eventStart
        </cfquery>
        
        <cfreturn result>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24547" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    
    
        <cfquery name="result" >
            SELECT 
                a.eventid, 
                p.projname AS col2, 
                s.audsource AS col3, 
                t.audtype, 
                a.audlocation, 
                rt.audroletype AS col5, 
                st.audstep, 
                a.workwithcoach
            FROM 
                events a
            LEFT JOIN audroles r ON r.audroleid = a.audroleid
            LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
            LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
            LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
            WHERE 
                a.isdeleted = 0 
                AND p.isdeleted = 0 
                AND r.isdeleted = 0 
                AND r.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="cf_sql_integer"> 
                AND a.audstepid <> 5
            ORDER BY 
                a.eventStart
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn result>
</cffunction>
<cffunction output="false" name="INSevents_24555" access="public" returntype="numeric">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_audTypeID" type="numeric" required="true">
    <cfargument name="new_audLocation" type="string" required="true">
    <cfargument name="new_eventStart" type="date" required="true">
    <cfargument name="new_eventStartTime" type="time" required="true">
    <cfargument name="new_eventStopTime" type="time" required="true">
    <cfargument name="new_audplatformid" type="numeric" required="true">
    <cfargument name="new_audStepID" type="numeric" required="true">
    <cfargument name="new_parkingDetails" type="string" required="true">
    <cfargument name="new_workwithcoach" type="boolean" required="true">
    <cfargument name="new_trackmileage" type="boolean" required="true">

        <cfquery result="result"  name="insertEventQuery">
            INSERT INTO events_tbl (
                userid, audRoleID, audTypeID, audLocation, eventStart, 
                eventStartTime, eventStopTime, audplatformID, audStepID, 
                parkingDetails, workwithcoach, trackmileage
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audTypeID#" null="#NOT len(trim(arguments.new_audTypeID))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audLocation#" maxlength="500" null="#NOT len(trim(arguments.new_audLocation))#">,
                <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_eventStart#" null="#NOT len(trim(arguments.new_eventStart))#">,
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStartTime#" null="#NOT len(trim(arguments.new_eventStartTime))#">,
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#" null="#NOT len(trim(arguments.new_eventStopTime))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#" null="#NOT len(trim(arguments.new_audplatformid))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audStepID#" null="#NOT len(trim(arguments.new_audStepID))#">,
                <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_parkingDetails#" null="#NOT len(trim(arguments.new_parkingDetails))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_workwithcoach#" null="#NOT len(trim(arguments.new_workwithcoach))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_trackmileage#" null="#NOT len(trim(arguments.new_trackmileage))#">
            )
        </cfquery>
<cfreturn result.generatedKey>
</cffunction>
<cffunction output="false" name="UPDevents_24556" access="public" returntype="void">
    <cfargument name="new_eventLocation" type="string" required="true">
    <cfargument name="new_audlocadd1" type="string" required="true">
    <cfargument name="new_audlocadd2" type="string" required="true">
    <cfargument name="new_audcity" type="string" required="true">
    <cfargument name="new_region_id" type="numeric" required="true">
    <cfargument name="new_audzip" type="string" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">

    
        <cfquery result="result" >
            UPDATE events
            SET eventLocation = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_eventLocation)#" maxlength="500" null="#NOT len(trim(arguments.new_eventLocation))#">,
                audlocadd1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd1)#" maxlength="500" null="#NOT len(trim(arguments.new_audlocadd1))#">,
                audlocadd2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd2)#" maxlength="500" null="#NOT len(trim(arguments.new_audlocadd2))#">,
                audcity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audcity)#" maxlength="500" null="#NOT len(trim(arguments.new_audcity))#">,
                region_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_region_id#" null="#NOT len(trim(arguments.new_region_id))#">,
                audzip = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audzip)#" maxlength="10" null="#NOT len(trim(arguments.new_audzip))#">
            WHERE eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">
        </cfquery>
     
</cffunction>
<cffunction output="false" name="UPDevents_24557" access="public" returntype="void">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_audTypeID" type="numeric" required="true">
    <cfargument name="new_audBookTypeID" type="numeric" required="true">
    <cfargument name="new_audLocation" type="string" required="true">
    <cfargument name="new_eventLocation" type="string" required="true">
    <cfargument name="new_audlocadd1" type="string" required="true">
    <cfargument name="new_audlocadd2" type="string" required="true">
    <cfargument name="new_audcity" type="string" required="true">
    <cfargument name="new_region_id" type="numeric" required="true">
    <cfargument name="new_audzip" type="string" required="true">
    <cfargument name="new_eventStart" type="date" required="true">
    <cfargument name="new_eventStartTime" type="time" required="true">
    <cfargument name="new_eventStopTime" type="time" required="true">
    <cfargument name="new_audplatformid" type="numeric" required="false" default="0">
    <cfargument name="new_audStepID" type="numeric" required="true">
    <cfargument name="new_parkingDetails" type="string" required="false">
    <cfargument name="new_workwithcoach" type="boolean" required="false">
    <cfargument name="new_trackmileage" type="boolean" required="false">
    <cfargument name="new_callbacktypeid" type="numeric" required="false">
    <cfargument name="new_isDeleted" type="boolean" required="false">
    <cfargument name="new_eventid" type="numeric" required="true">

    <cfquery result="result">
        UPDATE events_tbl
        SET
            userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#">,
            audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#">,
            audTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audTypeID#">,
            audBookTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audBookTypeID#">,
            audLocation = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audLocation)#" maxlength="500">,
            eventLocation = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_eventLocation)#" maxlength="500">,
            audlocadd1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd1)#" maxlength="500">,
            audlocadd2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd2)#" maxlength="500">,
            audcity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audcity)#" maxlength="500">,
            region_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_region_id#">,
            audzip = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audzip)#" maxlength="10">,
            eventStart = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_eventStart#">,
            eventStartTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStartTime#">,
            eventStopTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#">,
            audplatformID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#">,
            audStepID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audStepID#">,
            parkingDetails = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_parkingDetails)#" null="#NOT len(trim(arguments.new_parkingDetails))#">
        WHERE 
            eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">
    </cfquery>
</cffunction>
<cffunction output="false" name="UPDevents_24558" access="public" returntype="void">
    <cfargument name="new_eventid" type="numeric" required="true">
    <cfargument name="eventStart" type="date" required="false" default="">
    <cfargument name="eventStartTime" type="string" required="false" default="">
    <cfargument name="eventStopTime" type="string" required="false" default="">

    <cfquery>
        UPDATE events
        SET eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">
        <cfif len(arguments.eventStart)>
            , eventstart = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.eventStart#">
        </cfif>
        <cfif len(arguments.eventStartTime)>
            , eventStartTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.eventStartTime#">
        </cfif>
        <cfif len(arguments.eventStopTime)>
            , eventStopTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.eventStopTime#">
        </cfif>
        WHERE eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">
    </cfquery>
</cffunction>

<cffunction output="false" name="SELevents_24597" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="focusid" type="numeric" default="0">

    
    
    
        <cfquery name="result" >
            SELECT 
                a.eventid, 
                a.eventStart, 
                a.eventStartTime, 
                s.audstep 
            FROM 
                events a 
            INNER JOIN 
                audsteps s ON s.audstepid = a.audstepid 
            WHERE 
                a.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
                <cfif arguments.focusid neq 0>
                    AND a.eventid = <cfqueryparam value="#arguments.focusid#" cfsqltype="CF_SQL_INTEGER">
                </cfif>
                AND a.isdeleted IS FALSE 
            ORDER BY 
                a.eventStart DESC
        </cfquery>
        
        <cfreturn result>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24618" access="public" returntype="query">
    <cfargument name="sessionUserId" type="numeric" required="true">
    <cfargument name="currentId" type="numeric" required="false">
    
    

        <cfquery name="result" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle AS col1, 
                e.eventDescription, 
                e.eventLocation AS col2, 
                e.eventStatus AS col4, 
                e.eventCreation, 
                e.eventStart AS col3, 
                e.eventStop, 
                e.eventTypeName AS col5, 
                'Appointment' AS head1, 
                'Location' AS head2, 
                'Date' AS head3, 
                'Status' AS head4, 
                'Type' AS head5, 
                e.userid, 
                e.eventStartTime, 
                e.eventStopTime, 
                t.eventtypecolor, 
                e.dow, 
                e.endRecur, 
                t.id
            FROM events e
            INNER JOIN eventtypes_user t ON t.eventtypename = e.eventtypename
            WHERE e.userid = <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER">
            AND t.userid = <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER">
            <cfif structKeyExists(arguments, "currentId")>
                AND e.eventid IN (
                    SELECT eventid FROM eventcontactsxref WHERE contactid = <cfqueryparam value="#arguments.currentId#" cfsqltype="CF_SQL_INTEGER">
                )
            </cfif>
        </cfquery>
        
        <cfreturn result>
        
</cffunction>
<cffunction output="false" name="SELevents_24659" access="public" returntype="query">
    <cfargument name="sessionUserID" type="numeric" required="true">
    <cfargument name="currentID" type="numeric" required="false">

    <cfset var queryResult = "">
    
    
        <cfquery result="result" name="queryResult" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle AS col1, 
                e.eventDescription, 
                e.eventLocation AS col2, 
                e.eventStatus AS col4, 
                e.eventCreation, 
                e.eventStart AS col3, 
                e.eventStop, 
                e.eventTypeName AS col5, 
                'Appointment' AS head1, 
                'Location' AS head2, 
                'Date' AS head3, 
                'Status' AS head4, 
                'Type' AS head5, 
                e.userid, 
                e.eventStartTime, 
                e.eventStopTime, 
                t.eventtypecolor, 
                e.dow, 
                e.endRecur, 
                t.id, 
                e.eventid, 
                r.audprojectid
            FROM events e
            INNER JOIN eventtypes_user t ON t.eventtypename = e.eventtypename
            LEFT JOIN events a ON e.eventid = a.eventid
            LEFT JOIN audroles r ON r.audroleid = a.audroleid
            WHERE e.userid = <cfqueryparam value="#arguments.sessionUserID#" cfsqltype="CF_SQL_INTEGER">
            AND t.userid = <cfqueryparam value="#arguments.sessionUserID#" cfsqltype="CF_SQL_INTEGER">
            <cfif structKeyExists(arguments, "currentID")>
                AND e.eventid IN (
                    SELECT eventid FROM eventcontactsxref WHERE contactid = <cfqueryparam value="#arguments.currentID#" cfsqltype="CF_SQL_INTEGER">
                )
            </cfif>
        </cfquery>

        
            
            
        
    

    <cfreturn queryResult>
</cffunction>
<cffunction output="false" name="RESevents_24660" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="currentID" type="numeric" required="false">
    
    <cfset var queryResult = "">
    
    
        <cfquery result="result" name="queryResult" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle AS col1, 
                e.eventDescription, 
                e.eventLocation AS col2, 
                e.eventStatus AS col4, 
                e.eventCreation, 
                e.eventStart AS col3, 
                e.eventStop, 
                e.eventTypeName AS col5, 
                'Appointment' AS head1, 
                'Location' AS head2, 
                'Date' AS head3, 
                'Status' AS head4, 
                'Type' AS head5, 
                e.userid, 
                e.eventStartTime, 
                e.eventStopTime, 
                t.eventtypecolor, 
                e.eventid, 
                r.audprojectid, 
                s.audstep
            FROM events e
            INNER JOIN eventtypes_user t ON t.eventtypename = e.eventtypename
            LEFT JOIN events a ON e.eventid = a.eventid
            LEFT JOIN audroles r ON r.audroleid = a.audroleid
            LEFT JOIN audsteps s ON s.audstepid = a.audstepid
            WHERE e.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            AND t.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfif structKeyExists(arguments, "currentID")>
                AND e.eventid IN (
                    SELECT eventid FROM eventcontactsxref WHERE contactid = <cfqueryparam value="#arguments.currentID#" cfsqltype="CF_SQL_INTEGER">
                )
            </cfif>
            ORDER BY e.eventstart DESC
        </cfquery>
        
        
            
            
        
    
    
    <cfreturn queryResult>
</cffunction>
<cffunction output="false" name="DETevents_24675" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    
        <cfquery name="result" >
            SELECT 
                e.eventlocation AS same_eventLocation, 
                e.audlocadd1 AS same_audlocadd1, 
                e.audlocadd2 AS same_audlocadd2, 
                e.audcity AS same_audcity, 
                IFNULL(e.region_id, 3911) AS same_region_id, 
                IFNULL(c.countryid, 'US') AS same_countryid, 
                e.audzip AS same_audzip
            FROM 
                EVENTS e
            INNER JOIN 
                audroles a ON a.audroleid = e.audroleid
            LEFT JOIN 
                regions r ON e.region_id = r.region_id
            LEFT JOIN 
                countries c ON c.countryid = r.countryid
            WHERE 
                a.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER"> 
                AND e.eventlocation IS NOT NULL
            ORDER BY 
                e.eventid
        </cfquery>
        
        <cfreturn result>
        
</cffunction>
<cffunction output="false" name="SELevents_24686" access="public" returntype="query">
    <cfargument name="sessionUserId" type="numeric" required="true">
    <cfargument name="contactId" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle, 
                e.eventStart, 
                e.eventStartTime 
            FROM 
                events e 
            INNER JOIN 
                eventtypes_user t ON t.eventtypename = e.eventtypename 
            WHERE 
                e.userid = <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER"> 
                AND t.userid = <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER"> 
                AND e.eventid IN (
                    SELECT eventid FROM eventcontactsxref WHERE contactid = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER">
                )
        </cfquery>
        
        <cfreturn result>
        
        
            
            
        
    
</cffunction>
<cffunction output="false" name="SELevents_24695" access="public" returntype="query">
    <cfargument name="sessionUserID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    
    
    
    
        <cfquery name="result" >
            SELECT 
                e.eventID, 
                e.eventID AS recid, 
                e.eventTitle, 
                e.eventStart, 
                e.eventStartTime 
            FROM 
                events e 
            INNER JOIN 
                eventtypes_user t ON t.eventtypename = e.eventtypename 
            WHERE 
                e.userid = <cfqueryparam value="#arguments.sessionUserID#" cfsqltype="CF_SQL_INTEGER"> 
                AND t.userid = <cfqueryparam value="#arguments.sessionUserID#" cfsqltype="CF_SQL_INTEGER"> 
                AND e.eventid IN (
                    SELECT eventid FROM eventcontactsxref WHERE contactid = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
                )
        </cfquery>
        
        
            
            
        
    

    <cfreturn result>
</cffunction>
</cfcomponent>
