<cfcomponent displayname="AuditionMediaAudRolesXRefService" hint="Handles operations for AuditionMediaAudRolesXRef table" output="false"> 
<cffunction name="INSaudmedia_audroles_xref" access="public" returntype="void">
    <cfargument name="new_mediaid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">
    <cfargument name="new_mediaAudroleDescript" type="string" required="false" default="">
    <cfargument name="new_isDeleted" type="boolean" required="false" default=false>

    <cfquery result="result" >
        INSERT INTO audmedia_audroles_xref (mediaid, audroleid, mediaAudroleDescript, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaid#" null="#NOT len(trim(arguments.new_mediaid))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audroleid#" null="#NOT len(trim(arguments.new_audroleid))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaAudroleDescript#" maxlength="500" null="#NOT len(trim(arguments.new_mediaAudroleDescript))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        )
    </cfquery>
</cffunction>
<cffunction name="UPDaudmedia_audroles_xref" access="public" returntype="void">
    <cfargument name="new_mediaid" required="true" type="numeric">
    <cfargument name="new_audroleid" required="true" type="numeric">
    <cfargument name="new_mediaAudroleDescript" required="true" type="string">
    <cfargument name="new_isDeleted" required="true" type="boolean">
    <cfargument name="conditionColumn" required="true" type="string">
    <cfargument name="conditionValue" required="true">

    <cfset var queryResult = "">

    <cfquery result="result"  name="queryResult">
        UPDATE audmedia_audroles_xref 
        SET 
            mediaid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaid#" null="#NOT len(trim(arguments.new_mediaid))#">,
            audroleid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audroleid#" null="#NOT len(trim(arguments.new_audroleid))#">,
            mediaAudroleDescript = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaAudroleDescript#" maxlength="500" null="#NOT len(trim(arguments.new_mediaAudroleDescript))#">,
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        WHERE 
            #arguments.conditionColumn# = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.conditionValue#">
    </cfquery>
</cffunction></cfcomponent>