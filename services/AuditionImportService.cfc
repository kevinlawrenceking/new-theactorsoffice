<cfcomponent displayname="AuditionImportService" hint="Handles operations for AuditionImport table" output="false"> 

<cffunction name="RESauditionsimport" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
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
</cffunction>

<cffunction name="SELauditionsimport" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
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
    
    <cfreturn result>
</cffunction>

<cffunction name="DETauditionsimport" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT audprojectid
        FROM auditionsimport
        WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
        AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="RESauditionsimport_23917" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
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
    
    <cfreturn result>
</cffunction>

<cffunction name="SELauditionsimport_23919" access="public" returntype="query">
    <cfargument name="uploadid" type="numeric" required="false">
    <cfargument name="timestamp" type="date" required="false">
    
    <cfset var result = "">
    <cfset var sql = "SELECT uploadid, timestamp FROM auditionsimport WHERE 1=1">
    
    <cfif structKeyExists(arguments, "uploadid")>
        <cfset sql &= " AND uploadid = ?">
    </cfif>
    
    <cfif structKeyExists(arguments, "timestamp")>
        <cfset sql &= " AND timestamp = ?">
    </cfif>
    
    <cfquery name="result">
        #sql#
        <cfif structKeyExists(arguments, "uploadid")>
            <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
        </cfif>
        
        <cfif structKeyExists(arguments, "timestamp")>
            <cfqueryparam value="#arguments.timestamp#" cfsqltype="CF_SQL_TIMESTAMP">
        </cfif>
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction