<cfcomponent displayname="LinkService" hint="Handles operations for Link table" output="false"> 
<cffunction name="INSlinks" access="public" returntype="void">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="noteid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
        <cfquery name="insertLinkQuery">
            INSERT INTO links (linkname, linkurl, isdeleted, userid, noteid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.linkname#" />, 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.linkurl#" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="0" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />, 
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteid#" />
            )
        </cfquery>
</cffunction>

<cffunction name="SELlinks" access="public" returntype="query">
    <cfargument name="linkid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT n.eventid 
        FROM links l 
        INNER JOIN noteslog n ON n.noteid = l.noteid 
        WHERE linkid = <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="UPDlinks" access="public" returntype="void" hint="Updates the isdeleted field for a given linkid">
    <cfargument name="linkid" type="numeric" required="true" hint="The ID of the link to update">

    <cfquery>
        UPDATE links_tbl
        SET isdeleted = 1
        WHERE linkid = <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELlinks_23981" access="public" returntype="query">
    <cfargument name="new_noteid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT linkid, linkname, linkurl, userid, noteid
        FROM links
        WHERE noteid = <cfqueryparam value="#arguments.new_noteid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>