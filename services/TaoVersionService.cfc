<cfcomponent displayname = "TaoVersionService" hint = "Handles operations for TaoVersion table" 
             output = "false">
    
    <cffunction name = "SELtaoversions" access = "public" returntype = "query">
        <cfset var result = "">
        <cfquery name = "result">
            SELECT verid
            FROM taoversions
            WHERE 1=1
            AND isactive = 1
            ORDER BY isactive DESC, verid DESC
            LIMIT 1
        </cfquery>
        <cfreturn result>
    </cffunction>
    
    <cffunction name = "SELtaoversions_24215" access = "public" returntype = "query">
        <cfargument name = "major" type = "numeric" required = "false"/>
        <cfargument name = "minor" type = "numeric" required = "false"/>
        <cfargument name = "patch" type = "numeric" required = "false"/>
        <cfargument name = "version" type = "string" required = "false"/>
    
        <cfset var local = {}>
    
        <cfset local.queryString = "
        SELECT verid AS id, major, minor, patch, version, versiontype, alphabeta, isactive 
        FROM taoversions 
        WHERE 1=1
    ">
    
        <cfif structKeyExists(arguments, "major")>
            <cfset local.queryString &= " AND major = ?">
            <cfset arrayAppend(local.params, {value = arguments.major, cfsqltype = "CF_SQL_INTEGER"})>
        </cfif>
    
        <cfif structKeyExists(arguments, "minor")>
            <cfset local.queryString &= " AND minor = ?">
            <cfset arrayAppend(local.params, {value = arguments.minor, cfsqltype = "CF_SQL_INTEGER"})>
        </cfif>
    
        <cfif structKeyExists(arguments, "patch")>
            <cfset local.queryString &= " AND patch = ?">
            <cfset arrayAppend(local.params, {value = arguments.patch, cfsqltype = "CF_SQL_INTEGER"})>
        </cfif>
    
        <cfif structKeyExists(arguments, "version")>
            <cfset local.queryString &= " AND version = ?">
            <cfset arrayAppend(local.params, {value = arguments.version, cfsqltype = "CF_SQL_VARCHAR"})>
        </cfif>
    
        <cfset local.queryString &= " ORDER BY major, minor, patch, version">
    
        <cfquery name = "local.result">#local.queryString#
            <cfloop array = "#local.params#" index = "param">
                <cfqueryparam value = "#param.value#" cfsqltype = "#param.cfsqltype#">
            </cfloop>
        </cfquery>
    
        <cfreturn local.result>
    </cffunction>
    
    <cffunction name = "SELtaoversions_24331" access = "public" returntype = "query">
        <cfargument name = "datasource" type = "string" required = "true"/>
    
        <cfset var result = "">
    
        <cfquery name = "result">
            SELECT verid
            FROM taoversions
            ORDER BY verid DESC
            LIMIT 1
        </cfquery>
    
        <cfreturn result>
    </cffunction>
    
    <cffunction name = "SELtaoversions_24386" access = "public" returntype = "query">
        <cfargument name = "old_verid" type = "numeric" required = "true"/>
    
        <cfset var result = "">
    
        <cfquery name = "result">
            SELECT CONCAT(v.major, '.', v.minor, '.', v.patch, '.', v.version, '.', v.build) AS 
            old_findname
            FROM taoversions v
            WHERE v.verid = <cfqueryparam value = "#arguments.old_verid#" 
                      cfsqltype = "CF_SQL_INTEGER">
        </cfquery>
    
        <cfreturn result>
    </cffunction>
    
    <cffunction name = "SELtaoversions_24387" access = "public" returntype = "query">
        <cfargument name = "new_verid" type = "numeric" required = "true"/>
    
        <cfset var result = "">
    
        <cfquery name = "result">
            SELECT CONCAT(v.major, '.', v.minor, '.', v.patch, '.', v.version, '.', v.build) AS 
            new_findname
            FROM taoversions v
            WHERE v.verid = <cfqueryparam value = "#arguments.new_verid#" 
                      cfsqltype = "CF_SQL_INTEGER">
        </cfquery>
    
        <cfreturn result>
    </cffunction>
    
    <cffunction name = "SELtaoversions_24469" access = "public" returntype = "query">
        <cfargument name = "new_major" type = "numeric" required = "true"/>
        <cfargument name = "new_minor" type = "numeric" required = "true"/>
        <cfargument name = "new_patch" type = "numeric" required = "true"/>
        <cfargument name = "new_version" type = "string" required = "true"/>
        <cfargument name = "new_build" type = "numeric" required = "true"/>
    
        <cfset var result = "">
    
        <cfquery name = "result">
            SELECT *
            FROM taoversions
            WHERE major = <cfqueryparam value = "#arguments.new_major#" cfsqltype = "CF_SQL_INTEGER">
            AND minor = <cfqueryparam value = "#arguments.new_minor#" cfsqltype = "CF_SQL_INTEGER">
            AND patch = <cfqueryparam value = "#arguments.new_patch#" cfsqltype = "CF_SQL_INTEGER">
            AND version = <cfqueryparam value = "#arguments.new_version#" 
                      cfsqltype = "CF_SQL_VARCHAR">
            AND build = <cfqueryparam value = "#arguments.new_build#" cfsqltype = "CF_SQL_INTEGER">
        </cfquery>
    
        <cfreturn result>
    </cffunction>
    
    <cffunction name = "INStaoversions" access = "public" returntype = "void">
        <cfargument name = "new_major" type = "numeric" required = "true"/>
        <cfargument name = "new_minor" type = "numeric" required = "true"/>
        <cfargument name = "new_patch" type = "numeric" required = "true"/>
        <cfargument name = "new_versionstatus" type = "string" required = "true"/>
        <cfargument name = "new_versiontype" type = "string" required = "true"/>
        <cfargument name = "new_version" type = "numeric" required = "true"/>
        <cfargument name = "new_build" type = "numeric" required = "true"/>
        <cfargument name = "new_reviewDate" type = "date" required = "false"/>
        <cfargument name = "new_releaseDate" type = "date" required = "false"/>
        <cfargument name = "new_reviewtime" type = "string" required = "false"/>
        <cfargument name = "new_releasetime" type = "string" required = "false"/>
        <cfargument name = "new_hoursavail" type = "numeric" required = "false"/>
    
        <cfquery result="result" datasource = "#abodName#">
            INSERT INTO taoversions (
            major, minor, patch, versionstatus, versiontype, version, build,
            reviewDate, releaseDate, reviewtime, releasetime, hoursavail
            ) VALUES (<cfqueryparam cfsqltype = "cf_sql_integer" value = "#arguments.new_major#"/>
            ,<cfqueryparam cfsqltype = "cf_sql_integer" value = "#arguments.new_minor#"/>
            ,<cfqueryparam cfsqltype = "cf_sql_integer" value = "#arguments.new_patch#"/>
            ,<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.new_versionstatus#"/>
            ,<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.new_versiontype#"/>
            ,<cfqueryparam cfsqltype = "cf_sql_integer" value = "#arguments.new_version#"/>
            ,<cfqueryparam cfsqltype = "cf_sql_integer" value = "#arguments.new_build#"/>
            ,
            <cfif arguments.new_reviewDate neq "">
                <cfqueryparam cfsqltype = "cf_sql_date" value = "#arguments.new_reviewDate#"/>
            <cfelse>
                NULL 
            </cfif>
            ,
            <cfif arguments.new_releaseDate neq "">
                <cfqueryparam cfsqltype = "cf_sql_date" value = "#arguments.new_releaseDate#"/>
            <cfelse>
                NULL 
            </cfif>
            ,
            <cfif arguments.new_reviewtime neq "">
                <cfqueryparam cfsqltype = "cf_sql_time" value = "#arguments.new_reviewtime#"/>
            <cfelse>
                NULL 
            </cfif>
            ,
            <cfif arguments.new_releasetime neq "">
                <cfqueryparam cfsqltype = "cf_sql_time" value = "#arguments.new_releasetime#"/>
            <cfelse>
                NULL 
            </cfif>
            ,
            <cfif arguments.new_hoursavail neq "">
                <cfqueryparam cfsqltype = "cf_sql_float" 
                              value = "#numberformat(arguments.new_hoursavail,'9.99')#"/>
            <cfelse>
                NULL 
            </cfif>
            )
        </cfquery>
        <cflog text = "[INFO] Successfully inserted new TAO version."/>
    
    </cffunction>
    
    <cffunction name = "UPDtaoversions" access = "public" returntype = "void">
        <cfargument name = "verid" type = "numeric" required = "true"/>
        <cfargument name = "new_major" type = "numeric" required = "true"/>
        <cfargument name = "new_minor" type = "numeric" required = "true"/>
        <cfargument name = "new_patch" type = "numeric" required = "true"/>
        <cfargument name = "new_versionstatus" type = "string" required = "true"/>
        <cfargument name = "new_versiontype" type = "string" required = "true"/>
        <cfargument name = "new_version" type = "numeric" required = "true"/>
        <cfargument name = "new_build" type = "numeric" required = "true"/>
        <cfargument name = "new_reviewDate" type = "date" required = "false" default = ""/>
        <cfargument name = "new_releaseDate" type = "date" required = "false" default = ""/>
        <cfargument name = "new_reviewtime" type = "string" required = "false" default = ""/>
        <cfargument name = "new_releasetime" type = "string" required = "false" default = ""/>
        <cfargument name = "new_hoursavail" type = "numeric" required = "false" default = ""/>
    
        <cfset var sql = "UPDATE taoversions SET major = ?, minor = ?, patch = ?, versionstatus = ?, versiontype = ?, version = ?, build = ?">
        <cfset var params = [arguments.new_major, arguments.new_minor, arguments.new_patch, 
                                     arguments.new_versionstatus,arguments.new_versiontype, 
                                     arguments.new_version,arguments.new_build]>
    
        <cfif len(arguments.new_reviewDate)>
            <cfset sql &= ", reviewDate = ?">
            <cfset arrayAppend(params, arguments.new_reviewDate)>
        </cfif>
    
        <cfif len(arguments.new_releaseDate)>
            <cfset sql &= ", releaseDate = ?">
            <cfset arrayAppend(params, arguments.new_releaseDate)>
        </cfif>
    
        <cfif len(arguments.new_reviewtime)>
            <cfset sql &= ", reviewtime = ?">
            <cfset arrayAppend(params, arguments.new_reviewtime)>
        </cfif>
    
        <cfif len(arguments.new_releasetime)>
            <cfset sql &= ", releasetime = ?">
            <cfset arrayAppend(params, arguments.new_releasetime)>
        </cfif>
    
        <cfif len(arguments.new_hoursavail)>
            <cfset sql &= ", hoursavail = ?">
            <cfset arrayAppend(params, numberFormat(arguments.new_hoursavail, "9.99"))>
        </cfif>
    
        <cfset sql &= " WHERE verid = ?">
        <cfset arrayAppend(params, arguments.verid)>
    
        <cfquery result="result" datasource = "#application.datasource#" name = "updateQuery">#sql#
            <cfsilent>
                <!--- Loop through parameters and bind them --->
                <cfloop from = 1 to = #arrayLen(params)# index = i>
                    <cfqueryparam value = "#params[i]#" cfsqltype = "#getSQLType(params[i])#"/>
                </cfloop>
            </cfsilent>
        </cfquery>
    
    </cffunction>
    
</cfcomponent>