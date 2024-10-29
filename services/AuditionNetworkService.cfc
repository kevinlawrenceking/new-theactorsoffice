<cfcomponent displayname="AuditionNetworkService" hint="Handles operations for AuditionNetwork table" output="false"> 
<cffunction name="insertIntoAudnetworks" access="public" returntype="void">
    <cfargument name="new_network" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audnetworks (network, audCatid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_network#" maxlength="100" null="#NOT len(trim(arguments.new_network))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertIntoAudnetworks: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting into audnetworks." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateAudNetworks" access="public" returntype="void">
    <cfargument name="new_network" type="string" required="true">
    <cfargument name="new_audCatid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_networkid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audnetworks 
            SET 
                network = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_network#" maxlength="100" null="#NOT len(trim(arguments.new_network))#">,
                audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatid#" null="#NOT len(trim(arguments.new_audCatid))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                networkid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_networkid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audnetworks: #cfcatch.message#" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
