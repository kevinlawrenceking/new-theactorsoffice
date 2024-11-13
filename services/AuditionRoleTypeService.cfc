<cfcomponent displayname="AuditionRoleTypeService" hint="Handles operations for AuditionRoleType table" output="false"> 

<cffunction name="SELaudroletypes" access="public" returntype="query">
    <cfargument name="audcatid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT audroletypeid AS id, audroletype AS name
        FROM audroletypes
        WHERE audcatid = <cfquery result="result" param value="#arguments.audcatid#" cfsqltype="CF_SQL_INTEGER">
        AND isdeleted = <cfquery result="result" param value="false" cfsqltype="CF_SQL_BIT">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="INSaudroletypes" access="public" returntype="void">
    <cfargument name="new_audroletype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO audroletypes (audroletype, audCatid, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audroletype#" maxlength="100">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDaudroletypes" access="public" returntype="void">
    <cfargument name="new_audroletype" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audroletypeid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audroletypes 
        SET 
            audroletype = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audroletype)#" maxlength="100">,
            audCatid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#">,
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">
        WHERE 
            audroletypeid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audroletypeid#">
    </cfquery>
</cffunction>

</cfcomponent>