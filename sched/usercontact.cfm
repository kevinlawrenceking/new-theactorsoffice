

<cfquery result="result" name="loginQuery" datasource="abod" >
  SELECT * FROM taousers
</cfquery> 
 
<cfloop query="loginQuery">
<cfif #loginQuery.contactid# is "">

            <cfquery name="InsertContact"  datasource="abo"  result="result">  
                INSERT INTO contactdetails (contactfullname,userid,user_yn)
                values ('#loginQuery.userfirstname# #loginQuery.userlastname#',#loginQuery.userid#,'Y')
            </cfquery>
    
            <cfset new_contactid = result.generatedkey />
    
            <cfquery result="result" name="InsertContact"  datasource="abod" >  
            update taousers
            set contactid = #new_contactid#
            where userid = #loginQuery.userid#
            </cfquery>     
        
        </cfif> 

</cfloop>
