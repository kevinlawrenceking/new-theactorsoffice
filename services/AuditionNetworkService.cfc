<cfcomponent displayname="AuditionNetworkService" hint="Handles operations for AuditionNetwork table" output="false"> 
<cffunction name="INSaudnetworks" access="public" returntype="void">
    <cfargument name="new_network" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cfquery result="result" >
        INSERT INTO audnetworks (network, audCatid, isDeleted)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_network#" maxlength="100" null="#NOT len(trim(arguments.new_network))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
            <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        )
    </cfquery>
</cffunction>
<cffunction name="UPDaudnetworks" access="public" returntype="void">
    <cfargument name="new_network" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_networkid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audnetworks 
        SET 
            network = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_network#" maxlength="100" null="#NOT len(trim(arguments.new_network))#">,
            audCatid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
            isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
        WHERE 
            networkid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_networkid#">
    </cfquery>
</cffunction></cfcomponent>