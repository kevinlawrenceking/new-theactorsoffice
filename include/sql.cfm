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
            <cfloop query="x"> <!--- Generate values for the insert statement ---> 
                <cfscript> 
                    origText = x.type; 
                    newText = reReplaceNoCase(origText, "\([0-9]*\).*$", "", "all"); 
                </cfscript> 

                <cfset newMaxValue = replace(x.type, newText, '') /> 
                <cfset newMaxValue = replace(newMaxValue, '(', '') /> 
                <cfset newMaxValue = replace(newMaxValue, ')', '') /> 
                <cfset newMaxValue = trim(newMaxValue) /> 

                <cfinclude template="/include/qry/find_292_5.cfm" /> 

                <cfif x.currentrow is not 1>, </cfif> 
                &lt;cfqueryparam cfsqltype="#find.cfparam#" value="#new_#x.field#" 
                    <cfif newMaxValue is not "" and find.cfparam is "CF_SQL_VARCHAR">maxlength="#newMaxValue#"</cfif> 
                    null="#NOT len(trim(new_#x.field#))#" /&gt;
            </cfloop>
            ); 
            &lt;/cfquery&gt;

            &lt;cfset new_#recId# = result.GENERATEDKEY /&gt;
        </cfoutput> 
    </cfsavecontent> 

    <cfset pageDir = "C:\home\theactorsoffice.com\wwwroot\#host#-subdomain\include\qry\xxx#compTable#_ins.cfm" /> 
    <cffile action="write" file="#pageDir#" nameconflict="overwrite" output="#TRIM(stuff)#" /> 
</cfloop>

<!--- Changes: 1. Simplified conditional logic. 2. Removed unnecessary cfoutput tags. 3. Removed # symbols in conditional checks. 4. Standardized variable names and casing. 5. Ensured consistent attribute quoting, spacing, and formatting. 6. Removed cftry and cfcatch blocks. 7. Replaced # symbols with double pound signs in cfoutput blocks where not meant as ColdFusion variables. --->