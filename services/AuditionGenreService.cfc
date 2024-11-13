<cfcomponent displayname="AuditionGenreService" hint="Handles operations for AuditionGenre table" output="false"> 
<cffunction name="INSaudgenres" access="public" returntype="void">
    <cfargument name="new_audgenre" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO audgenres (audgenre, audCatid, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audgenre)#" maxlength="100" null="#NOT len(trim(arguments.new_audgenre))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT arguments.new_audCatid#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT arguments.new_isDeleted#">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDaudgenres" access="public" returntype="void">
    <cfargument name="new_audgenre" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audgenreid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audgenres 
        SET 
            audgenre = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audgenre)#" maxlength="100" null="#NOT len(trim(arguments.new_audgenre))#" />, 
            audCatid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT arguments.new_audCatid#"/>, 
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT arguments.new_isDeleted#"/> 
        WHERE 
            audgenreid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audgenreid#" />
    </cfquery>
</cffunction>
</cfcomponent>