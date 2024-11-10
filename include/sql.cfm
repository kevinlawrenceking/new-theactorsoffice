<!--- This ColdFusion page processes a query and generates an insert script for a specified database table. ---> 
<cfinclude template="/include/qry/y_292_1.cfm" /> 

<cfloop query="y"> <!--- Loop through each record in the query 'y' ---> 
    <cfset compTable = y.new_comptable /> 
    <cfinclude template="/include/qry/allfields_292_2.cfm" /> 
    <cfinclude template="/include/qry/x_292_3.cfm" /> 
    <cfinclude template="/include/qry/findp_292_4.cfm" /> 
    <cfset recId = findp.field /> 

    <cfsavecontent variable="stuff"> 
        <cfoutput> 
            &lt;cfinclude template="/include/remote_load.cfm" /&gt;
            <cfloop query="x"> <!--- Loop through each field in query 'x' ---> 
                <cfif x.type is "bit(1)"> 
                    &lt;cfparam name="new_#x.field#" default="0" /&gt;
                <cfelse> 
                    &lt;cfparam name="new_#x.field#" default="#x.default#" /&gt;
                </cfif> 
            </cfloop> 

            &lt;cfquery name="#compTable#_ins" datasource="#dsn#" result="result" &gt;
            INSERT INTO #compTable# (
            <cfloop query="x"> 
                <cfif x.currentrow is not 1>, </cfif> 
                #x.field# 
            </cfloop>) 

            VALUES (
            <cfloop query="x">
                <!--- Generate values for the insert statement --->
                <cfscript>
                    origText = x.type;
                    newText = reReplaceNoCase(origText, "\([0-9]*\).*$", "", "all");
                </cfscript>
                <cfset new_maxvalue = "#replace('#x.type#','#newtext#','')#" />
                <cfset new_maxvalue = "#replace('#new_maxvalue#','(','')#" />
                <cfset new_maxvalue = "#replace('#new_maxvalue#',')','')#" />
                <cfset new_maxvalue = "#trim(new_maxvalue)#" />
                <cfinclude template="/include/qry/find_292_5.cfm" />
                <cfif #x.currentrow# is not "1">,#chr(10)##chr(13)#</cfif>
                #chr(60)#cfqueryparam cfsqltype="#find.cfparam#" value="#chr(35)#new_#x.field##chr(35)#" 
                <cfif #new_maxvalue# is not "" and #find.cfparam# is "CF_SQL_VARCHAR">maxlength="#new_maxvalue#"</cfif> 
                null="#chr(35)#NOT len(trim(new_#x.field#))#chr(35)#" /#chr(62)#
            </cfloop>#chr(10)##chr(13)#);
            #chr(60)#/cfquery#chr(62)##chr(10)##chr(13)#
            #chr(10)##chr(13)#
            #chr(60)#cfset new_#recid# = result.GENERATEDKEY /#chr(62)#
        </cfoutput>
    </cfsavecontent>
    
    <cfoutput>
        <cfset page_dir = "C:\home\theactorsoffice.com\wwwroot\#host#-subdomain\include\qry\xxx#comptable#_ins.cfm" />
    </cfoutput>
    
    <cffile action="write" file="#page_dir#" nameconflict="overwrite" output="#TRIM(stuff)#" />
</cfloop>
