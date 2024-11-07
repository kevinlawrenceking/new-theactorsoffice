<cfcomponent displayname="AuditionAnswerService" hint="Handles operations for AuditionAnswer table" output="false">

    <cffunction name="DELaudanswers" access="public" returntype="void">
        <cfargument name="eventid" type="numeric" required="true">

        <cfquery datasource="abod">
            DELETE FROM audanswers
            WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#">
        </cfquery>
    </cffunction>

    <cffunction name="INSaudanswers" access="public" returntype="void">
        <cfargument name="qid" type="numeric" required="true">
        <cfargument name="eventid" type="numeric" required="true">

        <cfquery datasource="abod">
            INSERT INTO audanswers (qid, eventid)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.qid#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#">
            )
        </cfquery>
    </cffunction>

    <cffunction name="UPDaudanswers" access="public" returntype="void">
        <cfargument name="new_qtype" type="string" required="true">
        <cfargument name="new_value" required="true">
        <cfargument name="new_answerID" type="numeric" required="true">

        <cfquery datasource="abod">
            UPDATE audanswers SET 
            <cfif arguments.new_qtype eq "text">
                aText = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_value#" null="#NOT len(trim(arguments.new_value))#">
            <cfelseif arguments.new_qtype eq "rating">
                aRating = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_value#" null="#NOT len(trim(arguments.new_value))#">
            <cfelseif arguments.new_qtype eq "long">
                aMemo = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_value#" null="#NOT len(trim(arguments.new_value))#">
            </cfif>
            WHERE answerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_answerID#">
        </cfquery>
    </cffunction>

    <cffunction name="INSaudanswers_24506" access="public" returntype="void">
        <cfargument name="new_qID" type="numeric" required="true">
        <cfargument name="new_eventid" type="numeric" required="true">
        <cfargument name="new_aText" type="string" required="true">
        <cfargument name="new_aRating" type="numeric" required="true">
        <cfargument name="new_aMemo" type="string" required="true">
        <cfargument name="new_isDeleted" type="boolean" required="true">

        <cfquery datasource="abodName">
            INSERT INTO audanswers (qID, eventid, aText, aRating, aMemo, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#" null="#NOT len(trim(arguments.new_qID))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#" null="#NOT len(trim(arguments.new_eventid))#">,
                <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aText#" null="#NOT len(trim(arguments.new_aText))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_aRating#" null="#NOT len(trim(arguments.new_aRating))#">,
                <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aMemo#" null="#NOT len(trim(arguments.new_aMemo))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
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

        <cfquery datasource="abod">
            UPDATE audanswers 
            SET 
                qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_qID#" null="#NOT len(trim(arguments.new_qID))#">,
                eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_eventid#" null="#NOT len(trim(arguments.new_eventid))#">,
                aText = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aText#" null="#NOT len(trim(arguments.new_aText))#">,
                aRating = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_aRating#" null="#NOT len(trim(arguments.new_aRating))#">,
                aMemo = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.new_aMemo#" null="#NOT len(trim(arguments.new_aMemo))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                answerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_answerID#">
        </cfquery>
    </cffunction>

</cfcomponent>
