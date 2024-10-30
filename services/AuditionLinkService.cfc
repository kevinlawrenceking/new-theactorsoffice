<cfcomponent displayname="AuditionLinkService" hint="Handles operations for AuditionLink table" output="false"> 
<cffunction name="SELaudlinks" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audlinks 
            WHERE audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error in getAudlinksByRoleId: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudlinks" access="public" returntype="void">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="audroleid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audlinks_tbl (linkname, linkurl, isdeleted, userid, audroleid)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.linkname#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.linkurl#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="0" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.audroleid#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into audlinks_tbl: #cfcatch.message#" type="error">
            <cfthrow message="Database error occurred while inserting record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudlinks" access="public" returntype="query">
    <cfargument name="linkid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audlinks 
            WHERE linkid = <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudLinksByLinkId: #cfcatch.message# Query: SELECT * FROM audlinks WHERE linkid = #arguments.linkid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDaudlinks" access="public" returntype="void">
    <cfargument name="linkid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audlinks 
            SET isdeleted = 1 
            WHERE linkid = <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audlinks: #cfcatch.message#; LinkID: #arguments.linkid#">
            <cfthrow message="Error updating audlinks" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
