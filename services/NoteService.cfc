<cfcomponent displayname="NoteService" hint="Handles operations for Note table" output="false"> 
<cffunction name="INSnoteslog" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="newcontactid" type="numeric" required="true">
    <cfargument name="newnoteDetails" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, noteDetails) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.newcontactid#" />, 
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(arguments.newnoteDetails), 2000)#" />
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error inserting into noteslog: #cfcatch.message# Query: INSERT INTO noteslog (userid, contactid, noteDetails) VALUES (?, ?, ?)" />
            <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DELnoteslog" access="public" returntype="void" hint="Deletes a note by its ID">
    <cfargument name="noteid" type="numeric" required="true" hint="ID of the note to delete">

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM noteslog 
            WHERE noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error deleting note with ID #arguments.noteid#: #cfcatch.message#" type="error">
            <cfthrow message="Failed to delete note." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DELnoteslog_23709" access="public" returntype="void">
    <cfargument name="noteId" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            DELETE FROM noteslog 
            WHERE noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteId#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error deleting note with ID #arguments.noteId#: #cfcatch.message#" />
            <cfthrow message="An error occurred while deleting the note." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnoteslog_23730" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_eventid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, eventid, noteDetails, ispublic)
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_eventid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#trim(arguments.noteDetails)#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into noteslog: #cfcatch.message#">
            <cfthrow message="Error inserting into noteslog." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELnoteslog" access="public" returntype="query">
    <cfargument name="noteid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM noteslog 
            WHERE noteid = <cfqueryparam value="#arguments.noteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNotesLogByNoteId: #cfcatch.message# Query: SELECT * FROM noteslog WHERE noteid = #arguments.noteid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDnoteslog" access="public" returntype="void">
    <cfargument name="recid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE noteslog_tbl 
            SET isdeleted = 1 
            WHERE noteid = <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating noteslog_tbl: #cfcatch.message#">
            <cflog file="application" type="error" text="Query Error: #cfcatch.detail#">
            <cflog file="application" type="error" text="Parameters: recid=#arguments.recid#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnoteslog_23966" access="public" returntype="void" output="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="isPublic" type="boolean" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="notedetailshtml" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, noteDetails, isPublic, audprojectid, notedetailshtml)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactid#" />,
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(arguments.noteDetails),2000)#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.isPublic#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.audprojectid#" />,
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.notedetailshtml#" />
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into noteslog: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDnoteslog_23967" access="public" returntype="void">
    <cfargument name="noteDetailsHtml" type="string" required="true">
    
    <cfset var sql = "">
    <cfset var params = []>
    
    <cftry>
        <cfset sql = "
            UPDATE noteslog 
            SET NOTEDETAILSHTML = REPLACE(NOTEDETAILSHTML, ?, '') 
            WHERE NOTEDETAILSHTML LIKE ?
        ">
        
        <cfset arrayAppend(params, {value=arguments.noteDetailsHtml, cfsqltype="CF_SQL_LONGVARCHAR"})>
        <cfset arrayAppend(params, {value='%' & arguments.noteDetailsHtml & '%', cfsqltype="CF_SQL_LONGVARCHAR"})>
        
        <cfquery name="updateQuery" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
    <cfcatch type="any">
        <cflog file="application" type="error" text="Error updating noteslog: #cfcatch.message# - SQL: #sql# - Params: #serializeJSON(params)#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnoteslog_23969" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="isPublic" type="boolean" required="true">
    <cfargument name="eventid" type="numeric" required="true">
    <cfargument name="notedetailshtml" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, noteDetails, isPublic, eventid, notedetailshtml)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactid#" />,
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(arguments.noteDetails),2000)#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.isPublic#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />,
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.notedetailshtml#" />
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting note log: #cfcatch.message# - Query: INSERT INTO noteslog (userid, contactid, noteDetails, isPublic, eventid, notedetailshtml) VALUES (#arguments.userid#, #arguments.contactid#, #LEFT(trim(arguments.noteDetails),2000)#, #arguments.isPublic#, #arguments.eventid#, #arguments.notedetailshtml#)" />
            <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnoteslog_23972" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="isPublic" type="numeric" required="true">
    <cfargument name="eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, noteDetails, isPublic, eventid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactid#" />,
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(arguments.noteDetails),2000)#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.isPublic#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into noteslog: #cfcatch.message# - #cfcatch.detail#">
            <cfthrow message="Database Error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDnoteslog_23974" access="public" returntype="void">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="new_noteText" type="string" required="true">
    <cfargument name="isPublic" type="boolean" required="true">
    <cfargument name="noteid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE noteslog 
            SET 
                noteDetails = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(arguments.noteDetails),2000)#">,
                notedetailshtml = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.new_noteText)#">,
                isPublic = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.isPublic#">
            WHERE 
                noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in updateNotesLog function: #cfcatch.message# Query: UPDATE noteslog SET noteDetails, notedetailshtml, isPublic WHERE noteid. Parameters: noteDetails=#arguments.noteDetails#, new_noteText=#arguments.new_noteText#, isPublic=#arguments.isPublic#, noteid=#arguments.noteid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDnoteslog_23980" access="public" returntype="void" output="false">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="isPublic" type="boolean" required="true">
    <cfargument name="noteid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE noteslog 
            SET 
                noteDetails = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(arguments.noteDetails),2000)#">,
                isPublic = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.isPublic#">
            WHERE 
                noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteid#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating noteslog: #cfcatch.message# Query: UPDATE noteslog SET noteDetails=?, isPublic=? WHERE noteid=? Parameters: #arguments.noteDetails#, #arguments.isPublic#, #arguments.noteid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELnoteslog_23987" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="eventID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.noteID, 
                n.noteTimestamp, 
                n.noteid AS recid, 
                'Date' AS head1, 
                'Time' AS head2, 
                'Relationships' AS head3, 
                'Status' AS head4, 
                'Details' AS head5, 
                n.noteTimestamp AS col1, 
                n.noteTimestamp AS col2, 
                n.isPublic AS col4, 
                n.noteDetails AS col5, 
                n.noteDetailsHTML, 
                n.userID
            FROM 
                noteslog n
            WHERE 
                n.userID = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER"> 
                AND n.eventid = <cfqueryparam value="#arguments.eventID#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                n.noteTimestamp DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNotesLog: #cfcatch.message#">
            <cfreturn queryNew("noteID,noteTimestamp,recid,head1,head2,head3,head4,head5,col1,col2,col4,col5,noteDetailsHTML,userID")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETnoteslog" access="public" returntype="query">
    <cfargument name="updateNoteID" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.noteID, 
                n.noteDetails, 
                n.userID, 
                n.noteTimestamp, 
                n.contactID, 
                n.isPublic, 
                d.contactFullName AS fullname
            FROM 
                noteslog n
            INNER JOIN 
                contactDetails d ON d.contactid = n.contactid
            WHERE 
                n.noteid = <cfqueryparam value="#arguments.updateNoteID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNoteDetails: #cfcatch.message# Query: SELECT n.noteID, n.noteDetails, n.userID, n.noteTimestamp, n.contactID, n.isPublic, d.contactFullName AS fullname FROM noteslog n INNER JOIN contactDetails d ON d.contactid = n.contactid WHERE n.noteid = ? Parameters: #arguments.updateNoteID#">
            <cfthrow message="An error occurred while retrieving note details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSnoteslog_24319" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="isPublic" type="boolean" required="true">
    <cfargument name="eventid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, noteDetails, isPublic, eventid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactid#" />,
                <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.noteDetails#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.isPublic ? 1 : 0#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into noteslog: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnoteslog_24373" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="new_audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, noteDetails, isPublic, audprojectid, contactid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#LEFT(trim(arguments.noteDetails), 2000)#" />,
                <cfqueryparam cfsqltype="cf_sql_bit" value="1" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_audprojectid#" />,
                0
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertNoteLog: #cfcatch.message# - Query: INSERT INTO noteslog (userid, noteDetails, isPublic, audprojectid, contactid) VALUES (?, ?, ?, ?, ?) - Parameters: userid=#arguments.userid#, noteDetails=#LEFT(trim(arguments.noteDetails), 2000)#, new_audprojectid=#arguments.new_audprojectid#"/>
            <cfthrow message="Database insertion error." detail="#cfcatch.detail#"/>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELnoteslog_24400" access="public" returntype="query">
    <cfargument name="select_userid" type="numeric" required="true">
    <cfargument name="select_contactid" type="numeric" required="true">
    <cfargument name="noteDetailsPrefix" type="string" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM noteslog 
            WHERE userid = <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND contactid = <cfqueryparam value="#arguments.select_contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND noteDetails LIKE <cfqueryparam value="#arguments.noteDetailsPrefix#%" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in getNotesLog function: #cfcatch.message#; SQL: #cfcatch.Sql#; Data: #arguments#">
            <cfthrow message="Error retrieving notes log." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSnoteslog_24401" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="noteDetails" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO noteslog (userid, contactid, noteDetails, ispublic) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#trim(arguments.noteDetails)#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into noteslog: #cfcatch.message# - Query: INSERT INTO noteslog (userid, contactid, noteDetails, ispublic) VALUES (#arguments.userid#, #arguments.contactid#, '#trim(arguments.noteDetails)#', 1)">
            <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELnoteslog_24698" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.noteID, 
                n.noteTimestamp, 
                n.noteid AS recid, 
                'Date' AS head1, 
                'Time' AS head2, 
                'Relationships' AS head3, 
                'Status' AS head4, 
                'Details' AS head5, 
                n.noteDetails, 
                n.noteTimestamp AS col1, 
                n.noteTimestamp AS col2, 
                n.isPublic AS col4, 
                n.noteDetails AS col5, 
                n.noteDetailsHTML, 
                n.userID
            FROM noteslog n
            WHERE n.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            AND n.audprojectid <> 0
            ORDER BY n.noteTimestamp DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getNotesLog: #cfcatch.message# Query: #cfcatch.detail#">
            <cfset result = queryNew("noteID,noteTimestamp,recid,head1,head2,head3,head4,head5,noteDetails,col1,col2,col4,col5,noteDetailsHTML,userID")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELnoteslog_24700" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.noteID, 
                n.noteid AS recid, 
                'Date' AS head1, 
                'Time' AS head2, 
                'Relationships' AS head3, 
                'Status' AS head4, 
                'Details' AS head5, 
                n.noteTimestamp AS col1, 
                n.noteTimestamp AS col2, 
                d.contactfullname AS col3, 
                n.isPublic AS col4, 
                n.noteDetails AS col5, 
                n.userID, 
                n.contactID
            FROM noteslog n
            INNER JOIN contactDetails d ON d.contactid = n.contactid
            WHERE n.userID = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            AND n.contactid = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY n.noteTimestamp DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNotesLog: #cfcatch.message# Query: SELECT ... WHERE userID=#arguments.userID# AND contactID=#arguments.contactID#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELnoteslog_24702" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="eventID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.noteID, 
                n.noteTimestamp, 
                n.noteid AS recid, 
                'Date' AS head1, 
                'Time' AS head2, 
                'Relationships' AS head3, 
                'Status' AS head4, 
                'Details' AS head5, 
                n.noteDetails, 
                n.noteTimestamp AS col1, 
                n.noteTimestamp AS col2, 
                n.isPublic AS col4, 
                n.noteDetails AS col5, 
                n.noteDetailsHTML, 
                n.userID
            FROM noteslog n
            WHERE n.userID = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            AND n.eventid = <cfqueryparam value="#arguments.eventID#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY n.noteTimestamp DESC
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNotesLog: #cfcatch.message#; Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELnoteslog_24704" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    

        <cfquery name="result" datasource="abod">
            SELECT 
                n.noteID, 
                n.noteid AS recid, 
                'Date' AS head1, 
                'Time' AS head2, 
                'Relationships' AS head3, 
                'Status' AS head4, 
                'Details' AS head5, 
                n.notetimestamp, 
                n.noteTimestamp AS col1, 
                n.noteTimestamp AS col2, 
                n.noteDetails, 
                d.contactfullname AS col3, 
                n.isPublic AS col4, 
                n.noteDetails AS col5, 
                n.noteDetailsHTML, 
                n.userID, 
                n.contactID
            FROM noteslog n
            INNER JOIN contactDetails d ON d.contactid = n.contactid
            WHERE n.userID = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER"> 
            AND n.contactid = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY n.noteTimestamp DESC
        </cfquery>
        
    
    <cfreturn result>
</cffunction></cfcomponent>
