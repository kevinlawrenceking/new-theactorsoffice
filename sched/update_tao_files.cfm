
<cfdirectory action="list" directory="C:/home/theactorsoffice.com/optimized/include/qry" name="qryFiles" filter="*.cfm">

<cfloop query="qryFiles">

    <cfquery result="result"  name="checkFileExists" datasource="abod">
        SELECT id
        FROM tao_files
        WHERE filename = <cfquery result="result" param value="#qryFiles.name#" cfsqltype="cf_sql_varchar">
          AND path = '/include/qry'
    </cfquery>

 
    <cfif checkFileExists.recordcount EQ 0>
  
        <cfquery result="result"  datasource="abod">
            INSERT INTO tao_files (parent_id,filename, `path`, status, qry_removed_yn, qry_extract_yn, qry_no)
            VALUES (0,
                <cfquery result="result" param value="#qryFiles.name#" cfsqltype="cf_sql_varchar">,
                <cfquery result="result" param value="/include/qry" cfsqltype="cf_sql_varchar">,
                <cfquery result="result" param value="existing" cfsqltype="cf_sql_varchar">,
                <cfquery result="result" param value="1" cfsqltype="cf_sql_tinyint">,
                <cfquery result="result" param value="0" cfsqltype="cf_sql_tinyint">,
                <cfquery result="result" param value="0" cfsqltype="cf_sql_integer">
            )
        </cfquery>

        <cfoutput>New file inserted: #qryFiles.name#<br></cfoutput>
    </cfif>

</cfloop>
