<cfcomponent displayname="AuditionMediaXRefService" hint="Handles operations for AuditionMediaXRef table" output="false"> 

<cffunction name="INSaudmedia_auditions_xref" access="public" returntype="void">
    <cfargument name="new_mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfquery>
        INSERT INTO audmedia_auditions_xref (mediaid, audprojectid)
        VALUES (
            <cfqueryparam value="#arguments.new_mediaid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="DELaudmedia_auditions_xref" access="public" returntype="void">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfquery>
        DELETE FROM audmedia_auditions_xref
        WHERE mediaid = <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
        AND audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudmedia_auditions_xref_24153" access="public" returntype="void">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfquery>
        INSERT INTO audmedia_auditions_xref (mediaid, audprojectid)
        VALUES (
            <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="SELaudmedia_auditions_xref" access="public" returntype="query">
    <cfargument name="new_mediaID" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM audmedia_auditions_xref 
        WHERE mediaid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaID#" null="#NOT len(trim(arguments.new_mediaID))#"> 
        AND audprojectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.audprojectid#" null="#NOT len(trim(arguments.audprojectid))#">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSaudmedia_auditions_xref_24568" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="new_mediaID" type="numeric" required="true">

    <cfquery>
        INSERT INTO audmedia_auditions_xref (audprojectid, mediaid)
        VALUES (
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.audprojectid#" null="#NOT len(trim(arguments.audprojectid))#">,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaID#" null="#NOT len(trim(arguments.new_mediaID))#">
        )
    </cfquery>
</cffunction>

</cfcomponent>