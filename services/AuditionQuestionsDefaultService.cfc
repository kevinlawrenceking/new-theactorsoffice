<cfcomponent displayname="AuditionQuestionsDefaultService" hint="Handles operations for AuditionQuestionsDefault table" output="false"> 
<cffunction name="INSaudquestions_default" access="public" returntype="void">
    <cfargument name="new_qTypeID" type="any" required="true">
    <cfargument name="new_qtext" type="string" required="true">
    <cfargument name="new_qorder" type="any" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audquestions_default (qTypeID, qtext, qorder, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qTypeID#" null="#NOT len(trim(arguments.new_qTypeID))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtext#" maxlength="500" null="#NOT len(trim(arguments.new_qtext))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qorder#" null="#NOT len(trim(arguments.new_qorder))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error inserting into audquestions_default: #cfcatch.message#" />
        <cfrethrow />
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudquestions_default" access="public" returntype="void">
    <cfargument name="new_qTypeID" type="numeric" required="true">
    <cfargument name="new_qtext" type="string" required="true">
    <cfargument name="new_qorder" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_qID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audquestions_default 
            SET 
                qTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qTypeID#" null="#NOT len(trim(arguments.new_qTypeID))#">,
                qtext = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtext#" maxlength="500" null="#NOT len(trim(arguments.new_qtext))#">,
                qorder = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qorder#" null="#NOT len(trim(arguments.new_qorder))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audquestions_default: #cfcatch.message# Query: #cfcatch.query# Parameters: #serializeJSON(arguments)#">
            <cfthrow message="Database update failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
