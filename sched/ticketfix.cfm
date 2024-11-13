

<cfquery result="result"  datasource="abod" name="x">
SELECT * FROM tickets WHERE verid = 7 AND ticketstatus = 'Implemented'
 
</cfquery>
   

<cfloop query="x">
    
    <cfquery result="result"  name="add" datasource="abo">
        INSERT INTO tickets (pgid,ticketName,ticketdetails,tickettype,userid,ticketactive,ticketstring,verid,ticketresponse,ticketcreateddate,ticketstatus,tickettype,environ,ticketpriority,esthours)
        Values (
        <cfquery result="result" param value="#x.pgid#" cfsqltype="cf_sql_integer" />
        ,
        <cfquery result="result" param value="#x.ticketName#" cfsqltype="cf_sql_varchar" />
        ,
        <cfquery result="result" param value="#x.ticketdetails#" cfsqltype="cf_sql_varchar" />
        ,
        <cfquery result="result" param value="#x.tickettype#" cfsqltype="cf_sql_varchar" />
        ,
        <cfquery result="result" param value="#x.userid#" cfsqltype="cf_sql_integer" />
        ,
        <cfquery result="result" param value="Y" cfsqltype="cf_sql_varchar" />
        ,
        <cfquery result="result" param value="#x.ticketstring#" cfsqltype="cf_sql_varchar" />
    
        ,
        <cfquery result="result" param value="8" cfsqltype="cf_sql_integer" />         
                                                               
         ,
        <cfquery result="result" param value="#x.ticketresponse#" cfsqltype="cf_sql_varchar" />                                                        ,
        <cfquery result="result" param value="#x.ticketcreateddate#" cfsqltype="cf_sql_date" />   
        
                ,
        <cfquery result="result" param value="Pending" cfsqltype="cf_sql_varchar" />
                                              ,
        <cfquery result="result" param value="Bug" cfsqltype="cf_sql_varchar" />     
        
        
                      ,
        <cfquery result="result" param value="D" cfsqltype="cf_sql_varchar" />   
        
          ,
        <cfquery result="result" param value="Medium" cfsqltype="cf_sql_varchar" />   
        
          ,
        <cfquery result="result" param value="#x.esthours#" cfsqltype="cf_sql_decimal" />   
        
        )


    </cfquery>
      
    
    
</cfloop>
