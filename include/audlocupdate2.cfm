<!--- This ColdFusion page handles the initialization of parameters for an audition location and redirects to a specified URL after processing. --->
<cfparam name="newAudLocId" default="" />
<cfparam name="newEventLocation" default="" />
<cfparam name="newAudLocAdd1" default="" />
<cfparam name="newAudLocAdd2" default="" />
<cfparam name="newAudCity" default="" />
<cfparam name="newAudZip" default="" />
<cfparam name="newRegionId" default="" />
<cfparam name="newIsDeleted" default="0" />

<!--- Include the query for updating audition locations --->
<cfinclude template="/include/qry/audLocationsUpd371.cfm" />

<!--- Set the return URL for redirection after processing --->
<cfset returnUrl = "/app/audition/?audProjectId=" & audProjectId & "&eventId=" & eventId & "&secId=" & secId & "&focusId=" & eventId />

<!--- Redirect to the specified return URL --->
<cflocation url="#returnUrl#" addtoken="no"/>

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary <cfoutput> tags around variable outputs.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->