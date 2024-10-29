<cfcomponent displayname="LinkService" hint="Handles operations for Link table" output="false"> 
<cffunction name="insertLink" access="public" returntype="void">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="noteid" type="numeric" required="true">

    <cftry>
        <cfquery name="insertLinkQuery" datasource="yourDataSource">
            INSERT INTO links (linkname, linkurl, isdeleted, userid, noteid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.linkname#" />, 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.linkurl#" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="0" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteid#" />
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error inserting link: #cfcatch.message# Query: INSERT INTO links (linkname, linkurl, isdeleted, userid, noteid) VALUES (#arguments.linkname#, #arguments.linkurl#, 0, #session.userid#, #arguments.noteid#)" />
        <cfthrow message="An error occurred while inserting the link." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getEventIdByLinkId" access="public" returntype="query">
    <cfargument name="linkid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT n.eventid 
            FROM links l 
            INNER JOIN noteslog n ON n.noteid = l.noteid 
            WHERE linkid = <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventIdByLinkId: #cfcatch.message#; SQL: SELECT n.eventid FROM links l INNER JOIN noteslog n ON n.noteid = l.noteid WHERE linkid = #arguments.linkid#;">
            <cfthrow message="Database error occurred while fetching event ID by link ID." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateLinkIsDeleted" access="public" returntype="void" hint="Updates the isdeleted field for a given linkid">
    <cfargument name="linkid" type="numeric" required="true" hint="The ID of the link to update">

    <cftry>
        <cfquery datasource="abod">
            UPDATE links_tbl
            SET isdeleted = 1
            WHERE linkid = <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating isdeleted field in links_tbl: #cfcatch.message#">
            <cfthrow message="Database update failed" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getLinksByNoteId" access="public" returntype="query">
    <cfargument name="new_noteid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT linkid, linkname, linkurl, userid, noteid
            FROM links
            WHERE noteid = <cfqueryparam value="#arguments.new_noteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getLinksByNoteId: #cfcatch.message#; SQL: #cfcatch.Sql#; Data: #arguments.new_noteid#">
            <cfthrow message="Error executing query in getLinksByNoteId" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
