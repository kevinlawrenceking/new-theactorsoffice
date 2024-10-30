<cfcomponent displayname="AuditionSubcategorieService" hint="Handles operations for AuditionSubcategorie table" output="false"> 
<cffunction name="SELaudsubcategories" access="public" returntype="query">
    <cfargument name="new_audcatid" type="numeric" required="true">
    <cfargument name="audsubcatname" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audsubcategories 
            WHERE audcatid = <cfqueryparam value="#arguments.new_audcatid#" cfsqltype="CF_SQL_INTEGER"> 
            AND audsubcatname = <cfqueryparam value="#arguments.audsubcatname#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudSubcategories: #cfcatch.message# Query: SELECT * FROM audsubcategories WHERE audcatid = ? AND audsubcatname = ? Parameters: #arguments.new_audcatid#, #arguments.audsubcatname#">
            <cfthrow message="Database error occurred. Please contact support." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSaudsubcategories" access="public" returntype="void">
    <cfargument name="new_audSubCatName" type="string" required="true">
    <cfargument name="new_audCatId" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audsubcategories (audSubCatName, audCatId, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audSubCatName#" maxlength="100" null="#NOT len(trim(arguments.new_audSubCatName))#" />,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatId#" null="#NOT len(trim(arguments.new_audCatId))#" />,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#" />
            );
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudSubCategory: #cfcatch.message# Query: INSERT INTO audsubcategories (audSubCatName, audCatId, isDeleted) VALUES (#arguments.new_audSubCatName#, #arguments.new_audCatId#, #arguments.new_isDeleted#)" />
            <cfthrow message="Error inserting into audsubcategories." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudsubcategories" access="public" returntype="void">
    <cfargument name="new_audSubCatName" type="string" required="true">
    <cfargument name="new_audCatId" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audSubCatId" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audsubcategories 
            SET 
                audSubCatName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audSubCatName)#" maxlength="100" null="#NOT len(trim(arguments.new_audSubCatName))#">,
                audCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatId#" null="#NOT len(trim(arguments.new_audCatId))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audSubCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audSubCatId#">
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error updating audsubcategories: #cfcatch.message# - Query: UPDATE audsubcategories SET audSubCatName, audCatId, isDeleted WHERE audSubCatId. Parameters: new_audSubCatName=#arguments.new_audSubCatName#, new_audCatId=#arguments.new_audCatId#, new_isDeleted=#arguments.new_isDeleted#, new_audSubCatId=#arguments.new_audSubCatId#">
        <cfthrow message="An error occurred while updating the subcategory." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
