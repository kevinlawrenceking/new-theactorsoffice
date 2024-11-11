<cfcomponent displayname="EventService" hint="Handles operations for Event table" output="false"> 
<cffunction name="INSevents" access="public" returntype="void">
    <cfargument name="eventTitle" type="string" required="true">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="eventDescription" type="string" required="true">
    <cfargument name="eventLocation" type="string" required="true">
    <cfargument name="eventStart" type="date" required="false" default="">
    <cfargument name="eventStartTime" type="time" required="false" default="">
    <cfargument name="new_eventStopTime" type="time" required="false" default="">
    <cfargument name="dow" type="string" required="false" default="">
    <cfargument name="endRecur" type="date" required="false" default="">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var sql = "INSERT INTO events_tbl (eventTitle, eventTypeName, eventDescription, eventLocation">
    <cfset var values = "VALUES (?, ?, ?, ?">
    
    <!--- Add optional fields dynamically --->
    <cfif arguments.eventStart neq "">
        <cfset sql &= ", eventStart">
        <cfset values &= ", ?">
    </cfif>
    
    <cfif arguments.eventStartTime neq "">
        <cfset sql &= ", eventStartTime">
        <cfset values &= ", ?">
    </cfif>
    
    <cfif arguments.new_eventStopTime neq "">
        <cfset sql &= ", eventStopTime">
        <cfset values &= ", ?">
    </cfif>
    
    <cfif arguments.dow neq "">
        <cfset sql &= ", dow">
        <cfset values &= ", ?">
    </cfif>
    
    <cfif arguments.endRecur neq "" and arguments.dow neq "">
        <cfset sql &= ", endRecur">
        <cfset values &= ", ?">
    </cfif>

    <!--- Close the SQL statement --->
    <cfset sql &= ", userid) ">
    <cfset values &= ", ?)">

    <!--- Combine SQL and values --->
    <cfset sql &= values>

    <!--- Execute the query --->
    <cftry>
        <cfquery datasource="#application.datasource#" name="insertEventQuery">
            #sql#
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.eventTitle#"/>
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.eventTypeName#"/>
            <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.eventDescription#"/>
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.eventLocation#"/>
            
            <!--- Bind optional parameters --->
            <cfif arguments.eventStart neq "">
                <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.eventStart#"/>
            </cfif>
            
            <cfif arguments.eventStartTime neq "">
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.eventStartTime#"/>
            </cfif>
            
            <cfif arguments.new_eventStopTime neq "">
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#"/>
            </cfif>
            
            <cfif arguments.dow neq "">
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.dow#"/>
            </cfif>
            
            <cfif arguments.endRecur neq "" and arguments.dow neq "">
                <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.endRecur#"/>
            </cfif>

            <!--- Required parameter --->
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#"/>
        </cfquery>

        <!--- Error handling --->
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="applicationLog"
                   text="[insertEvent] Error: #cfcatch.message#, SQL: #sql#, Arguments: #serializeJSON(arguments)#"
                   type="error">

            <!--- Rethrow the error to be handled by calling code if necessary --->
            <rethrow/>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents" access="public" returntype="void">
    <cfargument name="newStartTime" type="string" required="true">
    
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            UPDATE events 
            SET eventstarttime = <cfqueryparam value="#arguments.newStartTime#" cfsqltype="CF_SQL_TIME">
            WHERE eventstarttime IS NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating event start time: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the event start time." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_23725" access="public" returntype="void">
    <cfargument name="eventStartTime" type="date" required="true">
    
    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE events 
            SET eventstoptime = TIME( (ADDTIME(TIME(eventstarttime), TIME('01:00:00'))) % (TIME('24:00:00')))
            WHERE eventstarttime = <cfqueryparam value="#arguments.eventStartTime#" cfsqltype="CF_SQL_TIME">
            AND eventstoptime IS NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating event stop time: #cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_23726" access="public" returntype="void">
    <cfargument name="eventStart" type="date" required="true">
    
    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE events 
            SET eventstop = <cfqueryparam value="#arguments.eventStart#" cfsqltype="CF_SQL_TIMESTAMP">
            WHERE eventstop IS NULL 
            AND eventstart IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating eventstop: #cfcatch.message#; SQL: #cfcatch.Sql#; Data: #arguments.eventStart#">
            <cfthrow message="Error updating eventstop" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_23731" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE events_tbl 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating event: #cfcatch.message#; Event ID: #arguments.eventid#" type="error"/>
            <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#"/>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_23733" access="public" returntype="void">
    <cfargument name="eventTitle" type="string" required="true">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="eventDescription" type="string" required="true">
    <cfargument name="eventLocation" type="string" required="true">
    <cfargument name="eventStart" type="date" required="false" default="">
    <cfargument name="eventStartTime" type="string" required="false" default="">
    <cfargument name="dow" type="string" required="false" default="">
    <cfargument name="eventStopTime" type="time" required="false" default="">
    <cfargument name="endRecur" type="date" required="false" default="">
    <cfargument name="eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="#application.datasource#">
            UPDATE events 
            SET 
                eventTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventTitle#" />,
                eventTypeName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventTypeName#" />,
                eventDescription = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventDescription#" />,
                eventLocation = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.eventLocation#" />
                <cfif arguments.eventStart neq "">,
                    eventStart = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.eventStart#" />,
                    eventStop = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.eventStart#" />
                </cfif>
                <cfif arguments.eventStartTime neq "">,
                    eventStartTime = '#arguments.eventStartTime#'
                </cfif>
                <cfif arguments.dow neq "">,
                    dow = '#arguments.dow#'
                <cfelse>,
                    dow = NULL
                </cfif>
                <cfif arguments.eventStopTime neq "">,
                    eventStopTime = <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.eventStopTime#" />
                </cfif>
                <cfif arguments.endRecur neq "" and arguments.dow neq "">,
                    endRecur = dateAdd('d', 1, arguments.endRecur),
                    endRecur = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.endRecur#" />
                <cfelse>,
                    endRecur = NULL
                </cfif>
            WHERE 
                eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
        </cfquery>
    <cfcatch>
        <cflog file="application_errors.log"
               text="[Error] Failed to update event. Event ID: #arguments.eventid#. Error: #cfcatch.message#"
               type="error">
        <!--- Handle error gracefully --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="RESevents" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="eventid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredEvents: #cfcatch.message#">
            <cfset result = queryNew("recid,head1,head2,head3,head4,head5,audstepid,col1,col2,col3,col4,col5,audstep")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDevents_23762" access="public" returntype="void">
    <cfargument name="eventTitle" type="string" required="true">
    <cfargument name="projName" type="string" required="true">

    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE events_tbl e
            INNER JOIN audroles r ON r.audroleid = e.audroleid
            INNER JOIN audprojects p ON p.audprojectid = r.audprojectid
            SET e.eventtitle = <cfqueryparam value="#arguments.projName#" cfsqltype="CF_SQL_VARCHAR">,
                e.eventdescription = LEFT(REPLACE(REPLACE(p.projDescription, CHAR(13), ''), CHAR(10), ''), 5000)
            WHERE e.eventtitle != <cfqueryparam value="#arguments.projName#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating event titles: #cfcatch.message#">
            <cfthrow message="An error occurred while updating event titles." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("contactid, contactfullname, userid, eventStart")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_23785" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM events
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            AND audstepid = <cfqueryparam value="2" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEvents: #cfcatch.message# Query: SELECT * FROM events WHERE audroleid = ? AND isdeleted = 0 AND audstepid = 2 Parameters: #arguments.audroleid#">
            <cfset result = queryNew("","")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELevents_23786" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM events 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT"> 
            AND audstepid = <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getEvents: #cfcatch.message#; Query: SELECT * FROM events WHERE audroleid = ?, isdeleted = 0, audstepid = 3; Parameters: audroleid=#arguments.audroleid#">
            <cfset result = queryNew("","")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELevents_23787" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM events
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            AND audstepid = <cfqueryparam value="4" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEvents: #cfcatch.message# - Query: SELECT * FROM events WHERE audroleid = ?, isdeleted = 0, audstepid = 4">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELevents_23788" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM events 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT"> 
            AND audstepid = <cfqueryparam value="5" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEvents: #cfcatch.message# Query: SELECT * FROM events WHERE audroleid = #arguments.audroleid# AND isdeleted = 0 AND audstepid = 5">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELevents_23789" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM events e 
            INNER JOIN audroles r ON r.audroleid = e.audroleid 
            WHERE r.audprojectid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.audprojectid#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventsByProject: #cfcatch.message#" type="error">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSevents_23790" access="public" returntype="void">
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

    <cftry>
        <cfquery datasource="#abod#" name="insertEventQuery">
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
        <cfcatch>
            <cflog file="/path/to/logfile.log"
                   text="[insertEvent] Error: #cfcatch.message#, Detail: #cfcatch.detail#, Query: INSERT INTO events_tbl ... with parameters: #serializeJSON(arguments)#"
                   type = "error"/>
            <!--- Optionally rethrow or handle the error further --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_23803" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getDistinctEventDetails: #cfcatch.message#">
            <cfreturn queryNew("col1")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_23860" access="public" returntype="void">
    <cfargument name="recid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE events 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating event isdeleted status: #cfcatch.message# Query: UPDATE events SET isdeleted = 1 WHERE eventid = #arguments.recid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24012" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getProjectDates: #cfcatch.message#">
            <cfset result = queryNew("audprojectID,new_projDate", "integer,date")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELevents_24014" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUpdatedProjectDates: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving project dates." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDevents_24018" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE events 
            SET isdeleted = 1 
            WHERE isdeleted = 0 
            AND eventStart IS NULL 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating events: #cfcatch.message# Query: #cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSevents_24096" access="public" returntype="void">
    <cfargument name="new_userid" type="numeric" required="yes">
    <cfargument name="new_audRoleID" type="numeric" required="yes">
    <cfargument name="new_audTypeID" type="numeric" required="yes">
    <cfargument name="new_audLocation" type="string" required="yes">
    <cfargument name="new_eventStart" type="date" required="yes">
    <cfargument name="new_eventStartTime" type="string" required="yes">
    <cfargument name="new_eventStopTime" type="string" required="yes">
    <cfargument name="new_audplatformid" type="numeric" required="yes">
    <cfargument name="new_audStepID" type="numeric" required="yes">
    <cfargument name="new_parkingDetails" type="string" required="no">
    <cfargument name="new_workwithcoach" type="boolean" required="no">
    <cfargument name="new_trackmileage" type="boolean" required="no">
    <cfargument name="new_audlocid" type="numeric" required="yes">

    <cftry>
        <cfquery datasource="#application.datasource#">
            INSERT INTO events_tbl (
                userid, audRoleID, audTypeID, audLocation, eventStart, eventStartTime, eventStopTime, 
                audplatformID, audStepID, parkingDetails, workwithcoach, trackmileage, audlocid, isdeleted
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#" />,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#" />,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audTypeID#" null="#NOT len(trim(arguments.new_audTypeID))#" />,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audLocation#" maxlength="500" null="#NOT len(trim(arguments.new_audLocation))#" />,
                <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_eventStart#" null="#NOT len(trim(arguments.new_eventStart))#" />,
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStartTime#" null="#NOT len(trim(arguments.new_eventStartTime))#" />,
                <cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.new_eventStopTime#" null="#NOT len(trim(arguments.new_eventStopTime))#" />,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audplatformid#" null="#NOT len(trim(arguments.new_audplatformid))#" />,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audStepID#" null="#NOT len(trim(arguments.new_audStepID))#" />,
                <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_parkingDetails#" null="#NOT len(trim(arguments.new_parkingDetails))#" />,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_workwithcoach#" null="#NOT len(trim(arguments.new_workwithcoach))#" />,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_trackmileage#" null="#NOT len(trim(arguments.new_trackmileage))#" />,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audlocid#" null="#NOT len(trim(arguments.new_audlocid))#" />,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value=1 />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application_errors.log"
                   text="[insertEvent] Error: #cfcatch.message#; Details: #serializeJSON(cfcatch)#"
                   type="error">
            <!--- Handle error appropriately --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_24104" access="public" returntype="void">
    <cfargument name="new_eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE events_tbl 
            SET isdeleted = 0 
            WHERE eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating event: #cfcatch.message# Query: UPDATE events_tbl SET isdeleted = 0 WHERE eventid = #arguments.new_eventid#">
            <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24105" access="public" returntype="query">
    <cfargument name="new_eventid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT eventid, eventstart, eventstarttime, eventstoptime
            FROM events
            WHERE eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getEventDetails: #cfcatch.message# - Query: SELECT eventid, eventstart, eventstarttime, eventstoptime FROM events WHERE eventid = #arguments.new_eventid#">
            <cfset result = queryNew("eventid,eventstart,eventstarttime,eventstoptime", "integer,date,time,time")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDevents_24108" access="public" returntype="void">
    <cfargument name="eventId" type="numeric" required="true">
    <cfargument name="newEventStart" type="string" required="false" default="">
    <cfargument name="newEventStartTime" type="string" required="false" default="">
    <cfargument name="newEventStopTime" type="string" required="false" default="">
    
    <cfset var sql = "">
    <cfset var params = []>
    
    <cfset sql = "UPDATE events SET eventid = ?">
    <cfset arrayAppend(params, {value=arguments.eventId, cfsqltype="CF_SQL_INTEGER"})>
    
    <cfif len(trim(arguments.newEventStart))>
        <cfset sql &= ", eventstart = ?">
        <cfset arrayAppend(params, {value=arguments.newEventStart, cfsqltype="CF_SQL_DATE"})>
    </cfif>
    
    <cfif len(trim(arguments.newEventStartTime))>
        <cfset sql &= ", eventStartTime = ?">
        <cfset arrayAppend(params, {value=arguments.newEventStartTime, cfsqltype="CF_SQL_TIME"})>
    </cfif>
    
    <cfif len(trim(arguments.newEventStopTime))>
        <cfset sql &= ", eventstoptime = ?">
        <cfset arrayAppend(params, {value=arguments.newEventStopTime, cfsqltype="CF_SQL_TIME"})>
    </cfif>
    
    <cfset sql &= " WHERE eventid = ?">
    <cfset arrayAppend(params, {value=arguments.eventId, cfsqltype="CF_SQL_INTEGER"})>

    <cftry>
        <cfquery datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating event: #cfcatch.message# Query: #sql# Parameters: #serializeJSON(params)#">
            <cfthrow message="Error updating event." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETevents" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM events
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventById: #cfcatch.message# Query: SELECT * FROM events WHERE eventid = #arguments.eventid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDevents_24118" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE events
            SET isdeleted = 1
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error updating event: #cfcatch.message# Query: UPDATE events SET isdeleted = 1 WHERE eventid = #arguments.eventid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_24119" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">

    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE events_tbl 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating event isdeleted status. Event ID: #arguments.eventid#. Error: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24123" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT eventid 
            FROM events 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventIdsByAudRoleId: #cfcatch.message#">
            <cfset result = queryNew("eventid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDevents_24124" access="public" returntype="void" output="false">
    <cfargument name="new_eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE events_tbl 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating event: #cfcatch.message# Query: UPDATE events_tbl SET isdeleted = 1 WHERE eventid = #arguments.new_eventid#">
            <cfthrow message="An error occurred while updating the event." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24379" access="public" returntype="query">
    <cfargument name="eventtypename" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * FROM events 
            WHERE eventtypename = <cfqueryparam value="#arguments.eventtypename#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEvents: #cfcatch.message# Query: SELECT * FROM events WHERE eventtypename = ? AND userid = ? Parameters: #arguments.eventtypename#, #arguments.userid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETevents_24487" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventById: #cfcatch.message# Query: SELECT ... WHERE eventid = #arguments.eventid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETevents_24492" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
                TRUNCATE(HOUR(TIMEDIFF(e.eventStopTime, e.eventStartTime)), 2) + TRUNCATE(MINUTE(TIMEDIFF(e.eventStopTime, e.eventStartTime)), 2) / 60 AS new_durhours
            FROM events e
            WHERE e.eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELevents_24527" access="public" returntype="query">
    <cfargument name="new_eventid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSevents_24528" access="public" returntype="void">
    <cfargument name="new_projname" type="string" required="true">
    <cfargument name="new_projDescription" type="string" required="true">
    <cfargument name="eventLocation" type="string" required="true">
    <cfargument name="eventStart" type="date" required="false" default="">
    <cfargument name="eventStartTime" type="string" required="false" default="">
    <cfargument name="eventStopTime" type="time" required="false" default="">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="#application.datasource#">
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
        <cflog file="application.log" text="Event inserted successfully." type="information">
    <cfcatch type="any">
        <cflog file="application.log" text="#cfcatch.message#" type="error">
        <!--- Handle error appropriately --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_24530" access="public" returntype="void">
    <cfargument name="eventStartTime" type="string" required="true">
    
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            UPDATE events 
            SET eventstoptime = TIME((ADDTIME(TIME(eventstarttime), TIME('01:00:00'))) % (TIME('24:00:00')))
            WHERE eventstarttime = <cfqueryparam value="#arguments.eventStartTime#" cfsqltype="CF_SQL_TIME">
            AND eventstoptime IS NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating event stop time: #cfcatch.message#">
            <cflog file="application" text="Query: #cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_24540" access="public" returntype="void">
    <cfargument name="new_eventLocation" type="string" required="true">
    <cfargument name="new_audlocadd1" type="string" required="true">
    <cfargument name="new_audlocadd2" type="string" required="true">
    <cfargument name="new_audcity" type="string" required="true">
    <cfargument name="new_region_id" type="numeric" required="true">
    <cfargument name="new_audzip" type="string" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
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
        <cfcatch type="any">
            <cflog file="application" text="Error updating event location: #cfcatch.message#" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24546" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("eventid,eventStart,eventstarttime,col2,col3,audtype,audlocation,col5,audstep,workwithcoach")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24547" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSevents_24555" access="public" returntype="void">
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

    <cftry>
        <cfquery datasource="#abod#" name="insertEventQuery">
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
        <cfcatch>
            <cflog file="applicationLogFileName"
                   text="[insertEvent] Error: #cfcatch.message#, Detail: #cfcatch.detail#, Query: #insertEventQuery.sql#, Parameters: #serializeJSON(arguments)#"
                   type="error">
            <!--- Handle error appropriately --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_24556" access="public" returntype="void">
    <cfargument name="new_eventLocation" type="string" required="true">
    <cfargument name="new_audlocadd1" type="string" required="true">
    <cfargument name="new_audlocadd2" type="string" required="true">
    <cfargument name="new_audcity" type="string" required="true">
    <cfargument name="new_region_id" type="numeric" required="true">
    <cfargument name="new_audzip" type="string" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE events
            SET eventLocation = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_eventLocation)#" maxlength="500" null="#NOT len(trim(arguments.new_eventLocation))#">,
                audlocadd1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd1)#" maxlength="500" null="#NOT len(trim(arguments.new_audlocadd1))#">,
                audlocadd2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audlocadd2)#" maxlength="500" null="#NOT len(trim(arguments.new_audlocadd2))#">,
                audcity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audcity)#" maxlength="500" null="#NOT len(trim(arguments.new_audcity))#">,
                region_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_region_id#" null="#NOT len(trim(arguments.new_region_id))#">,
                audzip = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audzip)#" maxlength="10" null="#NOT len(trim(arguments.new_audzip))#">
            WHERE eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating event location: #cfcatch.message#" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDevents_24557" access="public" returntype="void">
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
    <cfargument name="new_audplatformid" type="numeric" required="true">
    <cfargument name="new_audStepID" type="numeric" required="true">
    <cfargument name="new_parkingDetails" type="string" required="false">
    <cfargument name="new_workwithcoach" type="boolean" required="false">
    <cfargument name="new_trackmileage" type="boolean" required="false">
    <cfargument name="new_callbacktypeid" type="numeric" required="false">
    <cfargument name="new_isDeleted" type="boolean" required="false">
    <cfargument name="new_eventid" type="numeric" required=true>

        <cfquery datasource="#application.datasource#">
            UPDATE events_tbl 
            SET 
                userid = <cfqueryparam cfsqltype="#getSQLType(arguments.new_userid)#"
                                      value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#" />,
                audRoleID = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audRoleID)#"
                                         value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#" />,
                audTypeID = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audTypeID)#"
                                         value="#arguments.new_audTypeID#" null="#NOT len(trim(arguments.new_audTypeID))#" />,
                audBookTypeID = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audBookTypeID)#"
                                             value="#arguments.new_audBookTypeID#" null="#NOT len(trim(arguments.new_audBookTypeID))#" />,
                audLocation = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audLocation)#"
                                            value="#arguments.new_audLocation#" maxlength=500 null="#NOT len(trim(arguments.new_audLocation))#" />,
                eventLocation = <cfqueryparam cfsqltype="#getSQLType(arguments.new_eventLocation)#"
                                              value="#arguments.new_eventLocation#" maxlength=500 null="#NOT len(trim(arguments.new_eventLocation))#" />,
                audlocadd1 = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audlocadd1)#"
                                               value="#arguments.new_audlocadd1#" maxlength=500 null="#NOT len(trim(arguments.new_audlocadd1))#" />,
                audlocadd2 = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audlocadd2)#"
                                               value="#arguments.new_audlocadd2#" maxlength=500 null="#NOT len(trim(arguments.new_audlocadd2))#" />,
                audcity = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audcity)#"
                                            value="#arguments.new_audcity#" maxlength=500 null="#NOT len(trim(arguments.new_audcity))#" />,
                region_id = <cfqueryparam cfsqltype="#getSQLType(arguments.new_region_id)#"
                                          value="#arguments.new_region_id#" null="#NOT len(trim(arguments.new_region_id))#" />,
                audzip = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audzip)#"
                                            value="#arguments.new_audzip#" maxlength=10 null="#NOT len(trim(arguments.new_audzip))#" />,
                eventStart = <cfqueryparam cfsqltype="#getSQLType(arguments.new_eventStart)#"
                                           value="#arguments.new_eventStart#" null="#NOT len(trim(arguments.new_eventStart))#" />,
                eventStartTime = <cfqueryparam cfsqltype="#getSQLType(arguments.new_eventStartTime)#"
                                                value="#arguments.new_eventStartTime#" null="#NOT len(trim(arguments.new_eventStartTime))#" />,
                eventStopTime = <cfqueryparam cfsqltype="#getSQLType(arguments.new_eventStopTime)#"
                                                value="#arguments.new_eventStopTime#" null="#NOT len(trim(arguments.new_eventStopTime))#" />,
                audplatformID = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audplatformid)#"
                                                value="#arguments.new_audplatformid#" null="#NOT len(trim(arguments.new_audplatformid))#" />,
                audStepID = <cfqueryparam cfsqltype="#getSQLType(arguments.new_audStepID)#"
                                                value="#arguments.new_audStepID#" null="#NOT len(trim(arguments.new_audStepID))#" />,
                parkingDetails = <cfqueryparam cfsqltype="<cfdump var='#getSQLType(new_parkingDetails)#'>CF_SQL_LONGVARCHAR</cfdump>"
                                                 value="<cfdump var='#trim(new_parkingDetails)#'>#trim(new_parkingDetails)#</cfdump>" null="<cfdump var='#not(len(new_parkingDetails))#'>#not(len(new_parkingDetails))#</cfdump>" />
            WHERE 
                eventid = ? 
        </cfquery>
        </cffunction>
