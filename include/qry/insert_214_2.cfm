<!--- This ColdFusion page handles the insertion of answers into the audanswers table. --->

<cfquery name="insert">
    <!--- Insert a new answer into the audanswers table with the specified question ID and event ID. --->
    INSERT INTO `audanswers` (`qid`, `eventid`)
    VALUES (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#x.qid#">, 
        <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
    );
</cfquery>
