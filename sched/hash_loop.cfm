 

  



<cfquery result="result"  name="getUsers" datasource="abo" >
  SELECT * FROM taousers_tbl
</cfquery>

<cfloop query="getUsers">
  <cfset new_passwordSalt = hash(generateSecretKey("AES"),"SHA-512")>

    
  <cfquery result="result"  name="setHashedPassword" datasource="abo" >
    UPDATE taousers_tbl
    SET
      passwordHash = <cfquery result="result" param cfsqltype="char" value="#hash(userPassword & new_passwordSalt,'SHA-512')#">,
      passwordSalt = <cfquery result="result" param cfsqltype="char" value="#new_passwordSalt#">
    WHERE userID = <cfquery result="result" param cfsqltype="integer" value="#userID#">
  </cfquery>
</cfloop>
      
      
      
    
