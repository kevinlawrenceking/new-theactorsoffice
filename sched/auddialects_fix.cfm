  <h3>Auddialects</h3>
    
<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfif #host# is "app">
    <cfset dsn = "abo" />
  <cfoutput>  <cfset rev = "#rand()#" /> </cfoutput>
    <cfset suffix = "_1.5" />
    <cfset information_schema = "actorsbusinessoffice" />
    <cfelse>
  <cfset dsn = "abod" />
<cfset rev = rand() />
        <cfset suffix = "" />
        
    <cfset information_schema = "new_development" />
</cfif>
    
    
    <cfset rev = rand() />
    
    

    
     <cfquery    name="u"  >
        SELECT * from taousers     
    </cfquery>

    <cfloop query="u">

         <cfquery  name="x"  >
            SELECT auddialectid,
auddialect,
audcatid,
isDeleted
 FROM auddialects
        </cfquery>

        <cfloop query="x">
            
             <cfquery  name="find"  >
            Select * from auddialects_user
            where auddialect = '#x.auddialect#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <cfquery  name="insert"  >
                    
                    INSERT INTO `auddialects_user` (`auddialect`, `audcatid`, `userid`) 
                    VALUES ('#x.auddialect#','#x.audcatid#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                 auddialects added: #x.auddialect# (user #u.userid#)<BR>
                </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>
