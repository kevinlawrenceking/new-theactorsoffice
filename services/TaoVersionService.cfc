<cfcomponent displayname="TaoVersionService" hint="Handles operations for TaoVersion table" output="false"> 
<cffunction name="SELtaoversions" access="public" returntype="query">
    <cfset var result = "">
    <cfquery name="result">
        SELECT verid 
        FROM taoversions
        WHERE 1=1
            AND isactive = 1
        ORDER BY isactive DESC, verid DESC
        LIMIT 1
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELtaoversions_24215" access="public" returntype="query">
    <cfargument name="major" type="numeric" required="false">
    <cfargument name="minor" type="numeric" required="false">
    <cfargument name="patch" type="numeric" required="false">
    <cfargument name="version" type="string" required="false">

    <cfset var local = {}>

    <cfset local.queryString = "
        SELECT verid AS id, major, minor, patch, version, versiontype, alphabeta, isactive 
        FROM taoversions 
        WHERE 1=1
    ">

    <cfif structKeyExists(arguments, "major")>
        <cfset local.queryString &= " AND major = ?">
        <cfset arrayAppend(local.params, {value=arguments.major, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "minor")>
        <cfset local.queryString &= " AND minor = ?">
        <cfset arrayAppend(local.params, {value=arguments.minor, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "patch")>
        <cfset local.queryString &= " AND patch = ?">
        <cfset arrayAppend(local.params, {value=arguments.patch, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "version")>
        <cfset local.queryString &= " AND version = ?">
        <cfset arrayAppend(local.params, {value=arguments.version, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <cfset local.queryString &= " ORDER BY major, minor, patch, version">

    <cfquery name="local.result">
        #local.queryString#
        <cfloop array="#local.params#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn local.result>
</cffunction>

<cffunction name="SELtaoversions_24331" access="public" returntype="query">
    <cfargument name="datasource" type="string" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT verid 
        FROM taoversions 
        ORDER BY verid DESC 
        LIMIT 1
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELtaoversions_24386" access="public" returntype="query">
    <cfargument name="old_verid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT CONCAT(v.major, '.', v.minor, '.', v.patch, '.', v.version, '.', v.build) AS old_findname
        FROM taoversions v
        WHERE v.verid = <cfqueryparam value="#arguments.old_verid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELtaoversions_24387" access="public" returntype="query">
    <cfargument name="new_verid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT CONCAT(v.major, '.', v.minor, '.', v.patch, '.', v.version, '.', v.build) AS new_findname
        FROM taoversions v
        WHERE v.verid = <cfqueryparam value="#arguments.new_verid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELtaoversions_24469" access="public" returntype="query">
    <cfargument name="new_major" type="numeric" required="true">
    <cfargument name="new_minor" type="numeric" required="true">
    <cfargument name="new_patch" type="numeric" required="true">
    <cfargument name="new_version" type="string" required="true">
    <cfargument name="new_build" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM taoversions
        WHERE major = <cfqueryparam value="#arguments.new_major#" cfsqltype="CF_SQL_INTEGER">
        AND minor = <cfqueryparam value="#arguments.new_minor#" cfsqltype="CF_SQL_INTEGER">
        AND patch = <cfqueryparam value="#arguments.new_patch#" cfsqltype="CF_SQL_INTEGER">
        AND version = <cfqueryparam value="#arguments.new_version#" cfsqltype="CF_SQL_VARCHAR">
        AND build = <cfqueryparam value="#arguments.new_build#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INStaoversions" access="public" returntype="void">
    <cfargument name="new_major" type="numeric" required="true">
    <cfargument name="new_minor" type="numeric" required="true">
    <cfargument name="new_patch" type="numeric" required="true">
    <cfargument name="new_versionstatus" type="string" required="true">
    <cfargument name="new_versiontype" type="string" required="true">
    <cfargument name="new_version" type="numeric" required="true">
    <cfargument name="new_build" type="numeric" required="true">
    <cfargument name="new_reviewDate" type="date" required="false">
    <cfargument name="new_releaseDate" type="date" required="false">
    <cfargument name="new_reviewtime" type="string" required="false">
    <cfargument name="new_releasetime" type="string" required="false">
    <cfargument name="new_hoursavail" type="numeric" required="false">

    <cfquery>
        INSERT INTO taoversions (
            major, minor, patch, versionstatus, versiontype, version, build,
            reviewDate, releaseDate, reviewtime, releasetime, hoursavail
        ) VALUES (
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_major#" />,
            <cf