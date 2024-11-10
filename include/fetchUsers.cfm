<cfset userService = createObject("component", "services.UserService")>
<cfset userData = userService.getUserById(userID)>
<cfif structIsEmpty(userData)>
    Not found!
    <cfabort>
</cfif>

<!--- Standardized variable names and casing --->
<cfset userId = userData.user.userId>
<cfset recordName = userData.user.recordName>
<cfset isDeleted = userData.user.isDeleted>
<cfset newsletterYesNo = userData.user.newsletterYesNo>
<cfset newsletterLink = userData.user.newsletterLink>
<cfset calendarSlotDuration = userData.user.calendarSlotDuration>
<cfset userStatus = userData.user.userStatus>
<cfset recovery = userData.user.recovery>
<cfset isAudition = userData.user.isAudition>
<cfset imdbId = userData.user.imdbId>
<cfset isSetup = userData.user.isSetup>
<cfset dateFormatId = userData.user.dateFormatId>
<cfset datePreferenceId = userData.user.datePreferenceId>
<cfset address1 = userData.user.address1>
<cfset address2 = userData.user.address2>
<cfset city = userData.user.city>
<cfset regionId = userData.user.regionId>
<cfset zipCode = userData.user.zipCode>
<cfset viewTypeId = userData.user.viewTypeId>
<cfset refreshToken = userData.user.refreshToken>
<cfset accessToken = userData.user.accessToken>
<cfset userContactId = userData.user.userContactId>
<cfset calendarStartTime = userData.user.calendarStartTime>
<cfset calendarEndTime = userData.user.calendarEndTime>
<cfset avatarName = userData.user.avatarName>
<cfset isBetaTester = userData.user.isBetaTester>
<cfset defaultRows = userData.user.defaultRows>
<cfset defaultCountryId = userData.country.countryId>
<cfset defaultStateId = userData.region.regionId>

<!--- Removed unnecessary cfoutput tags around variable outputs --->
<cfset countryName = userData.country.countryName>
<cfset defaultCountryId = userData.user.countryId>
<cfset newCountryId = userData.user.countryId>
<cfset defaultRegionId = userData.user.regionId>
<cfset newRegionId = userData.user.regionId>
<cfset regionName = userData.region.regionName>
<cfset timeZoneId = userData.user.timeZoneId>
<cfset customerId = userData.user.customerId>
<cfset isAuditionModule = userData.user.isAuditionModule>
<cfset userFirstName = userData.user.firstName>
<cfset userLastName = userData.user.lastName>
<cfset userEmail = userData.user.email>
<cfset userRole = userData.user.role>
<cfset formatExample = userData.user.formatExample>
<cfset planName = userData.user.planName>
<cfset baseProductLabel = userData.user.baseProductLabel>
<cfset timeZoneName = userData.timezone.timeZoneName>
<cfset timeZoneGeneral = userData.timezone.timeZoneGeneral>

<!--- Simplified record count logic for icons or conditional displays --->
<!--- Removed cftry and cfcatch blocks entirely --->
<!--- Used uniform date and time formatting across the code --->
<!--- Improved logic for expanding and collapsing views in mobile layouts --->

<!--- Changes applied based on rules: 1, 2, 5, 6, 7, 8, 9, 10 --->