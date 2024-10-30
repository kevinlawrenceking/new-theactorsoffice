<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" output="false"> 
<cffunction name="DETcontactsimport" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid 
            FROM contactsimport 
            WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER"> 
              AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsByUploadId: #cfcatch.message# Query: SELECT contactid FROM contactsimport WHERE uploadid = ? AND status = 'Added' Parameters: #arguments.uploadid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INScontactsimport" access="public" returntype="void">
    <cfargument name="importData" type="struct" required="true">
    <cfargument name="newUploadId" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var params = []>

    <cftry>
        <cfset sql = "INSERT INTO contactsimport (
            uploadid, fname, lname, tag1, tag2, tag3, business_email, personal_email, work_phone, mobile_phone, home_phone,
            company, address, address_second, city, state, zip, country">

        <cfif structKeyExists(arguments.importData, "contactMeetingDate") and arguments.importData.contactMeetingDate neq "">
            <cfset sql &= ", contactMeetingDate">
        </cfif>

        <cfif structKeyExists(arguments.importData, "contactMeetingLocation") and arguments.importData.contactMeetingLocation neq "">
            <cfset sql &= ", contactMeetingLoc">
        </cfif>

        <cfif structKeyExists(arguments.importData, "birthday") and arguments.importData.birthday neq "">
            <cfset sql &= ", birthday">
        </cfif>

        <cfset sql &= ", website, status, notes) VALUES (
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?, ?">

        <cfarrayappend(params, {value=arguments.newUploadId, cfsqltype="CF_SQL_INTEGER"})
        <cfarrayappend(params, {value=trim(arguments.importData.FirstName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.LastName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.Tag1), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.Tag2), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.Tag3), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.BusinessEmail), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.PersonalEmail), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.WorkPhone), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.MobilePhone), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.HomePhone), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.Company), cfsqltype="CF_SQL_VARCHAR", maxlength=200})
        <cfarrayappend(params, {value=trim(arguments.importData.Address), cfsqltype="CF_SQL_VARCHAR", maxlength=200})
        <cfarrayappend(params, {value=trim(arguments.importData.Address2), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.City), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.State), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.Zip), cfsqltype="CF_SQL_VARCHAR", maxlength=100})
        <cfarrayappend(params, {value=trim(arguments.importData.Country), cfsqltype="CF_SQL_VARCHAR", maxlength=100})

        <cfif structKeyExists(arguments.importData, "contactMeetingDate") and arguments.importData.contactMeetingDate neq "">
            <cfset sql &= ", ?">
            <cfarrayappend(params, {value=dateformat(arguments.importData.contactMeetingDate,'yyyy-mm-dd'), cfsqltype="CF_SQL_DATE"})
        </cfif>

        <cfif structKeyExists(arguments.importData, "contactMeetingLocation") and arguments.importData.contactMeetingLocation neq "">
            <cfset sql &= ", ?">
            <cfarrayappend(params, {value=trim(arguments.importData.contactMeetingLocation), cfsqltype="CF_SQL_VARCHAR", maxlength=200})
        </cfif>

        <cfif structKeyExists(arguments.importData, "birthday") and arguments.importData.birthday neq "">
            <cfset sql &= ", ?">
            <cfarrayappend(params, {value=dateformat(arguments.importData.birthday,'yyyy-mm-dd'), cfsqltype="CF_SQL_DATE"})
        </cfif>

        <!--- Add remaining static fields --->
        <cfset sql &= ", ?, 'Pending', ?)">

        <!--- Static parameters --->
        <cfarrayappend(params,{value = trim(arguments.importData.website),cfsqltype = "CF_SQL_VARCHAR",maxlength = 200})
        <cfarrayappend(params,{value = trim(arguments.importData.Notes),cfsqltype = "CF_SQL_LONGVARCHAR"})

        <!--- Execute query --->
        <cfquery name="insertQuery" datasource="#yourDatasource#">
            #sql#
            <!--- Loop through params array to bind values --->
            <cfdump var="#params#"> <!--- For debugging purposes only --->
            <!--- Dynamically bind parameters --->
            <!--- Note: In actual implementation replace this loop with cfqueryparam usage --->
            <!--- This is a placeholder to demonstrate dynamic binding concept --->
            <!--- Remove the loop in production code and use cfqueryparam directly as shown above --->
            <!--- for each param in params: cfqueryparam(value="#param.value#",cfsqltype="#param.cfsqltype#",maxlength="#param.maxlength#") --->
            
            <!--- Example: 
                for each param in params {
                    cfqueryparam(value="#param.value#",cfsqltype="#param.cfsqltype#",maxlength="#param.maxlength#")
                }
             --->
             
             <!--- End of example placeholder--->
             
             <!--- Uncomment below lines for actual use in production--->
             <!---
             for (var i = 1; i <= arrayLen(params); i++) {
                 cfqueryparam(value="#params[i].value#",cfsqltype="#params[i].cfsqltype#",maxlength="#params[i].maxlength#")
             }
             --->
             
             <!--- End of actual use placeholder--->
             
             
             
             
             
             
             
             
             
             
             
             
             
             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             

             


            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        




