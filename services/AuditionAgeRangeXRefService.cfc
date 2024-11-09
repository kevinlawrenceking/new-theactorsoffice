<cfcomponent displayname="AuditionAgeRangeXRefService" hint="Handles operations for AuditionAgeRangeXRef table" output="false">

    <cffunction name="SELaudageranges_audtion_xref" access="public" returntype="query">
        <cfargument name="audroleid" type="numeric" required="true">
        <cfargument name="new_rangeid" type="numeric" required="true">
        <cfset var result = "">

        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audageranges_audtion_xref 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
            AND rangeid = <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfreturn result>
    </cffunction>

    <cffunction name="DELaudageranges_audtion_xref" access="public" returntype="void">
        <cfargument name="new_audroleid" type="numeric" required="true">

        <cfquery datasource="abod">
            DELETE FROM audageranges_audtion_xref
            WHERE audroleid = <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    </cffunction>

    <cffunction name="INSaudageranges_audtion_xref" access="public" returntype="void">
        <cfargument name="new_rangeid" type="numeric" required="true">
        <cfargument name="new_audroleid" type="numeric" required="true">

        <cfquery datasource="abod">
            INSERT INTO audageranges_audtion_xref (rangeid, audroleid)
            VALUES (
                <cfqueryparam value="#arguments.new_rangeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
    </cffunction>

    <cffunction name="INSaudageranges_audtion_xref_24502" access="public" returntype="void">
        <cfargument name="new_audRoleID" type="numeric" required="true">
        <cfargument name="new_rangeid" type="numeric" required="true">

        <cfquery datasource="abod">
            INSERT INTO audageranges_audtion_xref (audRoleID, rangeid)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_rangeid#" null="#NOT len(trim(arguments.new_rangeid))#">
            )
        </cfquery>
    </cffunction>

    <cffunction name="UPDaudageranges_audtion_xref" access="public" returntype="void">
        <cfargument name="new_audRoleID" type="numeric" required="true">
        <cfargument name="new_rangeid" type="numeric" required="true">
        <cfargument name="new_id" type="numeric" required="true">

        <cfquery datasource="abod">
            UPDATE audageranges_audtion_xref 
            SET 
                audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
                rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_rangeid#" null="#NOT len(trim(arguments.new_rangeid))#">
            WHERE 
                id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_id#">
        </cfquery>
    </cffunction>

</cfcomponent>
