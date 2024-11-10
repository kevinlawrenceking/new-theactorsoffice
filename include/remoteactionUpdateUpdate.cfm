<!--- This ColdFusion page handles parameter initialization, includes necessary query templates, and redirects the user to a specified location. --->

<cfparam name="deleteaction" default="0" /> 
<cfparam name="ver" default="" />
<cfparam name="actionDaysNo" default="0" />

<!--- Include the first query template for updates --->
<cfinclude template="/include/qry/update_195_1.cfm" />

<!--- Include the second query template for k_195 --->
<cfinclude template="/include/qry/k_195_2.cfm" />

<!--- Loop through the query results from k --->
<cfloop query="k">
    
    <!--- Include the third query template for updates --->
    <cfinclude template="/include/qry/up_195_3.cfm" />
    
</cfloop>  

<!--- Redirect the user to the specified location with parameters --->
<cflocation url="/app/myaccount/?new_pgid=125&target_id_system=#target_id_system#&t7=1" />
