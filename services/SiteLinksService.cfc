<cfcomponent displayname="SiteLinksService" output="false" hint="Handles site links retrieval for specific panels.">

    <cffunction name="getSiteLinksByPanelId" access="public" returntype="query" output="false" hint="Retrieve site links for a specific panel ID.">
        <cfargument name="panelId" type="numeric" required="true" hint="The panel ID (pnid) for which to retrieve site links.">

        <cfquery name="mylinks_user">
            SELECT 
                s.id,
                s.id as new_id,
                s.sitetypeid,
                s.sitename,
                s.siteurl,
                s.siteicon,
                t.sitetypename,
                t.pntitle
            FROM sitetypes_user t
            INNER JOIN sitelinks_user s ON t.sitetypeid = s.siteTypeid
            WHERE t.pnid = <cfqueryparam value="#arguments.panelId#" cfsqltype="cf_sql_integer">
            ORDER BY s.sitename
        </cfquery>

        <cfreturn mylinks_user>
    </cffunction>

    <cffunction name="getAllUrlsByPanelId" access="public" returntype="string" output="false" hint="Retrieve all URLs for a specific panel for the 'Open All' button.">
        <cfargument name="panelId" type="numeric" required="true" hint="The panel ID for which to retrieve all URLs.">

        <cfquery name="allUrls">
            SELECT GROUP_CONCAT(s.siteurl ORDER BY s.siteurl ASC SEPARATOR ', ') AS siteurl_list
            FROM sitetypes_user t
            INNER JOIN sitelinks_user s ON t.sitetypeid = s.siteTypeid
            WHERE t.pnid = <cfqueryparam value="#arguments.panelId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn allUrls.siteurl_list>
    </cffunction>

    <cffunction name="getLinkDetailsById" access="public" returntype="query" output="false" hint="Retrieve link details for a specific link ID.">
        <cfargument name="linkId" type="numeric" required="true" hint="The ID of the link to retrieve details for.">

        <cfquery name="linkdetails">
            SELECT 
                id, 
                siteName, 
                siteURL, 
                siteicon, 
                siteTypeid, 
                userid, 
                isDeleted, 
                isCustom, 
                ver, 
                siteicon_url 
            FROM sitelinks_user 
            WHERE id = <cfqueryparam value="#arguments.linkId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn linkdetails>
    </cffunction>

    <cffunction name="updateSiteLinkDetails" access="public" returntype="void" output="false" hint="Check for duplicate sitenames and update site link details">
        <cfargument name="new_id" type="numeric" required="true" hint="ID of the site link to update">
        <cfargument name="userid" type="numeric" required="true" hint="User ID">
        <cfargument name="new_sitename" type="string" required="true" hint="New site name to check for duplicates">
        <cfargument name="new_siteurl" type="string" required="true" hint="New site URL">
        <cfargument name="new_iscustom" type="numeric" required="true" hint="Indicates if the site is custom">
        <cfargument name="deletelink" type="numeric" required="true" hint="Indicates if the site link should be deleted">
        
        <cfset var corrected_new_siteurl = new_siteurl>
        <cfif left(new_siteurl, 8) neq "https://" and left(new_siteurl, 7) neq "http://">
            <cfset corrected_new_siteurl = "https://" & new_siteurl />
        </cfif>

        <cfquery name="duplicateCount">
            SELECT COUNT(*) AS duplicateCount
            FROM sitelinks_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
            AND sitename = <cfqueryparam value="#arguments.new_sitename#" cfsqltype="cf_sql_varchar">
            AND id <> <cfqueryparam value="#arguments.new_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfquery name="updateSiteLink">
            UPDATE sitelinks_user
            SET 
                siteurl = <cfqueryparam value="#corrected_new_siteurl#" cfsqltype="cf_sql_varchar">,
                isdeleted = <cfqueryparam value="#deletelink#" cfsqltype="cf_sql_bit">,
                sitename = <cfqueryparam value="#new_sitename#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#new_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <cffunction name="updateSiteLink" access="public" returntype="void" output="false" hint="Updates the sitelinks_user table dynamically based on available arguments.">
        <cfargument name="new_id" type="numeric" required="true" hint="ID of the site link to update">
        <cfargument name="new_sitename" type="string" required="false" hint="New site name">
        <cfargument name="new_siteurl" type="string" required="false" hint="New site URL">
        <cfargument name="new_siteicon" type="string" required="false" hint="New site icon">
        <cfargument name="new_sitetypeid" type="numeric" required="false" hint="Site type ID">
        <cfargument name="new_iscustom" type="boolean" required="false" hint="Is custom site link">
        <cfargument name="deletelink" type="boolean" required="false" hint="Flag for deletion">
        <cfargument name="ver" type="integer" required="false" hint="Version number">
        <cfargument name="new_siteicon_url" type="string" required="false" hint="New site icon URL">

        <cfquery name="updateSiteLink">
            UPDATE sitelinks_user
            SET siteName = <cfqueryparam value="#arguments.new_sitename#" cfsqltype="cf_sql_varchar">,
                siteURL = <cfqueryparam value="#arguments.new_siteurl#" cfsqltype="cf_sql_varchar">,
                siteicon = <cfqueryparam value="#arguments.new_siteicon#" cfsqltype="cf_sql_varchar">,
                siteTypeid = <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="cf_sql_integer">,
                IsCustom = <cfqueryparam value="#arguments.new_iscustom#" cfsqltype="cf_sql_bit">,
                IsDeleted = <cfqueryparam value="#arguments.deletelink#" cfsqltype