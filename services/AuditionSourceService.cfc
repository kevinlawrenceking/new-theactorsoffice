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

    <!--- Execute query --->
    <cfquery name="result">
        #sql##whereClause#
        <cfloop array="#paramList#" index="param">
            <cfquery result="result" param value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELaudsources_24222" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="false" default="false">
    
    <cfset var result = "">
    
    <cfset var sql = "
        SELECT audsourceid, audsource
        FROM audsources
        WHERE isdeleted = ?
        ORDER BY audsource
    ">
    
    <cfquery name="result">
        #sql#
        <cfquery result="result" param value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELaudsources_24359" access="public" returntype="query">
    <cfargument name="audsource" type="string" required="true">

    <cfset var result = "">
    
    <cfquery name="result">
        SELECT *
        FROM audsources
        WHERE isdeleted = 0
        AND audsource = <cfquery result="result" param value="#arguments.audsource#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELaudsources_24371" access="public" returntype="query">
    <cfargument name="audsource" type="string" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT *
        FROM audsources
        WHERE audsource = <cfquery result="result" param value="#arguments.audsource#" cfsqltype="CF_SQL_VARCHAR">
        AND isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="INSaudsources" access="public" returntype="void">
    <cfargument name="new_audsource" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO audsources (audsource, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audsource)#" maxlength="100" null="#NOT len(trim(arguments.new_audsource))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        );
    </cfquery>
</cffunction>

<cffunction name="UPDaudsources" access="public" returntype="void">
    <cfargument name="new_audsource" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audsourceid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audsources 
        SET 
            audsource = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audsource)#" maxlength="100" null="#NOT len(trim(arguments.new_audsource))#">,
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        WHERE 
            audsourceid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audsourceid#">
    </cfquery>
</cffunction>

<cffunction name="SELaudsources_24684" access="public" returntype="query">
    <cfargument name="excludeMyTeam" type="boolean" required="false" default="false">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT audsourceid AS id, audsource AS NAME 
        FROM audsources
        WHERE 1=1
        <cfif arguments.excludeMyTeam>
            AND audsource <> <cfquery result="result" param value="My Team" cfsqltype="CF_SQL_VARCHAR">
        </cfif>
        ORDER BY audsource
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>