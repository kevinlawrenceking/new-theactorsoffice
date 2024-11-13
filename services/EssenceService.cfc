<cfcomponent displayname="EssenceService" hint="Handles operations for Essence table" output="false"> 
<cffunction name="SELessences" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT *
        FROM essences e
        INNER JOIN audessences_audtion_xref x ON x.essenceid = e.essenceid
        WHERE x.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="UPDessences" access="public" returntype="void">
    <cfargument name="new_essenceid" type="numeric" required="true">
    <cfquery result="result" >
        UPDATE essences
        SET isdeleted = 1
        WHERE essenceid = <cfquery result="result" param value="#arguments.new_essenceid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSessences" access="public" returntype="void">
    <cfargument name="new_essenceName" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfquery result="result" >
        INSERT INTO essences (essenceName, userID)
        VALUES (
            <cfquery result="result" param value="#arguments.new_essenceName#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="DETessences" access="public" returntype="query">
    <cfargument name="essenceid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT *
        FROM essences
        WHERE essenceid = <cfquery result="result" param value="#arguments.essenceid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="UPDessences_24181" access="public" returntype="void">
    <cfargument name="new_essenceName" type="string" required="true">
    <cfargument name="isdeleted" type="boolean" required="true">
    <cfargument name="essenceid" type="numeric" required="true">
    <cfquery result="result" >
        UPDATE essences 
        SET essenceName = <cfquery result="result" param value="#arguments.new_essenceName#" cfsqltype="CF_SQL_VARCHAR">, 
            isDeleted = <cfquery result="result" param value="#arguments.isdeleted#" cfsqltype="CF_SQL_BIT">
        WHERE essenceid = <cfquery result="result" param value="#arguments.essenceid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELessences_24270" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT essenceid, essencename
        FROM essences
        WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND isdeleted = 0
        ORDER BY essencename
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="SELessences_24282" access="public" returntype="query">
    <cfargument name="new_essence" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT essenceid AS new_essenceid
        FROM essences
        WHERE essencename = <cfquery result="result" param value="#arguments.new_essence#" cfsqltype="CF_SQL_VARCHAR">
        AND userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        AND isdeleted = 0
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="INSessences_24283" access="public" returntype="void">
    <cfargument name="new_essence" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfquery result="result" >
        INSERT INTO essences (essenceName, userid, isdeleted)
        VALUES (
            <cfquery result="result" param value="#arguments.new_essence#" cfsqltype="CF_SQL_VARCHAR">,
            <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            0
        )
    </cfquery>
</cffunction>

<cffunction name="SELessences_24658" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT 
            e.essenceid AS ID, 
            e.essencename AS NAME, 
            e.userid 
        FROM 
            essences e 
        WHERE 
            e.userID = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND isdeleted = 0
        ORDER BY 
            e.essencename
    </cfquery>
    <cfreturn result>
</cffunction>
</cfcomponent>