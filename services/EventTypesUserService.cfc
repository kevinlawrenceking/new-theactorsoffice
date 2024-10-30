<cfcomponent displayname="EventTypesUserService" hint="Handles operations for EventTypesUser table" output="false"> 
<cffunction name="DETeventtypes_user" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM eventtypes_user
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventTypeById: #cfcatch.message# Query: SELECT * FROM eventtypes_user WHERE id = #arguments.id#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDeventtypes_user" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="new_eventtypecolor" type="string" required="true">
    <cfargument name="deletelink" type="boolean" required="false" default=false>
    <cfargument name="new_iscustom" type="boolean" required="false" default=false>
    <cfargument name="new_eventtypename" type="string" required="false">

    <cfset var sql = "">
    <cfset var params = []>

    <cftry>
        <cfset sql = "UPDATE eventtypes_user SET eventtypecolor = ?">
        <cfset arrayAppend(params, {value=arguments.new_eventtypecolor, cfsqltype="CF_SQL_VARCHAR"})>

        <cfif arguments.deletelink>
            <cfset sql &= ", isdeleted = 1">
        </cfif>

        <cfif arguments.new_iscustom>
            <cfset sql &= ", eventtypename = ?">
            <cfset arrayAppend(params, {value=arguments.new_eventtypename, cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <cfset sql &= " WHERE id = ?">
        <cfset arrayAppend(params, {value=arguments.id, cfsqltype="CF_SQL_INTEGER"})>

        <cfquery datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in updateEventTypeUser: #cfcatch.message# Query: #sql# Parameters: #params#">
        <cfthrow message="An error occurred while updating the event type user.">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELeventtypes_user" access="public" returntype="query">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT eventTypeName, eventtypedescription, eventtypecolor
            FROM eventtypes_user
            WHERE eventTypeName = <cfqueryparam value="#arguments.eventTypeName#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventTypesByUser: #cfcatch.message#">
            <cfreturn queryNew("eventTypeName,eventtypedescription,eventtypecolor")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSeventtypes_user" access="public" returntype="void">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="eventtypedescription" type="string" required="true">
    <cfargument name="eventtypecolor" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO eventtypes_user 
                (eventTypeName, eventtypedescription, eventtypecolor, userid) 
            VALUES 
                (
                    <cfqueryparam value="#arguments.eventTypeName#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.eventtypedescription#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.eventtypecolor#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
                )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into eventtypes_user: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELeventtypes_user_24484" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="isAuditionModule" type="boolean" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT eventtypename 
            FROM eventtypes_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" />
            <cfif arguments.isAuditionModule>
                AND eventtypename <> 'Audition'
            </cfif>
            ORDER BY eventtypename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventTypesForUser: #cfcatch.message# Query: SELECT eventtypename FROM eventtypes_user WHERE userid = #arguments.userid# AND isAuditionModule = #arguments.isAuditionModule#">
            <cfset result = queryNew("eventtypename", "varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELeventtypes_user_24486" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT eventtypename 
            FROM eventtypes_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY eventtypename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventTypesByUser: #cfcatch.message#">
            <cfset result = queryNew("eventtypename")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELeventtypes_user_24619" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                id, 
                eventtypename, 
                eventtypedescription, 
                recordname, 
                iscustom, 
                eventtypecolor 
            FROM 
                eventtypes_user 
            WHERE 
                userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                eventtypename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getUserEventTypes: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELeventtypes_user_24661" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                id, 
                eventtypename, 
                eventtypedescription, 
                recordname, 
                iscustom, 
                eventtypecolor 
            FROM 
                eventtypes_user 
            WHERE 
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                eventtypename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getUserEventTypes: #cfcatch.message# Query: SELECT id, eventtypename, eventtypedescription, recordname, iscustom, eventtypecolor FROM eventtypes_user WHERE userid = ? ORDER BY eventtypename Parameters: #arguments.userid#">
            <cfset result = queryNew("id,eventtypename,eventtypedescription,recordname,iscustom,eventtypecolor")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
