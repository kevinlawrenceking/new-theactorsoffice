<cfcomponent displayname="AuditionRoleService" hint="Handles operations for AuditionRole table" output="false"> 
<cffunction name="SELaudroles" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, 
                r.audprojectid, 
                r.auddialectid, 
                r.audRoleName, 
                r.charDescription, 
                r.holdStartDate, 
                r.holdEndDate, 
                rt.audroletype, 
                r.audroletypeid, 
                di.auddialect, 
                s.audsource, 
                r.audsourceid, 
                r.payrate, 
                r.netincome, 
                r.buyout, 
                i.incometype, 
                r.iscallback, 
                r.isredirect, 
                r.ispin, 
                r.isbooked
            FROM audroles r
            LEFT OUTER JOIN audroletypes rt ON (r.audRoleTypeID = rt.audroletypeid)
            LEFT OUTER JOIN auddialects di ON (r.audDialectID = di.auddialectid)
            LEFT OUTER JOIN audsources s ON (r.audsourceid = s.audsourceid)
            LEFT OUTER JOIN incometypes i ON (i.incometypeid = r.incometypeid)
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoleDetails: #cfcatch.message# Query: #cfcatch.Detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudroles" access="public" returntype="void">
    <cfargument name="new_audRoleName" type="string" required="true">
    <cfargument name="new_audprojectID" type="numeric" required="true">
    <cfargument name="new_audRoleTypeID" type="numeric" required="true">
    <cfargument name="new_charDescription" type="string" required="false" default="">
    <cfargument name="new_holdStartDate" type="date" required="false">
    <cfargument name="new_holdEndDate" type="date" required="false">
    <cfargument name="new_audDialectID" type="numeric" required="false">
    <cfargument name="new_audSourceID" type="numeric" required="false">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="false" default=false>
    <cfargument name="isdirect" type="boolean" required="false" default=false>

    <cftry>
        <cfquery result="result"  datasource="#application.datasource#">
            INSERT INTO audroles (
                audRoleName, 
                audprojectID, 
                audRoleTypeID, 
                charDescription, 
                holdStartDate, 
                holdEndDate, 
                audDialectID, 
                audSourceID, 
                userid, 
                isDeleted, 
                isBooked
            ) VALUES (
                <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audRoleName#" maxlength="500">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectID#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleTypeID#">,
                <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_charDescription#" null="#NOT len(trim(arguments.new_charDescription))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_DATE" value="#arguments.new_holdStartDate#" null="#NOT len(trim(arguments.new_holdStartDate))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_DATE" value="#arguments.new_holdEndDate#" null="#NOT len(trim(arguments.new_holdEndDate))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audDialectID#" null="#NOT len(trim(arguments.new_audDialectID))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audSourceID#" null="#NOT len(trim(arguments.new_audSourceID))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.isdirect#">
            )
        </cfquery>
        <cfcatch>
            <cflog file="applicationLogFileName"
                   text="[insertAudRole] Error: #cfcatch.message# - Detail: #cfcatch.detail#"
                   type="error">
            <!--- Handle error appropriately --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles" access="public" returntype="void">
    <cfargument name="audroleid" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  datasource="abod">
            UPDATE audroles
            SET isbooked = 1
            WHERE audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audroles: #cfcatch.message# Query: UPDATE audroles SET isbooked = 1 WHERE audroleid = #arguments.audroleid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudroles_23809" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                c.audcatname, 
                c.audcatid, 
                r.audroleid, 
                r.incometypeid, 
                r.payrate, 
                r.netincome, 
                r.buyout, 
                pc.paycycleid, 
                pc.paycyclename
            FROM 
                audroles r
            INNER JOIN 
                audprojects p ON p.audprojectid = r.audprojectid
            INNER JOIN 
                audsubcategories s ON s.audsubcatid = p.audsubcatid
            INNER JOIN 
                audcategories c ON c.audcatid = s.audcatid
            LEFT OUTER JOIN 
                audpaycycles pc ON pc.paycycleid = r.paycycleid
            WHERE 
                r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudRoleDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles_23810" access="public" returntype="void">
    <cfargument name="new_audroleid" type="numeric" required="true">
    <cfargument name="new_incometypeid" type="numeric" required="false">
    <cfargument name="new_payrate" type="numeric" required="false">
    <cfargument name="new_netincome" type="numeric" required="false">
    <cfargument name="new_buyout" type="numeric" required="false">
    <cfargument name="new_paycycleid" type="numeric" required="false">

    <cfset var sql = "UPDATE audroles SET audroleid = ?">
    <cfset var params = [ { value=arguments.new_audroleid, cfsqltype="CF_SQL_INTEGER" } ]>

    <cfif structKeyExists(arguments, "new_incometypeid") and len(arguments.new_incometypeid)>
        <cfset sql &= ", incometypeid = ?">
        <cfset arrayAppend(params, { value=arguments.new_incometypeid, cfsqltype="CF_SQL_INTEGER" })>
    </cfif>

    <cfif structKeyExists(arguments, "new_payrate") and len(arguments.new_payrate)>
        <cfset sql &= ", payrate = ?">
        <cfset arrayAppend(params, { value=arguments.new_payrate, cfsqltype="CF_SQL_DECIMAL" })>
    </cfif>

    <cfif structKeyExists(arguments, "new_netincome") and len(arguments.new_netincome)>
        <cfset sql &= ", netincome = ?">
        <cfset arrayAppend(params, { value=arguments.new_netincome, cfsqltype="CF_SQL_DECIMAL" })>
    </cfif>

    <cfif structKeyExists(arguments, "new_buyout") and len(arguments.new_buyout)>
        <cfset sql &= ", buyout = ?">
        <cfset arrayAppend(params, { value=arguments.new_buyout, cfsqltype="CF_SQL_DECIMAL" })>
    </cfif>

    <cfif structKeyExists(arguments, "new_paycycleid") and len(arguments.new_paycycleid)>
        <cfset sql &= ", paycycleid = ?">
        <cfset arrayAppend(params, { value=arguments.new_paycycleid, cfsqltype="CF_SQL_INTEGER" })>
    </cfif>

    <cfset sql &= " WHERE audroleid = ?">
    <cfset arrayAppend(params, { value=arguments.new_audroleid, cfsqltype="CF_SQL_INTEGER" })>

    <cftry>
        <cfquery result="result"  datasource="#abod#" name="updateQuery">
            #sql#
            <cfloop array="#params#" index="param">
                <cfquery result="result" param value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating audroles: #cfcatch.message#, SQL: #sql#, Params: #serializeJSON(params)#">
            <!--- Handle error appropriately --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles_23813" access="public" returntype="void">
    <cfargument name="statusField" type="string" required="true">
    <cfargument name="newAudRoleId" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  datasource="abod">
            UPDATE audroles 
            SET #arguments.statusField# = <cfquery result="result" param value="0" cfsqltype="CF_SQL_INTEGER"> 
            WHERE audroleid = <cfquery result="result" param value="#arguments.newAudRoleId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error updating audroles status: #cfcatch.message#">
            <cfthrow message="Database update failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles_23814" access="public" returntype="void">
    <cfargument name="statusField" type="string" required="true">
    <cfargument name="newAudroleId" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  name="updateQuery" datasource="abod">
            UPDATE audroles
            SET #arguments.statusField# = <cfquery result="result" param value="1" cfsqltype="CF_SQL_BIT">
            WHERE audroleid = <cfquery result="result" param value="#arguments.newAudroleId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in updateAudrolesStatus: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="Database error occurred while updating audroles status." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudroles_23851" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, 
                r.audprojectid, 
                r.auddialectid, 
                r.audRoleName, 
                r.charDescription, 
                r.holdStartDate, 
                r.holdEndDate, 
                rt.audroletype, 
                r.audroletypeid, 
                e.essencename, 
                di.auddialect, 
                e.essenceID, 
                s.audsource, 
                r.audsourceid, 
                r.payrate, 
                r.netincome, 
                r.buyout, 
                i.incometype, 
                r.iscallback, 
                r.isredirect, 
                r.ispin, 
                r.isbooked
            FROM audroles r
            LEFT OUTER JOIN audroletypes rt ON (r.audRoleTypeID = rt.audroletypeid)
            LEFT OUTER JOIN auddialects di ON (r.audDialectID = di.auddialectid)
            LEFT OUTER JOIN essences e ON (r.essenceID = e.essenceID)
            LEFT OUTER JOIN audsources s ON (r.audsourceid = s.audsourceid)
            LEFT OUTER JOIN incometypes i ON (i.incometypeid = r.incometypeid)
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoleDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="DETaudroles" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, 
                r.audprojectid, 
                r.auddialectid, 
                r.audRoleName, 
                r.charDescription, 
                r.holdStartDate, 
                r.holdEndDate, 
                rt.audroletype, 
                r.audroletypeid, 
                di.auddialect, 
                s.audsource, 
                r.audsourceid, 
                subcat.audcatid, 
                proj.audprojectid
            FROM audroles r
            LEFT OUTER JOIN audroletypes rt ON (r.audRoleTypeID = rt.audroletypeid)
            LEFT OUTER JOIN auddialects di ON (r.audDialectID = di.auddialectid)
            LEFT OUTER JOIN audsources s ON (r.audsourceid = s.audsourceid)
            INNER JOIN audprojects proj ON proj.audprojectid = proj.audprojectid
            INNER JOIN audsubcategories subcat ON (proj.audSubCatID = subcat.audSubCatId)
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoles: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving roles." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudroles_24086" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, 
                r.audprojectid, 
                r.auddialectid, 
                r.audRoleName, 
                r.charDescription, 
                r.holdStartDate, 
                r.holdEndDate, 
                rt.audroletype, 
                r.audroletypeid, 
                di.auddialect, 
                s.audsource, 
                r.audsourceid, 
                subcat.audcatid, 
                proj.audprojectid
            FROM audroles r
            LEFT OUTER JOIN audroletypes rt ON (r.audRoleTypeID = rt.audroletypeid)
            LEFT OUTER JOIN auddialects di ON (r.audDialectID = di.auddialectid)
            LEFT OUTER JOIN audsources s ON (r.audsourceid = s.audsourceid)
            INNER JOIN audprojects proj ON proj.audprojectid = proj.audprojectid
            INNER JOIN audsubcategories subcat ON (proj.audSubCatID = subcat.audSubCatId)
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoleDetails: #cfcatch.message#">
            <cfthrow message="An error occurred while fetching role details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudroles_24090" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, 
                r.audprojectid, 
                r.auddialectid, 
                r.audRoleName, 
                r.charDescription, 
                r.holdStartDate, 
                r.holdEndDate, 
                rt.audroletype, 
                r.audroletypeid, 
                di.auddialect, 
                s.audsource, 
                r.audsourceid, 
                r.contactid, 
                r.payrate, 
                r.netincome, 
                r.buyout, 
                i.incometype, 
                r.iscallback, 
                r.isredirect, 
                r.ispin, 
                r.isbooked, 
                c.recordname AS contactname, 
                p.paycycleid, 
                p.paycyclename
            FROM audroles r
            LEFT OUTER JOIN audroletypes rt ON (r.audRoleTypeID = rt.audroletypeid)
            LEFT OUTER JOIN auddialects di ON (r.audDialectID = di.auddialectid)
            LEFT OUTER JOIN audsources s ON (r.audsourceid = s.audsourceid)
            LEFT OUTER JOIN incometypes i ON i.incometypeid = r.incometypeid
            LEFT OUTER JOIN contactdetails c ON c.contactid = r.contactid
            LEFT OUTER JOIN audpaycycles p ON p.paycycleid = r.paycycleid
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in getRoleDetails: #cfcatch.message# Query: #cfcatch.detail#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudroles_24122" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, 
                r.audprojectid, 
                r.auddialectid, 
                r.audRoleName, 
                r.charDescription, 
                r.holdStartDate, 
                r.holdEndDate, 
                rt.audroletype, 
                r.audroletypeid, 
                di.auddialect, 
                s.audsource, 
                r.audsourceid, 
                r.contactid, 
                r.payrate, 
                r.netincome, 
                r.buyout, 
                i.incometype, 
                r.iscallback, 
                r.isredirect, 
                r.ispin, 
                r.isbooked, 
                c.recordname AS contactname
            FROM audroles r
            LEFT OUTER JOIN audroletypes rt ON (r.audRoleTypeID = rt.audroletypeid)
            LEFT OUTER JOIN auddialects di ON (r.audDialectID = di.auddialectid)
            LEFT OUTER JOIN audsources s ON (r.audsourceid = s.audsourceid)
            LEFT OUTER JOIN incometypes i ON (i.incometypeid = r.incometypeid)
            LEFT OUTER JOIN contactdetails c ON (c.contactid = r.contactid)
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getRoleDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfset result = queryNew("audroleid,audprojectid,auddialectid,audRoleName,charDescription,holdStartDate,holdEndDate,audroletype,audroletypeid,auddialect,audsource,audsourceid,contactid,payrate,netincome,buyout,incometype,iscallback,isredirect,ispin,isbooked,contactname")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDaudroles_24126" access="public" returntype="void" output="false">
    <cfargument name="audroleid" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  datasource="abod">
            UPDATE audroles
            SET isdeleted = 1
            WHERE audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audroles: #cfcatch.message# Query: UPDATE audroles SET isdeleted = 1 WHERE audroleid = #arguments.audroleid#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudroles_24165" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="submitsiteid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM audroles
            WHERE userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND submitsiteid = <cfquery result="result" param value="#arguments.submitsiteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoles: #cfcatch.message# Query: SELECT * FROM audroles WHERE userid = ? AND submitsiteid = ? Parameters: userid=#arguments.userid#, submitsiteid=#arguments.submitsiteid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDaudroles_24260" access="public" returntype="void">
    <cfargument name="new_iscallback" type="boolean" required="true">
    <cfargument name="new_isredirect" type="boolean" required="true">
    <cfargument name="new_ispin" type="boolean" required="true">
    <cfargument name="new_isbooked" type="boolean" required="true">
    <cfargument name="audroleid" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  datasource="abod">
            UPDATE audroles
            SET iscallback = <cfquery result="result" param value="#arguments.new_iscallback#" cfsqltype="CF_SQL_BIT">,
                isredirect = <cfquery result="result" param value="#arguments.new_isredirect#" cfsqltype="CF_SQL_BIT">,
                ispin = <cfquery result="result" param value="#arguments.new_ispin#" cfsqltype="CF_SQL_BIT">,
                isbooked = <cfquery result="result" param value="#arguments.new_isbooked#" cfsqltype="CF_SQL_BIT">
            WHERE audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating audroles: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the record.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles_24299" access="public" returntype="void" output="false">
    <cfargument name="new_audRoleName" type="string" required="true">
    <cfargument name="new_opencallid" type="numeric" required="true">
    <cfargument name="new_audRoleTypeID" type="numeric" required="true">
    <cfargument name="new_charDescription" type="string" required="true">
    <cfargument name="new_audDialectID" type="numeric" required="true">
    <cfargument name="new_audSourceID" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="false" default="">
    <cfargument name="new_submitsiteid" type="numeric" required="false" default="">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audRoleID" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  datasource="#application.datasource#" name="updateQuery">
            UPDATE audroles 
            SET 
                audRoleName = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audRoleName#" maxlength="500" null="#NOT len(trim(arguments.new_audRoleName))#">,
                opencallid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_opencallid#" null="#NOT len(trim(arguments.new_opencallid))#">,
                audRoleTypeID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleTypeID#" null="#NOT len(trim(arguments.new_audRoleTypeID))#">,
                charDescription = <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_charDescription#" null="#NOT len(trim(arguments.new_charDescription))#">,
                audDialectID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audDialectID#" null="#NOT len(trim(arguments.new_audDialectID))#">,
                audSourceID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audSourceID#" null="#NOT len(trim(arguments.new_audSourceID))#">,
                <cfif len(trim(arguments.new_contactid))>
                    contactid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contactid#" null="#NOT len(trim(arguments.new_contactid))#">,
                </cfif>
                <cfif len(trim(arguments.new_submitsiteid))>
                    submitsiteid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_submitsiteid#" null="#NOT len(trim(arguments.new_submitsiteid))#">,
                </cfif>
                isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audRoleID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#">
        </cfquery>
        <cfcatch>
            <cflog file="applicationLog" text="[Error] Failed to update audroles: #cfcatch.message#. Query: #updateQuery.sql#. Parameters: #serializeJSON(arguments)#">
            <!--- Handle error appropriately --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudroles_24372" access="public" returntype="void">
    <cfargument name="new_audRoleName" type="string" required="true">
    <cfargument name="new_audprojectID" type="numeric" required="true">
    <cfargument name="new_charDescription" type="string" required="false" default="">
    <cfargument name="new_audSourceID" type="numeric" required="false" default="">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="false" default=false>
    <cfargument name="isbooked" type="boolean" required="false" default=false>
    <cfargument name="isCallback" type="boolean" required="false" default=false>
    <cfargument name="ispin" type="boolean" required="false" default=false>
    <cfargument name="isredirect" type="boolean" required="false" default=false>

    <cftry>
        <cfquery result="result"  datasource="#application.datasource#">
            INSERT INTO audroles (
                audRoleName, 
                audprojectID, 
                charDescription, 
                audSourceID, 
                userid, 
                isDeleted, 
                isBooked, 
                isCallback, 
                ispin, 
                isredirect
            ) VALUES (
                <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audRoleName#" maxlength="500">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectID#">,
                <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_charDescription#" null="#NOT len(trim(arguments.new_charDescription))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audSourceID#" null="#NOT len(trim(arguments.new_audSourceID))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.isbooked#" null="#NOT len(trim(arguments.isbooked))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.isCallback#" null="#NOT len(trim(arguments.isCallback))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.ispin#" null="#NOT len(trim(arguments.ispin))#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.isredirect#" null="#NOT len(trim(arguments.isredirect))#">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application_errors.log"
                   text="[insertAudRole] Error: #cfcatch.message#, Detail: #cfcatch.detail#, Query: INSERT INTO audroles...">
            <cfthrow message="[insertAudRole] Database operation failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles_24542" access="public" returntype="void">
    <cfargument name="audsourceid" type="numeric" required="true">
    
    <cftry>
        <cfquery result="result"  datasource="abod">
            UPDATE audroles 
            SET submitsiteid = NULL, contactid = NULL, opencallid = NULL 
            WHERE audsourceid = <cfquery result="result" param value="#arguments.audsourceid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audroles: #cfcatch.message# Query: #cfcatch.query#">
            <cfthrow message="An error occurred while updating the database.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudroles_24544" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                r.audroleid, r.audprojectid, r.auddialectid, r.audRoleName, 
                r.charDescription, r.holdStartDate, r.holdEndDate, rt.audroletype, 
                r.audroletypeid, di.auddialect, s.audsource, r.audsourceid, 
                r.contactid, r.payrate, r.netincome, r.buyout, i.incometype, 
                r.iscallback, r.isredirect, r.ispin, r.isbooked, r.opencallid, 
                c.recordname AS contactname, p.paycycleid, p.paycyclename, 
                b.submitsiteid, b.submitsitename, o.opencallname
            FROM audroles r
            LEFT JOIN audsubmitsites_user b ON r.submitsiteid = b.submitsiteid
            LEFT JOIN audroletypes rt ON r.audRoleTypeID = rt.audroletypeid
            LEFT JOIN auddialects_user di ON r.audDialectID = di.auddialectid
            LEFT JOIN audsources s ON r.audsourceid = s.audsourceid
            LEFT JOIN incometypes i ON i.incometypeid = r.incometypeid
            LEFT JOIN contactdetails c ON c.contactid = r.contactid
            LEFT JOIN audpaycycles p ON p.paycycleid = r.paycycleid
            LEFT JOIN audopencalloptions_user o ON o.opencallid = r.opencallid
            WHERE r.audroleid = <cfquery result="result" param value="#arguments.audroleid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudRoles: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudroles_24593" access="public" returntype="void">
    <cfargument name="new_audRoleName" type="string" required="true">
    <cfargument name="new_audprojectID" type="numeric" required="true">
    <cfargument name="new_audRoleTypeID" type="numeric" required="true">
    <cfargument name="new_charDescription" type="string" required="false">
    <cfargument name="new_holdStartDate" type="date" required="false">
    <cfargument name="new_holdEndDate" type="date" required="false">
    <cfargument name="new_audDialectID" type="numeric" required="false">
    <cfargument name="new_audSourceID" type="numeric" required="false">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="isbooked" type="boolean" required="true">
    <cfargument name="isCallback" type="boolean" required="true">
    <cfargument name="ispin" type="boolean" required="true">
    <cfargument name="isredirect" type="boolean" required="true">

    <cftry>
        <cfquery result="result"  datasource="#application.datasource#">
            INSERT INTO audroles (
                audRoleName, 
                audprojectID, 
                audRoleTypeID, 
                charDescription, 
                holdStartDate, 
                holdEndDate,
                <cfif len(trim(arguments.new_audDialectID))>audDialectID,</cfif>
                <cfif len(trim(arguments.new_audSourceID))>audSourceID,</cfif>
                userid, 
                isDeleted, 
                isBooked, 
                isCallback, 
                ispin, 
                isredirect
            ) VALUES (
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_audRoleName)), 'CF_SQL_VARCHAR', 'CF_SQL_VARCHAR')#" value="#arguments.new_audRoleName#" maxlength="500">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_audprojectID)), 'CF_SQL_INTEGER', 'CF_SQL_INTEGER')#" value="#arguments.new_audprojectID#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_audRoleTypeID)), 'CF_SQL_INTEGER', 'CF_SQL_INTEGER')#" value="#arguments.new_audRoleTypeID#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_charDescription)), 'CF_SQL_LONGVARCHAR', 'CF_SQL_LONGVARCHAR')#" value="#arguments.new_charDescription#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_holdStartDate)), 'CF_SQL_DATE', 'CF_SQL_DATE')#" value="#arguments.new_holdStartDate#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_holdEndDate)), 'CF_SQL_DATE', 'CF_SQL_DATE')#" value="#arguments.new_holdEndDate#">,
                <cfif len(trim(arguments.new_audDialectID))>
                    <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_audDialectID)), 'CF_SQL_INTEGER', 'CF_SQL_INTEGER')#" value="#arguments.new_audDialectID#">,
                </cfif>
                <cfif len(trim(arguments.new_audSourceID))>
                    <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_audSourceID)), 'CF_SQL_INTEGER', 'CF_SQL_INTEGER')#" value="#arguments.new_audSourceID#">,
                </cfif>
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_userid)), 'CF_SQL_INTEGER', 'CF_SQL_INTEGER')#" value="#arguments.new_userid#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.new_isDeleted)), 'CF_SQL_BIT', 'CF_SQL_BIT')#" value="#arguments.new_isDeleted#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.isbooked)), 'CF_SQL_BIT', 'CF_SQL_BIT')#" value="#arguments.isbooked#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.isCallback)), 'CF_SQL_BIT', 'CF_SQL_BIT')#" value="#arguments.isCallback#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.ispin)), 'CF_SQL_BIT', 'CF_SQL_BIT')#" value="#arguments.ispin#">,
                <cfquery result="result" param cfsqltype="#iif(len(trim(arguments.isredirect)), 'CF_SQL_BIT', 'CF_SQL_BIT')#" value="#arguments.isredirect#">
            )
        </cfquery>
        <cflog file="application_log" text="[INFO] Inserted new record into audroles table. User ID: #arguments.new_userid#."/>
    <cfcatch>
        <cflog file="error_log" text="[ERROR] Failed to insert record into audroles table. Error: #cfcatch.message#. User ID: #arguments.new_userid#. Query: #cffunctionname#. Parameters: #serializejson(arguments)#"/>
        <!--- Handle error appropriately --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudroles_24594" access="public" returntype="void">
    <cfargument name="new_audRoleName" type="string" required="true">
    <cfargument name="new_audprojectID" type="numeric" required="true">
    <cfargument name="new_audRoleTypeID" type="numeric" required="true">
    <cfargument name="new_charDescription" type="string" required="false">
    <cfargument name="new_holdStartDate" type="date" required="false">
    <cfargument name="new_holdEndDate" type="date" required="false">
    <cfargument name="new_audDialectID" type="numeric" required="true">
    <cfargument name="new_audSourceID" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audRoleID" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  datasource="#application.datasource#">
            UPDATE audroles 
            SET 
                audRoleName = <cfquery result="result" param cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_audRoleName)#" maxlength="500" null="#NOT len(trim(arguments.new_audRoleName))#">,
                audprojectID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectID#" null="#NOT len(trim(arguments.new_audprojectID))#">,
                audRoleTypeID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleTypeID#" null="#NOT len(trim(arguments.new_audRoleTypeID))#">,
                charDescription = <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#trim(arguments.new_charDescription)#" null="#NOT len(trim(arguments.new_charDescription))#">,
                holdStartDate = <cfquery result="result" param cfsqltype="CF_SQL_DATE" value="#arguments.new_holdStartDate#" null="#NOT len(trim(arguments.new_holdStartDate))#">,
                holdEndDate = <cfquery result="result" param cfsqltype="CF_SQL_DATE" value="#arguments.new_holdEndDate#" null="#NOT len(trim(arguments.new_holdEndDate))#">,
                audDialectID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audDialectID#" null="#NOT len(trim(arguments.new_audDialectID))#">,
                audSourceID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audSourceID#" null="#NOT len(trim(arguments.new_audSourceID))#">,
                userid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#">,
                isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audRoleID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audRoleID#">
        </cfquery>
        <cfcatch>
            <cflog file="applicationLog" text="[Error] updateAudRoles failed: #cfcatch.message#, Query: #cfcatch.detail#">
            <!--- Handle error as needed --->
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
