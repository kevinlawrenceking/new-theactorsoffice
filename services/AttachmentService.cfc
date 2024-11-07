<cfcomponent displayname="AttachmentService" hint="Handles operations for Attachment table" output="false">

    <cffunction name="INSattachments" access="public" returntype="void">
        <cfargument name="attachname" type="string" required="true">
        <cfargument name="attachfilename" type="string" required="true">
        <cfargument name="noteid" type="numeric" required="true">
        
        <cfquery datasource="abod">
            INSERT INTO attachments (attachname, attachfilename, isdeleted, userid, noteid) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.attachname#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.attachfilename#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="0" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.noteid#" />
            )
        </cfquery>
    </cffunction>

    <cffunction name="DETattachments" access="public" returntype="query">
        <cfargument name="attachid" type="numeric" required="true">
        <cfset var result = "">

        <cfquery name="result" datasource="abod">
            SELECT attachid, noteid, attachname, attachfilename
            FROM attachments
            WHERE attachid = <cfqueryparam value="#arguments.attachid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfreturn result>
    </cffunction>

    <cffunction name="UPDattachments" access="public" returntype="void">
        <cfargument name="attachid" type="numeric" required="true">

        <cfquery datasource="abod">
            UPDATE attachments_tbl
            SET isdeleted = 1
            WHERE attachid = <cfqueryparam value="#arguments.attachid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    </cffunction>

    <cffunction name="SELattachments" access="public" returntype="query">
        <cfargument name="new_noteid" type="numeric" required="true">
        <cfset var result = "">

        <cfquery name="result" datasource="abod">
            SELECT attachid, noteid, attachname, attachfilename, userid
            FROM attachments
            WHERE noteid = <cfqueryparam value="#arguments.new_noteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfreturn result>
    </cffunction>

</cfcomponent>
