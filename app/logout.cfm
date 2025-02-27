<cfif #isdefined('userid')# > 
    
 <cfset StructDelete(Session, "userid")>
     
    </cfif>   
   <cfabort>
     <cflocation url="/loginform.cfm" />

