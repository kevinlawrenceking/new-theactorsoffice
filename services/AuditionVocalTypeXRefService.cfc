<cfcomponent displayname="AuditionVocalTypeXRefService" hint="Handles operations for AuditionVocalTypeXRef table" output="false"> 

<cffunction name="SELaudvocaltypes_audition_xref" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM audvocaltypes_audition_xref 
        WHERE audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER"> 
        AND vocaltypeid = <cfquery result="result" param value="#arguments.new_vocaltypeid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="DELaudvocaltypes_audition_xref" access="public" returntype="void">
    <cfargument name="audroleid" type="numeric" required="true">

    <cfquery result="result" >
        DELETE FROM audvocaltypes_audition_xref
        WHERE audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudvocaltypes_audition_xref" access="public" returntype="void">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO audvocaltypes_audition_xref (vocaltypeid, audroleid)
        VALUES (
            <cfquery result="result" param value="#arguments.new_vocaltypeid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="INSaudvocaltypes_audition_xref_24613" access="public" returntype="void">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO audvocaltypes_audition_xref (audRoleID, vocaltypeid)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_vocaltypeid#" null="#NOT len(trim(arguments.new_vocaltypeid))#">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDaudvocaltypes_audition_xref" access="public" returntype="void" output="false">
    <cfargument name="new_audRoleID" type="numeric" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">
    <cfargument name="new_id" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audvocaltypes_audition_xref
        SET 
            audRoleID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#" null="#NOT len(trim(arguments.new_audRoleID))#">,
            vocaltypeid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_vocaltypeid#" null="#NOT len(trim(arguments.new_vocaltypeid))#">
        WHERE 
            id = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_id#" null="#NOT len(trim(arguments.new_id))#">
    </cfquery>
</cffunction>

</cfcomponent>