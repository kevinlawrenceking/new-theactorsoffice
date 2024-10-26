<cfcomponent displayname="VersionsService" output="false" hint="Service to handle software versions related queries">

    <!--- Function to retrieve active versions --->
    <cffunction name="getActiveVersions" access="remote" returntype="query" output="false" hint="Get a list of active (pending) versions.">
        <cfquery name="activeversions">
            SELECT 
                v.verid AS id,
                CONCAT(v.major,'.',v.minor,'.',v.patch,'.',v.version,'.',v.build, ' - ',v.versiontype) AS Name,
                v.versionstatus 
            FROM taoversions v
            WHERE v.versionstatus = 'Pending'
            ORDER BY v.major, v.minor, v.patch, v.version, v.build
        </cfquery>
        <!--- Return the query result --->
        <cfreturn activeversions />
    </cffunction>

    
    <!--- Function to retrieve a list of versions for a select list --->
    <cffunction name="versions_sel" access="remote" returntype="query" output="false" hint="Get a list of versions for a select list.">
        <cfquery name="vers">
            SELECT verid AS id, 
                   CONCAT(major, '.', minor, '.', patch, '.', version, '.', build, ' - ', versiontype) AS name 
            FROM taoversions 
            ORDER BY major, minor, patch, version
        </cfquery>
        <!--- Return the query result --->
        <cfreturn vers />
    </cffunction>

</cfcomponent>


