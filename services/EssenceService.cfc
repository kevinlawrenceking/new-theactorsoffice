<cfcomponent displayname="EssenceService" hint="Handles operations for Essence table" output="false"> 
<cffunction name="SELessences" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM essences e
            INNER JOIN audessences_audtion_xref x ON x.essenceid = e.essenceid
            WHERE x.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEssencesByRole: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDessences" access="public" returntype="void">
    <cfargument name="new_essenceid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE essences
            SET isdeleted = 1
            WHERE essenceid = <cfqueryparam value="#arguments.new_essenceid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating essence: #cfcatch.message#; Query: UPDATE essences SET isdeleted = 1 WHERE essenceid = #arguments.new_essenceid#;">
            <cfthrow message="An error occurred while updating the essence." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSessences" access="public" returntype="void">
    <cfargument name="new_essenceName" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO essences (essenceName, userID)
            VALUES (
                <cfqueryparam value="#arguments.new_essenceName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertEssence function: #cfcatch.message# Query: INSERT INTO essences (essenceName, userID) VALUES (?, ?); Parameters: new_essenceName=#arguments.new_essenceName#, userid=#arguments.userid#">
            <cfthrow message="An error occurred while inserting essence." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETessences" access="public" returntype="query">
    <cfargument name="essenceid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM essences
            WHERE essenceid = <cfqueryparam value="#arguments.essenceid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEssenceById: #cfcatch.message# - Query: SELECT * FROM essences WHERE essenceid = #arguments.essenceid#">
            <cfthrow message="Error retrieving essence by ID." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDessences_24181" access="public" returntype="void">
    <cfargument name="new_essenceName" type="string" required="true">
    <cfargument name="isdeleted" type="boolean" required="true">
    <cfargument name="essenceid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE essences 
            SET essenceName = <cfqueryparam value="#arguments.new_essenceName#" cfsqltype="CF_SQL_VARCHAR">, 
                isDeleted = <cfqueryparam value="#arguments.isdeleted#" cfsqltype="CF_SQL_BIT">
            WHERE essenceid = <cfqueryparam value="#arguments.essenceid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating essence: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the essence.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELessences_24270" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT essenceid, essencename
            FROM essences
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            ORDER BY essencename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEssencesByUserId: #cfcatch.message#" />
            <cfset result = queryNew("essenceid, essencename", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELessences_24282" access="public" returntype="query">
    <cfargument name="new_essence" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT essenceid AS new_essenceid
            FROM essences
            WHERE essencename = <cfqueryparam value="#arguments.new_essence#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND isdeleted = 0
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getEssenceId: #cfcatch.message#">
            <cfset result = queryNew("new_essenceid", "integer")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSessences_24283" access="public" returntype="void">
    <cfargument name="new_essence" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO essences (essenceName, userid, isdeleted)
            VALUES (
                <cfqueryparam value="#arguments.new_essence#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting essence: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting the essence." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELessences_24658" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                e.essenceid AS ID, 
                e.essencename AS NAME, 
                e.userid 
            FROM 
                essences e 
            WHERE 
                e.userID = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND isdeleted IS false 
            ORDER BY 
                e.essencename
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEssences: #cfcatch.message#">
            <cfset result = queryNew("ID, NAME, userid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
