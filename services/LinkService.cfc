<cfcomponent displayname="LinkService" hint="Handles operations for Link table" output="false"> 

<cffunction name="getLinksByNoteId" access="public" returntype="struct">
    <!--- Define required arguments --->
    <cfargument name="noteid" type="numeric" required="true">

    <!--- Query to fetch links based on note ID --->
    <cfquery result="result"  name="links">
        SELECT
            linkid,
            linkname,
            linkurl,
            userid,
            noteid
        FROM
            links
        WHERE
            noteid = <cfquery result="result" param value="#arguments.noteid#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Create a struct to hold query and record count --->
    <cfset var resultStruct = structNew()>
    <cfset resultStruct.links = links>
    <cfset resultStruct.recordcount = links.recordcount>

    <cfreturn resultStruct>
</cffunction>



<cffunction name="INSlinks" access="public" returntype="void">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="noteid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
        <cfquery result="result"  name="insertLinkQuery">
            INSERT INTO links (linkname, linkurl, isdeleted, userid, noteid) 
            VALUES (
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.linkname#" />, 
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#arguments.linkurl#" />, 
                <cfquery result="result" param cfsqltype="cf_sql_integer" value="0" />, 
                <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.userid#" />, 
                <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.noteid#" />
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
        WHERE linkid = <cfquery result="result" param value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="UPDlinks" access="public" returntype="void" hint="Updates the isdeleted field for a given linkid">
    <cfargument name="linkid" type="numeric" required="true" hint="The ID of the link to update">

    <cfquery result="result" >
        UPDATE links_tbl
        SET isdeleted = 1
        WHERE linkid = <cfquery result="result" param value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELlinks_23981" access="public" returntype="query">
    <cfargument name="new_noteid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT linkid, linkname, linkurl, userid, noteid
        FROM links
        WHERE noteid = <cfquery result="result" param value="#arguments.new_noteid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>