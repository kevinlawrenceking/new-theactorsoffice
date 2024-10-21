
<cfset userService = new "services.UserService"()>
<cfset userData = userService.getUserByIds(userID)>

<!--- Check if the query returned any rows --->
<cfif userData.recordCount EQ 0>
    <cfoutput>Not found!</cfoutput>
    <cfabort>
</cfif>

<!--- Assuming the query returns only one record, you can fetch values from the first row (row 1) --->
<cfset userId = userData.userID[1] />
<cfset isDeleted = userData.isDeleted[1] />
<cfset userFirstName = userData.userFirstName[1] />
<cfset userLastName = userData.userLastName[1] />
<cfset userEmail = userData.userEmail[1] />
<cfset nletter_yn = userData.nletter_yn[1] />
<cfset nletter_link = userData.nletter_link[1] />
<cfset calSlotDuration = userData.calSlotDuration[1] />
<cfset userStatus = userData.userstatus[1] />
<cfset recover = userData.recover[1] />
<cfset isAudition = userData.isAudition[1] />
<cfset imdbId = userData.imdbid[1] />
<cfset isSetup = userData.isSetup[1] />
<cfset dateFormatID = userData.dateFormatID[1] />
<cfset datePrefID = userData.datePrefID[1] />
<cfset add1 = userData.add1[1] />
<cfset add2 = userData.add2[1] />
<cfset city = userData.city[1] />
<cfset region_id = userData.region_id[1] />
<cfset zip = userData.zip[1] />
<cfset viewtypeid = userData.viewtypeid[1] />
<cfset refresh_token = userData.refresh_token[1] />
<cfset access_token = userData.access_token[1] />
<cfset userContactid = userData.contactid[1] />
<cfset CalStarttime = userData.calStartTime[1] />
<cfset Calendtime = userData.calEndTime[1] />
<cfset avatarname = userData.avatarName[1] />
<cfset isBetaTester = userData.isBetaTester[1] />
<cfset defRows = userData.defRows[1] />

<!--- Assuming you are fetching these values in the same query or have separate queries for them --->
<!--- If these columns don’t exist in your original query, add them to the SQL or handle them separately --->
<cfset defcountry = userData.countryid[1] />
<cfset defState = userData.region_id[1] />

<!--- Set any additional variables as needed --->
<cfoutput>
    User ID: #userId#<br>
    First Name: #userFirstName#<br>
    Last Name: #userLastName#<br>
    Email: #userEmail#<br>
    Role: #userRole#<br>
    <!--- Output other variables similarly --->
</cfoutput>
