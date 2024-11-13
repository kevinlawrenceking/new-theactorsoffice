<cfcomponent displayname="UploadService" hint="Handles operations for Upload table" output="false"> 
<cffunction name="INSuploads" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery>
        INSERT INTO uploads (userid) 
        VALUES (<cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">)
    </cfquery>
</cffunction>
<cffunction name="DETuploads" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT uploadid, `TIMESTAMP`, userid, uploadstatus
        FROM uploads
        WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>