<cfcomponent displayname="ShareService" hint="Handles operations for Share table" > 

    <cffunction name="GetShareDetailsByAudition" access="public" returntype="query" output="false">
        <!--- Arguments --->
        <cfargument name="userid" type="numeral" required="true">

        <!--- Query --->
        <cfquery name="result" >
            SELECT 
                d.recordname AS Name, 
                ci_company.valueCompany AS Company, 
                ci_tag.valueText AS Title, 
                mx.audstep AS AuditionStatus, 
                d.contactMeetingLoc AS WhereMet, 
                d.contactMeetingDate AS WhenMet, 
                p.projname AS Project, 
                c.audcatname AS Category, 
                sc.audsubcatname AS SubCategory, 
                rt.audroletype AS RoleType, 
                group_concat(n.noteDetails separator ',') AS NotesLog 
            FROM 
                contactdetails d 
                LEFT JOIN audcontacts_auditions_xref x ON d.contactid = x.contactid 
                LEFT JOIN audprojects p ON p.audprojectID = x.audprojectid 
                INNER JOIN audroles r ON r.audprojectID = p.audprojectid 
                LEFT JOIN audsubcategories sc ON sc.audsubcatid = p.audsubcatid 
                LEFT JOIN audcategories c ON c.audcatid = sc.audcatid 
                LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid 
                LEFT JOIN maxaudition mx ON mx.contactid = d.contactID
                INNER JOIN taousers u ON u.userID = d.userID
                LEFT JOIN contactitems ci_company ON ci_company.contactID = d.contactID 
                    AND ci_company.valueCategory = 'Company' 
                    AND ci_company.itemStatus = 'active'
                LEFT JOIN contactitems ci_tag ON ci_tag.contactID = d.contactID 
                    AND ci_tag.valueCategory = 'Tag' 
                    AND ci_tag.itemStatus = 'Active'
                LEFT JOIN noteslog n ON n.contactID = d.contactID 
                    AND n.isPublic = 1
                INNER JOIN fusystemusers su ON su.contactID = d.contactID
            WHERE 
                r.userid = d.userid 
                AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_VARCHAR"> 
                AND su.userid = d.userID 
                AND su.suStatus = 'Active' 
                AND su.systemID IN (1, 2, 3, 4)
            GROUP BY 
                d.contactID
        </cfquery>

        <!--- Return Query Result --->
        <cfreturn result>
    </cffunction>

    <cffunction name="GetShareDetails" access="public" returntype="query" output="false">
        <!--- Arguments --->
        <cfargument name="contactid" type="numeric" required="true">

        <!--- Query --->
        <cfquery name="result">
            SELECT 
                `Name`,
                `Company`,
                `Title`,
                `WhereMet`,
                `WhenMet`,
                `NotesLog`
            FROM 
                sharez
            WHERE 
                contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- Return Query Result --->
        <cfreturn result>
    </cffunction>

    <cffunction output="false" name="SELshares" access="public" returntype="query">
        <cfargument name="userId" type="numeric" required="true">

<cfquery name="result">
            SELECT *
            FROM shares
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

<cfreturn result>
    </cffunction>

    <cffunction name="shares" access="public" returntype="query" output="false">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery name="result" >
            SELECT 
                contactid,
                Name,
                Company,
                Title,
                Audition,
                WhereMet,
                WhenMet,
                NotesLog,
                userid,
                u
            FROM 
                sharez
            WHERE 
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn result>
    </cffunction>
</cfcomponent>