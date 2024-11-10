<!--- This ColdFusion page handles bulk actions for system management, including setting session variables and including necessary query templates. ---> 
<cfset debugFlag = "n" /> 
<cfparam name="idList" default="0" /> 

<!--- Check if session.idList is not defined and set it to idList if true ---> 
<cfif not isDefined('session.idList')> 
    <cfset session.idList = idList /> 
</cfif> 

<!--- If idList is "0" and session.idList is not "0", set idList to session.idList ---> 
<cfif idList eq "0" and session.idList neq "0"> 
    <cfset idList = session.idList /> 
</cfif> 

<!--- Set the session action to "bulk" ---> 
<cfset session.pageAction = "bulk" /> 

<!--- Include the first query template for finding records ---> 
<cfinclude template="/include/qry/find_d_104_1.cfm" /> 

<!--- Include the second query template for deleting systems ---> 
<cfinclude template="/include/qry/deleteSystem_104_2.cfm" /> 

<!--- Redirect to the contacts page with appropriate parameters ---> 
<cflocation url="/app/contacts/?pgaction=bulk&bt=system&d=#find_d.recordCount#&s=0&a=0&t=#newSystemId#" />

<!--- Modifications: Standardized variable names and casing (Rule 5), maintained consistent conditional logic (Rule 1), removed unnecessary # symbols in conditional checks (Rule 3), ensured consistent attribute quoting, spacing, and formatting (Rule 6). --->