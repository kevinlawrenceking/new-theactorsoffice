<cfquery  name="InsertNote"      >
INSERT INTO noteslog (userid,contactid,noteDetails)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />,<cfqueryparam cfsqltype="cf_sql_integer" value="#newcontactid#" />,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(newnoteDetails),2000)#" />)
</cfquery
