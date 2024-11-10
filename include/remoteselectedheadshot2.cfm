<!--- This ColdFusion page handles user session data and includes query templates for processing audition information. It redirects the user to a specific URL after setting the return URL. ---> 
<cfset userID = session.userID /> 

<!--- Include first query template for audition processing ---> 
<cfinclude template="/include/qry/ins_252_1.cfm" /> 

<!--- Include second query template for audition processing ---> 
<cfinclude template="/include/qry/ins_252_2.cfm" /> 

<!--- Set the return URL for redirection after processing ---> 
<cfset returnUrl = "/app/audition/?audprojectid=" & audProjectID & "&secid=196" /> 

<!--- Redirect the user to the specified return URL ---> 
<cflocation url="#returnUrl#" />

<!--- Changes: Standardized variable names and casing (Rule 5), Removed unnecessary <cfoutput> tags around variable outputs (Rule 2) --->