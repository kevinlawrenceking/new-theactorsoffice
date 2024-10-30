<cfcomponent displayname="UploadService" hint="Handles operations for Upload table" output="false"> 
<cffunction name="INSuploads" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO uploads (userid) 
            VALUES (<cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">)
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in insertUpload: #cfcatch.message# Query: INSERT INTO uploads (userid) VALUES (#arguments.userid#)">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETuploads" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT uploadid, `TIMESTAMP`, userid, uploadstatus
            FROM uploads
            WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error in getUploadDetails: #cfcatch.message# Query: SELECT uploadid, `TIMESTAMP`, userid, uploadstatus FROM uploads WHERE uploadid = ? Parameters: #arguments.uploadid#">
            <cfreturn queryNew("uploadid,TIMESTAMP,userid,uploadstatus", "integer,timestamp,varchar,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
