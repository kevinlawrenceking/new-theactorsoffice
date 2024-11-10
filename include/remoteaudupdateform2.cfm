<!--- This ColdFusion page processes audition details and updates event information based on specific conditions. --->
<cfparam name="newAudBookTypeId" default="0" />
<cfparam name="essence" default="" />

<!--- Include the initial query for finding records --->
<cfinclude template="/include/qry/find_222_1.cfm" />

<!--- Check conditions for CustomPlatform and handle accordingly --->
<cfif newAudPlatformId eq "CustomPlatform" and len(CustomPlatform) and not find.recordcount>
    <cfinclude template="/include/qry/insert_28_11.cfm" />
    <cfset newAudPlatformId = resultx.generatedkey />
<cfelseif newAudPlatformId eq "CustomPlatform" and len(CustomPlatform) and find.recordcount>
    <cfset newAudPlatformId = find.audplatformid />
<cfelseif newAudPlatformId eq "CustomPlatform" and not len(CustomPlatform)>
    <cfset newAudPlatformId = oldAudPlatformId />
</cfif>

<!--- Include additional queries for auditions and event activation --->
<cfinclude template="/include/qry/auditions_upd.cfm" />
<cfinclude template="/include/qry/activate_222_3.cfm" />
<cfinclude template="/include/qry/findEvent_222_4.cfm" />
<cfinclude template="/include/qry/auditionDetails_222_5.cfm" />
<cfinclude template="/include/qry/projectDetails_222_6.cfm" />

<!--- Set variables based on audition and project details --->
<cfset newAudTypeId = auditionDetails.audtypeid />
<cfset newAudLocation = auditionDetails.audLocation />
<cfset newAudLocId = auditionDetails.audlocid />
<cfset newEventStart = auditionDetails.eventStart />
<cfset newEventStartTime = auditionDetails.eventStartTime />
<cfset newEventStopTime = auditionDetails.eventStopTime />
<cfset newContactId = projectDetails.contactid />
<cfset newProjName = projectDetails.projName />
<cfset newProjDescription = projectDetails.projDescription />

<!--- Check if an event record exists and update if necessary --->
<cfif FindEvent.recordcount>
    <cfinclude template="/include/qry/updateEvent_222_7.cfm" />
</cfif>

<!--- Handle case where no event record is found --->
<cfif not findEvent.recordcount>
    <!--- Additional logic can be added here if needed --->
</cfif>

<!--- Prepare return URL for redirection --->
<cfset returnUrl = "/app/audition/?audprojectid=" & audprojectid & "&secid=" & secid />

<!--- Redirect to the return URL --->
<cflocation url="#returnUrl#" addtoken="no" />

<!--- Modifications: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Simplified record count logic for icons or conditional displays.
6. Removed cftry and cfcatch blocks entirely.
--->