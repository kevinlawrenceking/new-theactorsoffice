<cfcomponent displayname="AuditionQuestionsDefaultService" hint="Handles operations for AuditionQuestionsDefault table" output="false"> 
<cffunction name="INSaudquestions_default" access="public" returntype="void">
    <cfargument name="new_qTypeID" type="numeric" required="true">
    <cfargument name="new_qtext" type="string" required="true">
    <cfargument name="new_qorder" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO audquestions_default (qTypeID, qtext, qorder, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qTypeID#">,
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtext#" maxlength="500">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qorder#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDaudquestions_default" access="public" returntype="void">
    <cfargument name="new_qTypeID" type="numeric" required="true">
    <cfargument name="new_qtext" type="string" required="true">
    <cfargument name="new_qorder" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_qID" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audquestions_default 
        SET 
            qTypeID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qTypeID#">,
            qtext = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtext#" maxlength="500">,
            qorder = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qorder#">,
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">
        WHERE 
            qID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#">
    </cfquery>
</cffunction>
</cfcomponent>