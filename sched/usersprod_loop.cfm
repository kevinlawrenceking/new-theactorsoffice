 

  



<cfquery result="result"  name="x" datasource="abo" >
  SELECT * FROM taousers_tbl
</cfquery>

<cfloop query="x">
 

    
  <cfquery result="result"  name="setHashedPassword" datasource="abod" >
    UPDATE taousers_tbl
    SET
      useremail  = <cfquery result="result" param cfsqltype="varchar" value="#x.useremail#">
      ,userpassword  = <cfquery result="result" param cfsqltype="varchar" value="#x.userpassword#">
      ,passwordHash = <cfquery result="result" param cfsqltype="char" value="#x.passwordHash#">
      ,passwordSalt = <cfquery result="result" param cfsqltype="char" value="#x.passwordSalt#">
    WHERE userID = <cfquery result="result" param cfsqltype="integer" value="#x.userID#">
  </cfquery>
</cfloop>
      
      
      
    
