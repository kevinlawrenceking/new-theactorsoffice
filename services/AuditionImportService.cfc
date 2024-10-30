<cfcomponent displayname="AuditionImportService" hint="Handles operations for AuditionImport table" output="false"> 
<cffunction name="RESauditionsimport" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                ai.id, 
                ai.projdate AS col1, 
                ai.projdate AS col1b, 
                ai.projname AS col2, 
                CONCAT(ac.audcatname, ' - ', aisc.audsubcatname) AS col3, 
                ai.audrolename AS col4, 
                ai.audsource AS col5, 
                ai.status AS col6 
            FROM 
                auditionsimport ai 
            INNER JOIN 
                audsubcategories aisc ON ai.audsubcatid = aisc.audsubcatid 
            INNER JOIN 
                audcategories ac ON aisc.audcatid = ac.audcatid 
            WHERE 
                ai.id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionsImportData: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELauditionsimport" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                id, 
                audsubcatid, 
                projdate, 
                projname, 
                audrolename, 
                audsource, 
                cdfirstname, 
                cdlastname, 
                callback_yn, 
                redirect_yn, 
                pin_yn, 
                booked_yn, 
                projdescription, 
                chardescription, 
                note, 
                status
            FROM 
                auditionsimport
            WHERE 
                id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog text="Error in getAuditionImportById: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETauditionsimport" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audprojectid
            FROM auditionsimport
            WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionProjectIds: #cfcatch.message# Query: SELECT audprojectid FROM auditionsimport WHERE uploadid = ? AND status = 'Added' Parameters: uploadid=#arguments.uploadid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="RESauditionsimport_23917" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                ai.id, 
                sc.audsubcatid AS selected_id, 
                p.audprojectid AS recid, 
                ai.uploadid, 
                p.audprojectid, 
                r.audroleid, 
                st.audstep, 
                st.stepcss, 
                r.iscallback, 
                r.isredirect, 
                ca.audcatname, 
                r.ispin, 
                r.isbooked, 
                st.stepcss, 
                'Date' AS head1, 
                'Project' AS head2, 
                'Category' AS head3, 
                'Role' AS head4, 
                'Source' AS head5, 
                'Import Status' AS head6, 
                ai.projdate AS col1, 
                ai.projdate AS col1b, 
                ai.projname AS col2, 
                CONCAT(ai.audcatname, " - ", ai.audsubcatname) AS col3, 
                ai.audrolename AS col4, 
                ai.audsource AS col5, 
                CONCAT(ai.cdfirstname, " ", ai.cdlastname) AS contactname,
                ai.audsubcatname,
                CASE WHEN ai.callback_yn = "y" THEN 'Callback' WHEN ai.redirect_yn = "y" THEN 'Redirect' WHEN ai.pin_yn = "y" THEN 'Pin' WHEN ai.booked_yn = "y" THEN 'Book' ELSE 'Audition' END AS col6a,
                ai.status AS col6
            FROM auditionsimport ai
            LEFT JOIN audprojects p ON p.audprojectID = ai.audprojectID
            LEFT JOIN audroles r ON p.audprojectID = r.audprojectID
            LEFT JOIN events a ON r.audroleid = a.audroleid
            LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
            LEFT JOIN contactdetails c ON c.contactID = p.contactid
            LEFT JOIN contactdetails c2 ON c2.contactID = r.contactid
            LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
            LEFT JOIN audsteps st ON st.audstepid = a.audstepid
            LEFT JOIN audsubcategories sc ON sc.audsubcatid = p.audsubcatid
            LEFT JOIN audcategories ca ON ca.audcatid = sc.audcatid
            LEFT JOIN audcontacts_auditions_xref x ON x.audprojectid = p.audprojectid
            LEFT JOIN contactdetails c3 ON c3.contactid = x.contactid
            WHERE ai.uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionImportData: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELauditionsimport_23919" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="false">
    <cfargument name="timestamp" type="date" required="false">
    
    <cfset var result = "">
    <cfset var sql = "SELECT uploadid, timestamp FROM auditionsimport WHERE 1=1">
    
    <cftry>
        <cfif structKeyExists(arguments, "uploadid")>
            <cfset sql &= " AND uploadid = ?">
        </cfif>
        
        <cfif structKeyExists(arguments, "timestamp")>
            <cfset sql &= " AND timestamp = ?">
        </cfif>
        
        <cfquery name="result" datasource="abod">
            #sql#
            <cfif structKeyExists(arguments, "uploadid")>
                <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            
            <cfif structKeyExists(arguments, "timestamp")>
                <cfqueryparam value="#arguments.timestamp#" cfsqltype="CF_SQL_TIMESTAMP">
            </cfif>
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in getAuditionsImportData: #cfcatch.message# Query: #sql#">
        <cfreturn queryNew("uploadid,timestamp", "integer,date")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELauditionsimport_24352" access="public" returntype="query">
    <cfargument name="isfix" type="string" required="true">
    <cfargument name="recordid" type="numeric" required="false">
    <cfargument name="new_uploadid" type="numeric" required="false">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM auditionsimport
            WHERE 
            <cfif arguments.isfix eq "Y">
                id = <cfqueryparam value="#arguments.recordid#" cfsqltype="CF_SQL_INTEGER">
            <cfelse>
                uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>
        
        <cfcatch>
            <cflog file="errorLog" text="Error in getAuditionsImport: #cfcatch.message# - Query: #cfcatch.query#">
            <cfthrow message="An error occurred while fetching data from auditionsimport.">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDauditionsimport" access="public" returntype="void">
    <cfargument name="new_status" type="string" required="true">
    <cfargument name="id" type="numeric" required="true">

    <cftry>
        <cfquery name="updateStatus" datasource="abod">
            UPDATE auditionsimport 
            SET status = <cfqueryparam value="#arguments.new_status#" cfsqltype="CF_SQL_VARCHAR">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audition status: #cfcatch.message# Query: UPDATE auditionsimport SET status = #arguments.new_status# WHERE id = #arguments.id#">
            <cfthrow message="Error updating audition status." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELauditionsimport_24362" access="public" returntype="query">
    <cfargument name="recordid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM auditionsimport
            WHERE id = <cfqueryparam value="#arguments.recordid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Valid" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getValidAuditionsImport: #cfcatch.message# Query: SELECT * FROM auditionsimport WHERE id = #arguments.recordid# AND status = 'Valid'">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELauditionsimport_24363" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM auditionsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Valid" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getValidAuditionsImport: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDauditionsimport_24374" access="public" returntype="void">
    <cfargument name="new_status" type="string" required="true">
    <cfargument name="new_audprojectid" type="numeric" required="true">
    <cfargument name="id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE auditionsimport 
            SET status = <cfqueryparam value="#arguments.new_status#" cfsqltype="CF_SQL_VARCHAR">, 
                audprojectid = <cfqueryparam value="#arguments.new_audprojectid#" cfsqltype="CF_SQL_INTEGER">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating auditionsimport: #cfcatch.message#">
            <cfthrow message="Error updating auditionsimport" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDauditionsimport_24376" access="public" returntype="void">
    <cfargument name="formData" type="struct" required="true">
    <cfargument name="findData" type="struct" required="true">

    <cftry>
        <cfquery datasource="yourDatasourceName">
            UPDATE auditionsimport 
            SET 
                projDate = <cfqueryparam value="#arguments.formData.projDate#" cfsqltype="CF_SQL_DATE">,
                projName = <cfqueryparam value="#arguments.formData.projName#" cfsqltype="CF_SQL_VARCHAR" maxlength="500">,
                audRoleName = <cfqueryparam value="#arguments.formData.audRoleName#" cfsqltype="CF_SQL_VARCHAR" maxlength="500">,
                audCatName = <cfqueryparam value="#arguments.findData.category#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
                audSubCatName = <cfqueryparam value="#arguments.findData.subcategory#" cfsqltype="CF_SQL_VARCHAR" maxlength="500">,
                audsource = <cfqueryparam value="#arguments.formData.audsource#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
                cdfirstname = <cfqueryparam value="#arguments.formData.cdfirstname#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
                cdlastname = <cfqueryparam value="#arguments.formData.cdlastname#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
                callback_yn = <cfqueryparam value="#arguments.formData.callback_yn#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
                redirect_yn = <cfqueryparam value="#arguments.formData.redirect_yn#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
                pin_yn = <cfqueryparam value="#arguments.formData.pin_yn#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
                booked_yn = <cfqueryparam value="#arguments.formData.booked_yn#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
                projDescription = <cfqueryparam value="#arguments.formData.projDescription#" cfsqltype="CF_SQL_VARCHAR" maxlength="500">,
                charDescription = <cfqueryparam value="#arguments.formData.charDescription#" cfsqltype="CF_SQL_VARCHAR" maxlength="500">,
                note = <cfqueryparam value="#arguments.formData.note#" cfsqltype="CF_SQL_VARCHAR" maxlength="500">,
                status = <cfqueryparam value="#arguments.formData.status#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
                audsubcatid = <cfqueryparam value="#arguments.formData.audsubcatid#" cfsqltype="CF_SQL_INTEGER">
            WHERE 
                ID = <cfqueryparam value="#arguments.formData.recordId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating auditionsimport: #cfcatch.message#">
            <!--- Optionally, rethrow or handle the error as needed --->
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSauditionsimport" access="public" returntype="void">
    <cfargument name="importdata" type="struct" required="true">
    <cfargument name="new_audsubcatid" type="numeric" required="true">
    <cfargument name="new_uploadid" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var params = []>

    <cftry>
        <cfset sql = "INSERT INTO auditionsimport (audsubcatid, uploadid">
        
        <cfif structKeyExists(arguments.importdata, "projDate") and len(trim(arguments.importdata.projDate))>
            <cfset sql &= ", projDate">
        </cfif>
        
        <cfset sql &= ", projName, audRoleName, audCatName, audsubcatname, audsource, cdfirstname, cdlastname, callback_yn, redirect_yn, pin_yn, booked_yn, projDescription, charDescription, note) VALUES (?, ?">

        <cfset arrayAppend(params, {value=arguments.new_audsubcatid, cfsqltype="CF_SQL_INTEGER"})>
        <cfset arrayAppend(params, {value=arguments.new_uploadid, cfsqltype="CF_SQL_INTEGER"})>

        <cfif structKeyExists(arguments.importdata, "projDate") and len(trim(arguments.importdata.projDate))>
            <cfset sql &= ", ?">
            <cfset arrayAppend(params, {value=dateformat(arguments.importdata.projDate, 'yyyy-mm-dd'), cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <cfset sql &= ", ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)">

        <cfset arrayAppend(params, {value=trim(arguments.importdata.projName), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.audRoleName), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.audCatName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.audSubCatName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.audsource), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.cdfirstname), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.cdlastname), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
        <cfset arrayAppend(params, {value=left(arguments.importdata.callback_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
        <cfset arrayAppend(params, {value=left(arguments.importdata.redirect_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
        <cfset arrayAppend(params, {value=left(arguments.importdata.pin_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
        <cfset arrayAppend(params, {value=left(arguments.importdata.booked_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.projDescription), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.charDescription), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
        <cfset arrayAppend(params, {value=trim(arguments.importdata.note), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>

        <cfquery datasource="#yourDataSource#" name="insertQuery">
            #sql#
            <cfloop index="param" array="#params#">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" 
                    maxlength="#param.maxlength#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <cflog file="application" text="Error in insertAuditionsImport: #cfcatch.message# SQL: #sql# Params: #serializeJSON(params)#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSauditionsimport_24392" access="public" returntype="void">
    <cfargument name="importdata" type="struct" required="true">
    <cfargument name="new_uploadid" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var params = []>

    <cfset sql = "INSERT INTO auditionsimport (uploadid">
    
    <cfif structKeyExists(arguments.importdata, "projDate") and arguments.importdata.projDate neq "">
        <cfset sql &= ", projDate">
    </cfif>
    
    <cfset sql &= ", projName, audRoleName, audCatName, audsubcatname, audsource, cdfirstname, cdlastname, callback_yn, redirect_yn, pin_yn, booked_yn, projDescription, charDescription, note) VALUES (?,">
    
    <cfset arrayAppend(params, {value=arguments.new_uploadid, cfsqltype="CF_SQL_INTEGER"})>
    
    <cfif structKeyExists(arguments.importdata, "projDate") and arguments.importdata.projDate neq "">
        <cfset sql &= "?,">
        <cfset arrayAppend(params, {value=dateformat(arguments.importdata.projDate, 'yyyy-mm-dd'), cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>
    
    <cfset sql &= "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)">
    
    <cfset arrayAppend(params, {value=trim(arguments.importdata.projName), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.audRoleName), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.audCatName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.audSubCatName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.audsource), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.cdfirstname), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.cdlastname), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
    <cfset arrayAppend(params, {value=left(arguments.importdata.callback_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
    <cfset arrayAppend(params, {value=left(arguments.importdata.redirect_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
    <cfset arrayAppend(params, {value=left(arguments.importdata.pin_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
    <cfset arrayAppend(params, {value=left(arguments.importdata.booked_yn, 1), cfsqltype="CF_SQL_CHAR", maxlength=1})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.projDescription), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.charDescription), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>
    <cfset arrayAppend(params, {value=trim(arguments.importdata.note), cfsqltype="CF_SQL_VARCHAR", maxlength=500})>

    <cftry>
        <cfquery name="insertQuery" datasource="#yourDataSource#">
            #sql#
            <cfloop index="param" array="#params#">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" 
                    maxlength="#param.maxlength#" />
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionImport: #cfcatch.message# SQL: #sql# Params: #params#">
            <!--- Optionally rethrow or handle the error --->
        </cfcatch>
    </cftry>

</cffunction>
<cffunction name="SELauditionsimport_24561" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                u.uploadid, 
                u.`timestamp`, 
                u.userid, 
                u.uploadstatus, 
                i.status, 
                COUNT(i.ID) AS total_adds 
            FROM 
                auditionsimport i 
            INNER JOIN 
                uploads u ON u.uploadid = i.uploadid 
            INNER JOIN 
                audprojects p ON p.audprojectid = i.audprojectid 
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND u.isdeleted = 0 
            GROUP BY 
                u.uploadid, u.timestamp, u.userid, u.uploadstatus, i.status 
            HAVING 
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUploadsByUser: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
