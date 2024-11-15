<!--- This ColdFusion page handles the insertion of update logs into the database. --->

<cfquery name="INSERT">	
    <!--- Insert a new record into the updatelog table with the provided values. --->
    INSERT INTO updatelog (
        oldValue,
        NewValue,
        recordname,
        updatename,
        recid,
        compid,
        userid,
        updatedetails
    )
    VALUES (
        <Cfqueryparam value="#oldvalue#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#newvalue#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#recordname#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#updatename#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#recid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#compid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#updatedetails#" cfsqltype="CF_SQL_VARCHAR" />
    )
</cfquery>
