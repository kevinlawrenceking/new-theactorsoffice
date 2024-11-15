<!--- This ColdFusion page retrieves user-specific site links from the database --->
<cfquery name="mylinks">
    <!--- Select relevant fields from sitelinks_user and join with sitetypes_user --->
    SELECT
        s.id,
        s.sitetypeid,
        s.sitename,
        s.siteurl,
        s.siteicon,
        s.sitetypeid,
        t.sitetypename,
        t.pntitle
    FROM 
        sitelinks_user s 
    INNER JOIN 
        sitetypes_user t 
    ON 
        t.sitetypeid = s.siteTypeid
    WHERE 
        s.userid = #userid#
    ORDER BY 
        s.sitename
</cfquery>
