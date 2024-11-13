

<cfquery result="result"   name="pgitems">
SELECT DISTINCT PARENTID AS id FROM pgfiles WHERE PARENTID NOT IN (SELECT ID FROM pgfiles)
AND PARENTID <> ''
ORDER BY LENGTH(PARENTID) desc
</cfquery>
    
    <Cfif #pgitems.recordcount# is "1">
    Done
    <cfabort>
        <Cfelse>
        another round!<BR>
    </Cfif>
<cfloop query="pgitems">

 
        <cfoutput>
            <cfset type="Dir" />
      <cfset id = "#pgitems.id#" />

                    
  <cfset PARENTID = ListDeleteAt(id, ListLen(id, "/"), "/")>                         
                                   
           
                    <cfset NAME ="#replace('#id#','#parentid#/','','All')#" />
      

             
             <cfset directory ="c:\home\theactorsoffice.com\wwwroot\dev-subdomain#replace('#parentid#','/','\','All')#" />
        <cfset status="Calculated" />
            <cfset size="0" />
            <cfset DateLastModified="" />
        </cfoutput>
            
            
            <cfif #name# contains ".">
              <cfset Ext = listLast(name,".")>
                  <cfelse>
                      <cfset ext = "" />
                    </cfif>

<Cfoutput>
                   select Id from `pgDIRs`
            where id = '#id#'<cfabort>
                  </Cfoutput>
         <cfquery result="result"   name="find">
            select Id from `pgDIRs`
            where id =
            
            <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#id#" />  
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfquery result="result"   name="insert">
                INSERT INTO `pgDIRs` (`DIRName`,`DIRDirectory`, `DIRstatus`, `DIRsize`, `DIRDateLastModified`, `DIRExt`, `ID`,`PARENTID`,`dirstatus`)

                VALUES
                (
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#Name#" />
                ,
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#Directory#" />
                ,
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#status#" />
                ,
                <cfquery result="result" param cfsqltype="cf_sql_integer" value="#size#" />
                ,
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#DateLastModified#" />
                ,
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#Ext#" />
                ,/>
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#id#" />
                                ,
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#PARENTID#" />
                
                ,
                <cfquery result="result" param cfsqltype="cf_sql_varchar" value="calclulated" />
                )
            </cfquery>

          

        </cfif>

    
    
    
    
    
    
    
   
    </cfloop>
                
         
