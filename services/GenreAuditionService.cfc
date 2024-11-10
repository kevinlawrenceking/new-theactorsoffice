<cfcomponent displayname="GenreAuditionService" hint="Handles operations for GenreAudition table" output="false"> 
<cffunction name="SELaudgenres_audition_xref" access="public" returntype="query">
    <cfargument name="projectList" type="string" required="true">
    
    <cfset var queryResult = "">
    <cfset var sql = "">
    
    <cfset sql = "
        SELECT 
            p.audprojectid AS recid,
            p.projdate AS Date,
            p.projname AS Project,
            r.audrolename AS Role,
            r.chardescription AS `Character Description`,
            ca.audcatname AS Category,
            sc.audsubcatname AS SubCategory,
            s.audsource AS Source,
            c.recordname AS `Casting Director`,
            p.projdescription AS `Project Description`,
            net.network AS Network,
            ton.tone AS `Style/Format`,
            un.unionName AS `Union`,
            ct.contracttype AS `Contract Type`,
            rt.audroletype AS `Role TYPE`,
            di.auddialect AS Dialect,
            (SELECT GROUP_CONCAT(g.audgenre SEPARATOR ', ') 
             FROM audgenres_audition_xref x 
             INNER JOIN audgenres_user g ON g.audgenreid = x.audgenreID 
             WHERE x.audroleid = r.audroleid) AS Genres,
            (SELECT GROUP_CONCAT(e.vocaltype SEPARATOR ', ') 
             FROM audvocaltypes_audition_xref x 
             INNER JOIN audvocaltypes e ON e.vocaltypeid = x.vocaltypeid 
             WHERE x.audroleid = r.audroleid) AS `Vocal Types`,
            (SELECT GROUP_CONCAT(e.rangename SEPARATOR ', ') 
             FROM audageranges_audtion_xref x 
             INNER JOIN audageranges e ON e.rangeid = x.rangeid 
             WHERE x.audroleid = r.audroleid) AS `Age Ranges`,
            (SELECT GROUP_CONCAT(e.essenceName SEPARATOR ', ') 
             FROM audessences_audtion_xref x 
             INNER JOIN essences e ON e.essenceid = x.essenceid 
             WHERE x.audroleid = r.audroleid) AS Essences,
            CASE WHEN r.iscallback = 1 THEN 'Yes' ELSE 'No' END AS 'Callback?',
            CASE WHEN r.iscallback = 1 THEN 'Yes' ELSE 'No' END AS 'Redirect?',
            CASE WHEN r.ispin = 1 THEN 'Yes' ELSE 'No' END AS 'Pin/Avail?',
            CASE WHEN r.isbooked = 1 THEN 'Yes' ELSE 'No' END AS 'Booked?',
            CASE WHEN p.isdirect = 1 THEN 'Yes' ELSE 'No' END AS 'Direct Booking?'
        FROM audprojects p
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
        LEFT JOIN audnetworks_user net ON (p.`networkID` = net.networkid)
        LEFT JOIN audtones_user ton ON (p.`toneID` = ton.toneid)
        LEFT JOIN audunions un ON (p.`unionID` = un.`unionID`)
        LEFT JOIN audcontracttypes ct ON (p.`contractTypeID` = ct.contracttypeid)
        LEFT JOIN auddialects_user di ON (r.`audDialectID` = di.auddialectid)
        WHERE p.audprojectid IN (<cfqueryparam value="#arguments.projectList#" cfsqltype="CF_SQL_VARCHAR" list="true">)
        GROUP BY r.audroleid, p.projname, s.audsource, rt.audroletype, r.iscallback, r.isredirect, r.ispin, r.isbooked
        ORDER BY p.projdate DESC
    ">
    
    <cfquery name="queryResult">
        #sql#
    </cfquery>
    
    <cfreturn queryResult>
</cffunction>

<cffunction name="SELaudgenres_audition_xref_24274" access="public" returntype="query">
    <cfargument name="audgenre" type="string" required="true">
    <cfargument name="audroleid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT *
        FROM audgenres_audition_xref x
        INNER JOIN audgenres_user g ON g.audgenreid = x.audgenreid
        WHERE g.audgenre = <cfqueryparam value="#arguments.audgenre#" cfsqltype="CF_SQL_VARCHAR">
        AND x.audroleid = <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="DELaudgenres_audition_xref" access="public" returntype="void">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cfquery>
        DELETE FROM audgenres_audition_xref
        WHERE audroleid = <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudgenres_audition_xref" access="public" returntype="void">
    <cfargument name="new_audgenreid" type="numeric" required="true">
    <cfargument name="new_audroleid" type="numeric" required="true">

    <cfquery>
        INSERT INTO audgenres_audition_xref (audgenreid, audroleid)
        VALUES (
            <cfqueryparam value="#arguments.new_audgenreid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.new_audroleid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="INSaudgenres_audition_xref_24521" access="public