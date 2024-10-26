<cfcomponent displayname="TicketsService" output="false" hint="Service to handle trouble tickets related queries">

    <!--- Function to retrieve one ticket record --->
    <cffunction name="Ticket_det" access="remote" returntype="query" output="false" hint="Get ticket details for a specific ticket.">
        <cfargument name="recid" required="true" type="numeric" hint="Ticket ID"/>

         <cfquery name="ticketDetails">
        SELECT 
            t.ticketID as recID,
            t.ticketID,
            t.ticketName,
            CONCAT(u.userfirstname,' ',u.userlastname) AS username,
            t.ticketCreatedDate AS createddate,
            t.ticketstatus,
            t.tickettype,
            t.environ,
            t.ticketPriority,
            p.pgname,
            t.esthours,
            t.ticketCompletedDate,
            t.verid,
            t.testingscript,
            t.ticketdetails,
            t.ticketResponse,
            t.patchnote,
            t.recordname,
            v.major,
            v.minor,
            v.patch,
            v.alphabeta,
            v.version,
            v.build,   
            v.releasedate,
            t.customtestpagename,
            t.customtestpagelink,
            t.pgid,  
            t.userid  
        FROM tickets t
        LEFT JOIN taousers_tbl u ON u.userid = t.userid
        LEFT JOIN pgpages p ON p.pgid = t.pgid
        LEFT JOIN taoversions v ON v.verid = t.verid
        WHERE t.ticketid = <cfqueryparam value="#arguments.recid#" cfsqltype="cf_sql_integer">
    </cfquery>

        <!--- Return the query result --->
        <cfreturn ticketDetails />
    </cffunction>

     <!--- Function to retrieve the log of changes to a specific ticket --->
    <cffunction name="TicketLog_res" access="remote" returntype="query" output="false" hint="Get the log of changes for a ticket.">
        <cfargument name="recid" required="true" type="numeric" hint="Ticket ID"/>

        <cfquery name="results">
            SELECT
                t.tlogid,
                t.tlogid as recid,
                t.ticketid,
                u.recordname AS col1,
                'User' AS head1,
                'Date' AS head2,
                'Time' AS head3,
                'Details' AS head4,
                'Status' AS head5,
                t.tlogtimestamp as col2,
                t.tlogtimestamp as col3,
                t.tlogDetails as col4,
                t.ticketstatus as col5
            FROM ticketslog t
            INNER JOIN taousers_tbl u ON u.userid = t.userid
            WHERE t.ticketid = <cfqueryparam value="#arguments.recid#" cfsqltype="cf_sql_integer">
            ORDER BY t.tlogtimestamp DESC
        </cfquery>

        <!-- Return the query result -->
        <cfreturn results />
    </cffunction>

<!-- Function to retrieve a list of ticket types for a select list -->
<cffunction name="types_sel" access="remote" returntype="query" output="false" hint="Get a list of ticket types for a select list.">
    <cfquery name="getTicketTypes">
        SELECT tickettype AS id, 
               tickettype AS name 
        FROM tickettypes 
        ORDER BY tickettype
    </cfquery>
    <!-- Return the query result -->
    <cfreturn getTicketTypes />
</cffunction>

    
    <!-- Function to retrieve a list of ticket priorities for a select list -->
    <cffunction name="priorities_sel" access="remote" returntype="query" output="false" hint="Get a list of ticket priorities for a select list.">
        <cfquery name="getTicketPriorities">
            SELECT ticketpriority AS id, 
                   ticketpriority AS name 
            FROM ticketpriority 
            ORDER BY orderNo
        </cfquery>
        <!-- Return the query result -->
        <cfreturn getTicketPriorities />
    </cffunction>

<!-- Function to retrieve a list of ticket statuses for a select list -->
<cffunction name="statuses_sel" access="remote" returntype="query" output="false" hint="Get a list of ticket statuses for a select list.">
    <cfquery name="getTicketStatus">
        SELECT ticketstatus AS id, 
               ticketstatus AS name 
        FROM ticketstatuses 
        ORDER BY id
    </cfquery>
    <!-- Return the query result -->
    <cfreturn getTicketStatus /> <!-- Changed this line to return the correct query name -->
</cffunction>

</cfcomponent>
