<cfcomponent displayname="AuditionAnswerService" hint="Handles operations for AuditionAnswer table" output="false">

    <cffunction name="DELaudanswers" access="public" returntype="void">
        <cfargument name="eventid" type="numeric" required="true">

        <cfquery result="result" >
            DELETE FROM audanswers
            WHERE eventid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.eventid#">
        </cfquery>
    </cffunction>

    <cffunction name="INSaudanswers" access="public" returntype="void">
        <cfargument name="qid" type="numeric" required="true">
        <cfargument name="eventid" type="numeric" required="true">

        <cfquery result="result" >
            INSERT INTO audanswers (qid, eventid)
            VALUES (
                <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.qid#">,
                <cfquery result="result" param cfsqltype="cf_sql_integer" value="#arguments.eventid#">
            )
        </cfquery>
    </cffunction>

    <cffunction name="UPDaudanswers" access="public" returntype="void">
        <cfargument name="new_qtype" type="string" required="true">
        <cfargument name="new_value" required="true">
        <cfargument name="new_answerID" type="numeric" required="true">

        <cfquery result="result" >
            UPDATE audanswers SET 
            <cfif arguments.new_qtype eq "text">
                aText = <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_value#" null="#NOT len(trim(arguments.new_value))#">
            <cfelseif arguments.new_qtype eq "rating">
                aRating = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_value#" null="#NOT len(trim(arguments.new_value))#">
            <cfelseif arguments.new_qtype eq "long">
                aMemo = <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_value#" null="#NOT len(trim(arguments.new_value))#">
            </cfif>
            WHERE answerID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_answerID#">
        </cfquery>
    </cffunction>

    <cffunction name="INSaudanswers_24506" access="public" returntype="void">
        <cfargument name="new_qID" type="numeric" required="true">
        <cfargument name="new_eventid" type="numeric" required="true">
        <cfargument name="new_aText" type="string" required="true">
        <cfargument name="new_aRating" type="numeric" required="true">
        <cfargument name="new_aMemo" type="string" required="true">
        <cfargument name="new_isDeleted" type="boolean" required="true">

        <cfquery result="result" >
            INSERT INTO audanswers (qID, eventid, aText, aRating, aMemo, isDeleted)
            VALUES (
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">,
                <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aText#">,
                <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_aRating#">,
                <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aMemo#">,
                <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">
            )
        </cfquery>
    </cffunction>

    <cffunction name="UPDaudanswers_24507" access="public" returntype="void">
        <cfargument name="new_qID" type="numeric" required="true">
        <cfargument name="new_eventid" type="numeric" required="true">
        <cfargument name="new_aText" type="string" required="true">
        <cfargument name="new_aRating" type="numeric" required="true">
        <cfargument name="new_aMemo" type="string" required="true">
        <cfargument name="new_isDeleted" type="boolean" required="true">
        <cfargument name="new_answerID" type="numeric" required="true">

        <cfquery result="result" >
            UPDATE audanswers 
            SET 
                qID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#">,
                eventid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#">,
                aText = <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aText#">,
                aRating = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_aRating#">,
                aMemo = <cfquery result="result" param cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aMemo#">,
                isDeleted = <cfquery result="result" param cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#">
            WHERE 
                answerID = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_answerID#">
        </cfquery>
    </cffunction>

</cfcomponent>