<cfquery result="result"  datasource="abod" name="z"  >
Select * from tickets
</cfquery>  
<cfloop query="z">
    
    
<cfquery result="result"  datasource="abo" name="update"  >   
        update tickets
        set ticketname  = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#z.ticketname#" />
    ,ticketstatus  = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#z.ticketstatus#" />
    ,ticketpriority  = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#z.ticketpriority#" />
    ,tickettype  = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#z.tickettype#" />
    <cfif #z.verid# is not "">
    ,verid  = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#z.verid#" />
        </cfif>
    
        <cfif #z.esthours# is not "">
    ,esthours = <cfquery result="result" param cfsqltype="cf_sql_decimal" value="#z.esthours#" />
    </cfif>
     ,patchnote  = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#z.patchnote#" />
     ,isdeleted  = <cfquery result="result" param cfsqltype="cf_sql_bit" value="#z.isdeleted#" />
        where ticketid = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#z.ticketid#" />
        </cfquery>   
    
    
    
</cfloop>
            
        
        
        
                
