<cfcomponent displayname="AuditionVocalTypeService" hint="Handles operations for AuditionVocalType table" output="false"> 
<cffunction name="SELaudvocaltypes" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT vocaltypeid, vocaltype 
            FROM audvocaltypes 
            WHERE isdeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY vocaltype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getVocalTypes: #cfcatch.message#">
            <cfset result = queryNew("vocaltypeid,vocaltype", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudvocaltypes" access="public" returntype="void">
    <cfargument name="new_vocaltype" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audvocaltypes (vocaltype, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_vocaltype)#" maxlength="100" null="#NOT len(trim(arguments.new_vocaltype))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertVocalType: #cfcatch.message# - Query: INSERT INTO audvocaltypes (vocaltype, isDeleted) VALUES (?, ?)" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudvocaltypes" access="public" returntype="void">
    <cfargument name="new_vocaltype" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_vocaltypeid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audvocaltypes 
            SET vocaltype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_vocaltype#" maxlength="100" null="#NOT len(trim(arguments.new_vocaltype))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE vocaltypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_vocaltypeid#">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audvocaltypes: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the vocal type." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