<cffunction name="UPDevents_24558" access="public" returntype="void">
    <cfargument name="new_eventid" type="numeric" required="true">
    <cfargument name="eventStart" type="date" required="false" default="">
    <cfargument name="eventStartTime" type="string" required="false" default="">
    <cfargument name="eventStopTime" type="string" required="false" default="">
    
    <cfset var sql = "">
    <cfset var params = []>
    
    <cftry>
        <cfset sql = "UPDATE events SET eventid = ?">
        <cfset arrayAppend(params, {value=arguments.new_eventid, cfsqltype="CF_SQL_INTEGER"})>
        
        <cfif len(arguments.eventStart)>
            <cfset sql &= ", eventstart = ?">
            <cfset arrayAppend(params, {value=arguments.eventStart, cfsqltype="CF_SQL_DATE"})>
        </cfif>
        
        <cfif len(arguments.eventStartTime)>
            <cfset sql &= ", eventStartTime = ?">
            <cfset arrayAppend(params, {value=arguments.eventStartTime, cfsqltype="CF_SQL_TIME"})>
        </cfif>
        
        <cfif len(arguments.eventStopTime)>
            <cfset sql &= ", eventStopTime = ?">
            <cfset arrayAppend(params, {value=arguments.eventStopTime, cfsqltype="CF_SQL_TIME"})>
        </cfif>
        
        <cfset sql &= " WHERE eventid = ?">
        <cfset arrayAppend(params, {value=arguments.new_eventid, cfsqltype="CF_SQL_INTEGER"})>
        
        <cfquery datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
    <cfcatch type="any">
        <cflog file="application" text="Error updating event: #cfcatch.message# - SQL: #sql# - Params: #serializeJSON(params)#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24597" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="focusid" type="numeric" default="0">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving event details." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24618" access="public" returntype="query">
    <cfargument name="sessionUserId" type="numeric" required="true">
    <cfargument name="currentId" type="numeric" required="false">
    
    <cfset var result = "">

        <cfquery name="result" datasource="abod">
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
<cffunction name="SELevents_24659" access="public" returntype="query">
    <cfargument name="sessionUserID" type="numeric" required="true">
    <cfargument name="currentID" type="numeric" required="false">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
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

        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="RESevents_24660" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="currentID" type="numeric" required="false">
    
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn queryResult>
</cffunction>
<cffunction name="DETevents_24675" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24686" access="public" returntype="query">
    <cfargument name="sessionUserId" type="numeric" required="true">
    <cfargument name="contactId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch>
            <cflog file="application" text="Error in getEvents function: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfreturn queryNew("eventID,recid,eventTitle,eventStart,eventStartTime", "integer,integer,varchar,timestamp,time")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELevents_24695" access="public" returntype="query">
    <cfargument name="sessionUserID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventDetails: #cfcatch.message#">
            <cfset result = queryNew("eventID, recid, eventTitle, eventStart, eventStartTime")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
