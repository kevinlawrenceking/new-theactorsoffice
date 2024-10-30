<cfcomponent displayname="AuditionSourceService" hint="Handles operations for AuditionSource table" output="false"> 
<cffunction name="SELaudsources" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT audsource AS NAME FROM audsources">
    <cfset var whereClause = "">
    <cfset var paramList = []>

    <!--- Build WHERE clause dynamically --->
    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfset whereClause &= "#key# = ? AND ">
            <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype=determineSQLType(key)})>
        </cfloop>
        <!--- Remove trailing ' AND ' --->
        <cfset whereClause = left(whereClause, len(whereClause) - 5)>
    </cfif>

    <!--- Execute query within try/catch for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql##whereClause#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error executing getAudSources: #cfcatch.message# Query: #sql##whereClause# Parameters: #serializeJSON(paramList)#">
            <cfreturn queryNew("NAME")> <!--- Return empty query on error --->
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudsources_24222" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="false" default="false">
    
    <cfset var result = "">
    <cfset var sql = "">
    
    <cftry>
        <cfset sql = "
            SELECT audsourceid, audsource
            FROM audsources
            WHERE isdeleted = ?
            ORDER BY audsource
        ">
        
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudSources: #cfcatch.message# Query: #sql# Parameters: isDeleted=#arguments.isDeleted#">
            <cfset result = queryNew("audsourceid,audsource")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudsources_24359" access="public" returntype="query">
    <cfargument name="audsource" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM audsources
            WHERE isdeleted = 0
            AND audsource = <cfqueryparam value="#arguments.audsource#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudSources: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudsources_24371" access="public" returntype="query">
    <cfargument name="audsource" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM audsources
            WHERE audsource = <cfqueryparam value="#arguments.audsource#" cfsqltype="CF_SQL_VARCHAR">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudSources: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudsources" access="public" returntype="void">
    <cfargument name="new_audsource" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audsources (audsource, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audsource)#" maxlength="100" null="#NOT len(trim(arguments.new_audsource))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            );
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into audsources: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting audsource." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudsources" access="public" returntype="void">
    <cfargument name="new_audsource" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audsourceid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audsources 
            SET 
                audsource = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audsource)#" maxlength="100" null="#NOT len(trim(arguments.new_audsource))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audsourceid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audsourceid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audsource: #cfcatch.message#">
            <cfthrow message="Error updating audsource." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudsources_24684" access="public" returntype="query">
    <cfargument name="excludeMyTeam" type="boolean" required="false" default="false">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audsourceid AS id, audsource AS NAME 
            FROM audsources
            WHERE 1=1
            <cfif arguments.excludeMyTeam>
                AND audsource <> <cfqueryparam value="My Team" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            ORDER BY audsource
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudSources: #cfcatch.message#">
            <cfset result = queryNew("id,NAME", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
