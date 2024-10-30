<cfcomponent displayname="AuditionQuestionUserService" hint="Handles operations for AuditionQuestionUser table" output="false"> 
<cffunction name="SELaudquestions_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM audquestions_user 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserQuestions: #cfcatch.message# Query: SELECT * FROM audquestions_user WHERE userid = #arguments.userid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudquestions_user_24078" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM audquestions_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserQuestions: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudquestions_user_24501" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                q.qid, 
                q.qtext, 
                q.qtypeid, 
                q.qorder, 
                a.answerID, 
                a.eventid, 
                a.aText, 
                a.aRating, 
                a.amemo, 
                qt.qtype
            FROM 
                audquestions_user q
            INNER JOIN 
                audanswers a ON a.qID = q.qid
            INNER JOIN 
                audqtypes qt ON qt.qtypeid = q.qtypeid
            WHERE 
                a.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#"> 
                AND a.isdeleted IS FALSE 
                AND q.isDeleted IS false
            ORDER BY 
                q.qorder
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getQuestionsAndAnswers: #cfcatch.message#">
            <cfset result = queryNew("qid,qtext,qtypeid,qorder,answerID,eventid,aText,aRating,amemo,qtype")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudquestions_user" access="public" returntype="void">
    <cfargument name="new_qTypeID" type="numeric" required="true">
    <cfargument name="new_qtext" type="string" required="true">
    <cfargument name="new_qorder" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audquestions_user (qTypeID, qtext, qorder, userid, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qTypeID#" null="#NOT len(trim(arguments.new_qTypeID))#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtext#" maxlength="500" null="#NOT len(trim(arguments.new_qtext))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qorder#" null="#NOT len(trim(arguments.new_qorder))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudQuestionsUser: #cfcatch.message# Query: INSERT INTO audquestions_user (qTypeID, qtext, qorder, userid, isDeleted) VALUES (...)" />
            <cfthrow message="Database error occurred." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudquestions_user" access="public" returntype="void">
    <cfargument name="new_qTypeID" type="numeric" required="true">
    <cfargument name="new_qtext" type="string" required="true">
    <cfargument name="new_qorder" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_qID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="#application.datasource#">
            UPDATE audquestions_user 
            SET 
                qTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qTypeID#" null="#NOT len(trim(arguments.new_qTypeID))#" />,
                qtext = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_qtext#" maxlength="500" null="#NOT len(trim(arguments.new_qtext))#" />,
                qorder = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qorder#" null="#NOT len(trim(arguments.new_qorder))#" />,
                userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_userid#" null="#NOT len(trim(arguments.new_userid))#" />,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#" />
            WHERE 
                qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audquestions_user: #cfcatch.message# Query: UPDATE audquestions_user SET qTypeID, qtext, qorder, userid, isDeleted WHERE qID. Parameters: #serializeJSON(arguments)#">
            <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
