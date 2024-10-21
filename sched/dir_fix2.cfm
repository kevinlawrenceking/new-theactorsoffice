

<cfquery  name="x">
SELECT id FROM pgfiles WHERE id IN (SELECT distinct script_name  from bigbrother )
</cfquery>
    
    
<cfloop query="x">

 
    
            <cfquery  name="insert">
      update pgfiles 
                set filestatus = 'Confirmed' where id = '#x.id#'
            </cfquery>

          
 
    
    
    
   
    </cfloop>
                
   <cfquery  name="z">      
update pgfiles
SET filestatus = 'Confirmed'
WHERE id IN (SELECT distinct script_name  from bigbrother ) and filestatus = 'Found'
</cfquery>
