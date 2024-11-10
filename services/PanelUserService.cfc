<cfcomponent displayname="PanelUserService" hint="Handles operations for PanelUser table" output="false"> 

<cffunction name="SELpgpanels_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    <cfquery name="result">
        SELECT 
            p.pnid, 
            p.pntitle, 
            p.pnColXl, 
            p.pnColMd, 
            p.pnFilename, 
            -1 AS new_pnorderno, 
            p.isvisible
        FROM 
            pgpanels_user p
        WHERE 
            p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        ORDER BY 
            p.pnorderno
    </cfquery>
    <cfreturn result>
</cffunction>

<cffunction name="UPDpgpanels_user" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfquery>
        UPDATE pgpanels_user 
        SET isvisible = 0 
        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="UPDpgpanels_user_23858" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_isvisible" type="array" required="true">

    <cfset var sql = "">
    <cfset var pnidList = "">

    <!--- Validate and prepare the pnidList for SQL IN clause --->
    <cfif arrayLen(arguments.new_isvisible) gt 0>
        <cfset pnidList = listQualify(arrayToList(arguments.new_isvisible), "'", ",")>
    </cfif>

    <!--- Construct the SQL query --->
    <cfset sql = "
        UPDATE pgpanels_user 
        SET isvisible = 1 
        WHERE userid = ? 
        AND pnid IN (#pnidList#)
    ">

    <!--- Execute the query with parameter binding --->
    <cfquery>
        #sql#
        <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="UPDpgpanels_user_23886" access="public" returntype="void">
    <cfargument name="pnid" type="numeric" required="true">
    <cfquery>
        UPDATE pgpanels_user
        SET isdeleted = 1
        WHERE pnid = <cfqueryparam value="#arguments.pnid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="UPDpgpanels_user_24135" access="public" returntype="void">
    <cfargument name="pnid" type="numeric" required="true">
    <cfquery>
        UPDATE pgpanels_user
        SET isvisible = <cfqueryparam value="#arguments.isvisible#" cfsqltype="CF_SQL_BIT">
        WHERE pnid = <cfqueryparam value="#arguments.pnid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELpgpanels_user_24136" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT 
            p.pnid, 
            p.pntitle, 
            s.pnTitle AS correct_title
        FROM 
            pgpanels_user p
        LEFT JOIN 
            sitetypes_user s ON s.pnid = p.pnid
        WHERE 
            p.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            AND p.pntitle <> s.pntitle
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="UPDpgpanels_user_24137" access="public" returntype="void">
    <cfargument name="correctTitle" type="string" required="true">
    <cfargument name="pnid" type="numeric" required="true">

    <cfquery>
        UPDATE pgpanels_user 
        SET pntitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.correctTitle#" /> 
        WHERE pnid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pnid#" />
    </cfquery>
</cffunction>

<cffunction name="SELpgpanels_user_24147" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT p.pnOrderno + 1 AS new_pnOrderNo
        FROM pgpanels_user p
        WHERE p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        ORDER BY p.pnOrderno DESC
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="INSpgpanels_user" access="public" returntype="void">
    <cfargument name="new_pnTitle" type="string" required="true">
    <cfargument name="new_pnOrderNo" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfquery>
        INSERT INTO pgpanels_user (
            pnTitle, 
            pnFilename, 
            pnorderno, 
            pncolxl, 
            pncolMd, 
            pnDescription, 
            IsDeleted, 
            IsVisible, 
            userid
        ) VALUES (
            <cfqueryparam value="#arguments.new_pnTitle#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="mylinks_user.cfm" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.new_pnOrderNo#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="3" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
            <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">,
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        )
    </cfquery>
</cffunction>

<cffunction name="SELpgpanels_user_24435" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="pnFilename" type="string" required="true