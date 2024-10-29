<cfcomponent displayname="AuditionMediaXRefService" hint="Handles operations for AuditionMediaXRef table" output="false"> 
<cffunction name="insertAudmediaAuditionsXref" access="public" returntype="void">
    <cfargument name="new_mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audmedia_auditions_xref (mediaid, audprojectid)
            VALUES (
                <cfqueryparam value="#arguments.new_mediaid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudmediaAuditionsXref: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting data into audmedia_auditions_xref." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="deleteAudMediaAuditionsXref" access="public" returntype="void">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audmedia_auditions_xref
            WHERE mediaid = <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
            AND audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteAudMediaAuditionsXref: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAudmediaAuditionsXref" access="public" returntype="void">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audmedia_auditions_xref (mediaid, audprojectid)
            VALUES (
                <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudmediaAuditionsXref: #cfcatch.message#">
            <cflog file="application" text="Query: INSERT INTO audmedia_auditions_xref (mediaid, audprojectid) VALUES (#arguments.mediaid#, #arguments.audprojectid#)">
            <cflog file="application" text="Stack Trace: #cfcatch.stackTrace#">
            <cfthrow message="An error occurred while inserting into audmedia_auditions_xref." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getAuditionsByMediaAndProject" access="public" returntype="query">
    <cfargument name="new_mediaID" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audmedia_auditions_xref 
            WHERE mediaid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaID#" null="#NOT len(trim(arguments.new_mediaID))#"> 
            AND audprojectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.audprojectid#" null="#NOT len(trim(arguments.audprojectid))#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionsByMediaAndProject: #cfcatch.message# Query: SELECT * FROM audmedia_auditions_xref WHERE mediaid = ? AND audprojectid = ? Parameters: #arguments.new_mediaID#, #arguments.audprojectid#">
            <cfthrow message="An error occurred while retrieving auditions." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertAuditionMedia" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="new_mediaID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audmedia_auditions_xref (audprojectid, mediaid)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.audprojectid#" null="#NOT len(trim(arguments.audprojectid))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaID#" null="#NOT len(trim(arguments.new_mediaID))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionMedia: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