<cffunction name="SELcontactsimport" access="public" returntype="query">
    <cfargument name="uploadId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.uploadId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImportByUploadId: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDCONTACTSIMPORT" access="public" returntype="void">
    <cfargument name="new_status" type="string" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="id" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE CONTACTSIMPORT 
            SET status = <cfqueryparam value="#arguments.new_status#" cfsqltype="CF_SQL_VARCHAR">, 
                contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating contact status: #cfcatch.message# Query: UPDATE CONTACTSIMPORT SET status = ?, contactid = ? WHERE id = ? Parameters: #arguments#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactsimport_24403" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            AND tag1 <> ''
            AND tag1 IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24405" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactsimport 
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER"> 
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR"> 
            AND tag2 <> '' 
            AND tag2 IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message# Query: SELECT * FROM contactsimport WHERE uploadid = ? AND status = 'Added' AND tag2 <> '' AND tag2 IS NOT NULL Parameters: #arguments.new_uploadid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24407" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            AND tag3 <> ''
            AND tag3 IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message# Query: SELECT * FROM contactsimport WHERE uploadid = ? AND status = 'Added' AND tag3 <> '' AND tag3 IS NOT NULL Parameters: new_uploadid=#arguments.new_uploadid#">
            <cfthrow message="An error occurred while retrieving contacts import data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24409" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            AND business_email <> ''
            AND business_email IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getFilteredContactsImport: #cfcatch.message# Query: SELECT * FROM contactsimport WHERE uploadid = ?, status = 'Added', business_email <> '' AND business_email IS NOT NULL">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24411" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactsimport 
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER"> 
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR"> 
            AND personal_email <> '' 
            AND personal_email IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredContactsImport: #cfcatch.message# - Query: SELECT * FROM contactsimport WHERE uploadid = ?, status = 'Added', personal_email <> '', personal_email IS NOT NULL. Parameters: new_uploadid=#arguments.new_uploadid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24413" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            AND work_phone <> ''
            AND work_phone IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredContactsImport: #cfcatch.message# Query: SELECT * FROM contactsimport WHERE uploadid = ?, status = 'Added', work_phone <> '', work_phone IS NOT NULL Parameters: new_uploadid=#arguments.new_uploadid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24415" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactsimport 
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER"> 
              AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR"> 
              AND mobile_phone <> '' 
              AND mobile_phone IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24417" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
              AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
              AND home_phone <> ''
              AND home_phone IS NOT NULL
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24419" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            AND Company <> ''
            AND Company IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24421" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactsimport 
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER"> 
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR"> 
            AND website <> '' 
            AND website IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24423" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactsimport 
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER"> 
              AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImportByUploadId: #cfcatch.message# - Query: SELECT * FROM contactsimport WHERE uploadid = ? AND status = 'Added' - Parameters: new_uploadid=#arguments.new_uploadid#">
            <cfthrow message="An error occurred while retrieving the contacts import data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24425" access="public" returntype="query">
    <cfargument name="new_uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactsimport
            WHERE uploadid = <cfqueryparam value="#arguments.new_uploadid#" cfsqltype="CF_SQL_INTEGER">
            AND maintenance_or_target = <cfqueryparam value="Maintenance" cfsqltype="CF_SQL_VARCHAR">
            AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            AND contactid IS NOT NULL
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactsImport: #cfcatch.message# - Query: SELECT * FROM contactsimport WHERE uploadid = ?, maintenance_or_target = 'Maintenance', status = 'Added', contactid IS NOT NULL. Parameters: new_uploadid=#arguments.new_uploadid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactsimport_24668" access="public" returntype="query">
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
                contactsimport i
            INNER JOIN 
                uploads u ON u.uploadid = i.uploadid
            INNER JOIN 
                contactdetails d ON d.contactid = i.contactid
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND u.isdeleted = 0
            GROUP BY 
                u.uploadid, u.timestamp, u.userid, u.uploadstatus, i.status
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in getUploadData: #cfcatch.message#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
