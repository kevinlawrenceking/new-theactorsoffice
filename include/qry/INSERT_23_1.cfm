<!--- This ColdFusion page handles the insertion of attachment records into the database. --->

<cfquery name="INSERT" result="result">
    <!--- Insert a new attachment record into the attachments table --->
    INSERT INTO attachments (
        attachname,
        attachfilename,
        isdeleted,
        userid,
        noteid
    )
    VALUES (
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#attachname#" />,
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#attachfilename#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="0" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#noteid#" />
    )
</cfquery>
