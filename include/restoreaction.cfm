<!--- This ColdFusion page processes queries and includes various templates for data handling and redirection. --->

<cfinclude template="/include/qry/x_283_1.cfm" />

<cfinclude template="/include/qry/de_283_3.cfm" />

<cfinclude template="/include/qry/uu_223_2.cfm" />

<!--- Loop through the 'u' query to include additional templates and process 'xs' queries. --->
<cfloop query="u">
    
    <cfinclude template="/include/qry/xs_283_5.cfm" />

    <!--- Loop through the 'xs' query to find records and potentially insert new ones. --->
    <cfloop query="xs">
        
        <cfinclude template="/include/qry/find_283_6.cfm" />
        
        <!--- Check if no records were found. If so, include the insert template. --->
        <cfif #find.recordcount# is "0">
            <cfinclude template="/include/qry/insert_283_7.cfm" />
        </cfif>

    </cfloop>

</cfloop>

<!--- Redirect to the specified URL with parameters. --->
<cflocation url="/app/myaccount/?t7=1&target_id_system=#target_id_system#" />

