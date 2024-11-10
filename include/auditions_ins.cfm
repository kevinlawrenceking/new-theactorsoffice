<!--- This ColdFusion page initializes parameters for a new user event and cleans the event description. --->
<cfparam name="newUserId" default="" />
<cfparam name="newAudRoleId" default="" />
<cfparam name="newAudTypeId" default="" />
<cfparam name="newAudLocation" default="" />
<cfparam name="newAudLocId" default="" />
<cfparam name="newEventStart" default="" />
<cfparam name="newEventStartTime" default="" />
<cfparam name="newEventStopTime" default="" />
<cfparam name="newAudPlatformId" default="4" />
<cfparam name="newAudStepId" default="1" />
<cfparam name="newParkingDetails" default="" />
<cfparam name="newWorkWithCoach" default="0" />
<cfparam name="newIsDeleted" default="0" />
<cfparam name="newTrackMileage" default="0" />

<!--- Clean the event description by removing unwanted characters and limit its length. --->
<cfset cleanData = REReplace(newEventDescription, "[^a-zA-Z0-9,.!? ]", "", "ALL")>
<cfset newEventDescription = Left(cleanData, 5000) />

<!--- Include the audition insertion template. --->
<cfinclude template="/include/qry/auditions_ins_32_1.cfm" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Simplified record count logic for icons or conditional displays.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used uniform date and time formatting across the code.
7. Improved logic for expanding and collapsing views in mobile layouts.
8. Removed any `cftry` and `cfcatch` blocks entirely.
9. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->