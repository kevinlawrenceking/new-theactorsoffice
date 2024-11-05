
<cfcomponent displayname="AuditionMediaService" hint="Handles operations for AuditionMedia table" output="false"> 

    <!--- Function to select headshots based on user ID --->
    <cffunction name="GetHeadshots" access="public" returntype="query" output="false" hint="Retrieve headshots for a specific user ID.">
        <cfargument name="userid" type="numeric" required="yes" hint="ID of the user to retrieve headshots for.">

        <!--- Query to fetch headshots --->
        <cfquery name="headshots_sel">
            SELECT 
                m.mediaid,
                m.mediatypeid,
                m.mediaName,
                m.mediaLoc,
                m.mediaurl,
                0 AS eventid,
                m.mediaFilename,
                m.mediaExt,
                m.userid,
                m.mediacreated,
                m.isdeleted,
                t.mediaType,
                t.isimage,
                e.isimage AS isValidImage
            FROM 
                audmedia m  
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
                AND m.isdeleted IS FALSE 
                AND t.ismaterial = 1 
                AND m.isshare = 1
            ORDER BY 
                m.mediaName
        </cfquery>

        <cfreturn headshots_sel>
    </cffunction>

<cffunction name="SELaudmedia" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="mediatypeid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audmedia m 
            INNER JOIN audmedia_auditions_xref x ON x.mediaid = m.mediaid 
            WHERE x.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER"> 
            AND m.isdeleted IS FALSE 
            AND m.mediatypeid = <cfqueryparam value="#arguments.mediatypeid#" cfsqltype="CF_SQL_INTEGER"> 
            AND m.isdeleted IS FALSE
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudMedia: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudmedia_23799" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                m.eventid, 
                t.mediaType, 
                t.isimage, 
                m.isImage
            FROM audmedia m
            INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
            WHERE m.eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
            AND m.isdeleted = <cfqueryparam value="false" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaByEventId: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDaudmedia" access="public" returntype="void">
    <cfargument name="mediaid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE audmedia 
            SET isdeleted = 1 
            WHERE mediaid = <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audmedia: #cfcatch.message# Query: UPDATE audmedia SET isdeleted = 1 WHERE mediaid = #arguments.mediaid#">
            <cfthrow message="An error occurred while updating the audmedia record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudmedia" access="public" returntype="query">
    <cfargument name="mediaid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audmedia 
            WHERE mediaid = <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaById: #cfcatch.message# Query: SELECT * FROM audmedia WHERE mediaid = #arguments.mediaid#">
            <cfthrow message="An error occurred while retrieving media data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETaudmedia_24113" access="public" returntype="query">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                t.mediaType
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            WHERE 
                m.mediaid = <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaDetails: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving media details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="SELaudmedia_24249" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="new_audcatid" type="numeric" required="true">
    <cfargument name="rangestart" type="date" required="true">
    <cfargument name="rangeend" type="date" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                COUNT(x.audprojectid) AS totals, 
                m.medianame AS label, 
                s.audcatid, 
                'Auditions' AS itemDataset
            FROM 
                audmedia m
            INNER JOIN 
                audmedia_auditions_xref x ON x.mediaid = m.mediaid
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            INNER JOIN 
                audprojects p ON p.audprojectID = x.audprojectid
            INNER JOIN 
                audsubcategories s ON s.audsubcatid = p.audsubcatid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.isdeleted IS false 
                AND x.audprojectid <> 0 
                AND p.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#"> 
                AND s.audcatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audcatid#"> 
                AND p.projdate >= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangestart#"> 
                AND p.projdate <= <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.rangeend#">
            GROUP BY 
                m.medianame, t.mediatype, s.audcatid
            HAVING 
                t.mediatype = 'Headshot'
            ORDER BY 
                m.medianame;
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAuditionsData: #cfcatch.message#" />
            <cfthrow message="An error occurred while fetching auditions data." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudmedia" access="public" returntype="void">
    <cfargument name="new_mediaTypeID" type="numeric" required="true">
    <cfargument name="new_mediaURL" type="string" required="true">
    <cfargument name="new_mediaName" type="string" required="true">
    <cfargument name="new_mediaFilename" type="string" required="true">
    <cfargument name="new_mediaExt" type="string" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_isshare" type="boolean" required="true">

    <cftry>
        <cfquery datasource="#abod#" name="insertResult">
            INSERT INTO audmedia (
                mediaTypeID, 
                mediaURL, 
                mediaName, 
                mediaFilename, 
                mediaExt, 
                userid, 
                isDeleted, 
                isshare
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaTypeID#" null="#NOT len(trim(arguments.new_mediaTypeID))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaURL#" null="#NOT len(trim(arguments.new_mediaURL))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaName#" null="#NOT len(trim(arguments.new_mediaName))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaFilename#" maxlength="200" null="#NOT len(trim(arguments.new_mediaFilename))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaExt#" maxlength="5" null="#NOT len(trim(arguments.new_mediaExt))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isshare#" null="#NOT len(trim(arguments.new_isshare))#">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting into audmedia: #cfcatch.message#, SQL: #insertResult.sql#, Parameters: #serializeJSON(arguments)#">
            <cfthrow message="Database error occurred while inserting into audmedia." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmedia_24569" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                x.audprojectid, 
                t.mediaType, 
                t.isimage, 
                m.isImage, 
                m.isshare, 
                e.isimage AS isValidImage
            FROM audmedia m
            INNER JOIN audmedia_auditions_xref x ON x.mediaid = m.mediaid
            INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN exttypes e ON e.mediaext = m.mediaext
            WHERE x.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            AND m.isdeleted IS FALSE
            AND x.audprojectid <> 0
            AND t.mediaType <> 'Headshot'
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudmedia_24570" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                0 AS eventid, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                m.isshare, 
                t.mediaType, 
                t.isimage, 
                e.isimage AS isValidImage
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND m.isdeleted IS FALSE
                AND t.mediaType <> 'Headshot'
                AND m.isshare = 1
                AND m.mediaid NOT IN (
                    SELECT 
                        m.mediaid
                    FROM 
                        audmedia m
                    INNER JOIN 
                        audmedia_auditions_xref x ON x.mediaid = m.mediaid
                    INNER JOIN 
                        audmediatypes t ON t.mediaTypeID = m.mediatypeid
                    LEFT JOIN 
                        exttypes e ON e.mediaext = m.mediaext
                    WHERE 
                        x.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER"> 
                        AND m.isdeleted IS FALSE
                        AND x.audprojectid <> 0
                )
            ORDER BY 
                t.mediaType, m.mediaName
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaData: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudmedia_24571" access="public" returntype="void">
    <cfargument name="new_mediaTypeID" type="numeric" required="true">
    <cfargument name="new_mediaURL" type="string" required="true">
    <cfargument name="new_mediaName" type="string" required="true">
    <cfargument name="new_mediaFilename" type="string" required="false">
    <cfargument name="new_mediaExt" type="string" required="false">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_isShare" type="boolean" required="true">
    <cfargument name="new_mediaID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="#application.dsn#">
            UPDATE audmedia 
            SET 
                mediaTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaTypeID#" null="#NOT len(trim(arguments.new_mediaTypeID))#">,
                mediaURL = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaURL#" null="#NOT len(trim(arguments.new_mediaURL))#">,
                mediaName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaName#" null="#NOT len(trim(arguments.new_mediaName))#">,
                <cfif structKeyExists(arguments, "new_mediaFilename")>
                    mediaFilename = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaFilename#" maxlength="200" null="#NOT len(trim(arguments.new_mediaFilename))#">,
                    mediaExt = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_mediaExt#" maxlength="3" null="#NOT len(trim(arguments.new_mediaExt))#">,
                </cfif>
                userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">,
                isShare = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isShare#" null="#NOT len(trim(arguments.new_isShare))#">
            WHERE 
                mediaID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_mediaID#">
        </cfquery>
    <cfcatch>
        <cflog file="errorLogFile" text="Error updating audmedia: #cfcatch.message#. Query: #cfcatch.detail#">
        <cfthrow message="Error updating audmedia." detail="#cfcatch.message#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmedia_24572" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                x.audprojectid, 
                t.mediaType, 
                t.isimage, 
                m.isImage, 
                m.isshare, 
                e.isimage AS isValidImage
            FROM audmedia m
            INNER JOIN audmedia_auditions_xref x ON x.mediaid = m.mediaid
            INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN exttypes e ON e.mediaext = m.mediaext
            WHERE x.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
              AND m.isdeleted IS FALSE
              AND x.audprojectid <> 0
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getMediaDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmedia_24573" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                x.audprojectid, 
                t.mediaType, 
                t.isimage, 
                m.isImage, 
                m.isshare, 
                e.isimage AS isValidImage
            FROM audmedia m
            INNER JOIN audmedia_auditions_xref x ON x.mediaid = m.mediaid
            INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN exttypes e ON e.mediaext = m.mediaext
            WHERE x.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER"> 
              AND m.isdeleted IS FALSE 
              AND x.audprojectid <> 0 
              AND t.mediatypeid = 1
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getMediaDetails: #cfcatch.message#">
            <cfthrow message="An error occurred while fetching media details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmedia_24665" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaurl,
                m.mediaLoc, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                t.mediaType, 
                e.isimage AS isValidImage
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND m.isdeleted = <cfqueryparam value="false" cfsqltype="CF_SQL_BIT"> 
                AND m.mediatypeid = <cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">
                AND mediaid NOT IN (
                    SELECT mediaid FROM audmedia_auditions_xref WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
                )
            ORDER BY 
                m.mediaName
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudmedia_24666" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                0 AS eventid, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                t.mediaType, 
                e.isimage AS isValidImage
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND m.isdeleted = <cfqueryparam value="false" cfsqltype="CF_SQL_BIT"> 
                AND m.mediatypeid = <cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                m.mediaName
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETaudmedia_24676" access="public" returntype="query">
    <cfargument name="mediaid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                0 as eventid, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                t.mediaType, 
                t.isimage, 
                e.isimage as isValidImage, 
                m.isshare
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.mediaid = <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmedia_24677" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaurl,
                m.mediaLoc, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                t.mediaType, 
                t.isimage, 
                e.isimage AS isValidImage
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND m.isdeleted = <cfqueryparam value="false" cfsqltype="CF_SQL_BIT">
                AND t.ismaterial = <cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">
                AND mediaid NOT IN (
                    SELECT mediaid FROM audmedia_auditions_xref WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
                )
        </cfquery>
        
        <cfreturn result>

    <cfcatch type="any">
        <cflog file="application" text="Error in getMediaDetails: #cfcatch.message# Query: #cfcatch.detail#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudmedia_24678" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                m.mediaid, 
                m.mediatypeid, 
                m.mediaName, 
                m.mediaLoc, 
                m.mediaurl, 
                0 as eventid, 
                m.mediaFilename, 
                m.mediaExt, 
                m.userid, 
                m.mediacreated, 
                m.isdeleted, 
                t.mediaType, 
                t.isimage, 
                e.isimage as isValidImage
            FROM 
                audmedia m
            INNER JOIN 
                audmediatypes t ON t.mediaTypeID = m.mediatypeid
            LEFT JOIN 
                exttypes e ON e.mediaext = m.mediaext
            WHERE 
                m.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND m.isdeleted IS false 
                AND t.ismaterial = 1 
                AND m.isshare = 1
            ORDER BY 
                m.mediaName
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getMediaDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
