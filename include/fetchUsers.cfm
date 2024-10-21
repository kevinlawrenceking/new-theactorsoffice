
<cfset userService = new "services.UserService"()>
<cfset userData = userService.getUserById(userid)>
 
<Cfdump var="#userdata#"><cfaborT>


<cfif structIsEmpty(userData)>
    <cfoutput>Not found!</cfoutput>
    <cfabort>
</cfif>

<!--- Set user-related variables from the retrieved user data --->
<cfset userId = UserData.user.userId />
<cfset recordName = UserData.user.recordName />
<cfset isDeleted = UserData.user.isDeleted />
<cfset nletter_yn = UserData.user.nletter_yn />
<cfset nletter_link = UserData.user.nletter_link />
<cfset calSlotDuration = UserData.user.calSlotDuration />
<cfset userStatus = UserData.user.userStatus />
<cfset recover = UserData.user.recover />
<cfset isAudition = UserData.user.isAudition />
<cfset imdbId = UserData.user.imdbId />
<cfset isSetup = UserData.user.isSetup />
<cfset dateFormatID = UserData.user.dateFormatID />
<cfset datePrefID = UserData.user.datePrefID />
<cfset add1 = UserData.user.add1 />
<cfset add2 = UserData.user.add2 />
<cfset city = UserData.user.city />
<cfset region_id = UserData.user.region_id />
<cfset zip = UserData.user.zip />
<cfset viewtypeid = UserData.user.viewtypeid />
<cfset refresh_token = UserData.user.refresh_token />
<cfset access_token = UserData.user.access_token />
<cfset userContactid = UserData.user.userContactID />
<cfset CalStarttime = UserData.user.calstarttime />
<cfset Calendtime = UserData.user.calendtime />
<cfset avatarname = UserData.user.avatarname />
<cfset isBetaTester = UserData.user.isBetaTester />
<cfset defRows = UserData.user.defRows />
<cfset defcountry = UserData.country.countryid />
<cfset defState = UserData.user.region_id />
<cfset countryname = UserData.country.countryname />
<cfset def_countryid = UserData.user.countryid />
<cfset new_countryid = UserData.user.countryid />
<cfset def_region_id = UserData.user.region_id />
<cfset new_region_id = UserData.user.region_id />
<cfset region = UserData.region.regionname />
<cfset tzid = UserData.user.tzid />
<cfset customerid = UserData.user.customerid />
<cfset isauditionmodule = UserData.user.isauditionmodule />
<cfset userFirstName = UserData.user.userfirstName />
<cfset userLastName = UserData.user.userLastName />
<cfset userEmail = UserData.user.useremail />
<cfset userRole = UserData.user.userRole />
<cfset formatexample = UserData.user.formatexample />

<!--- Set thrivecart-related variables from the retrieved user data --->
<cfset planName = UserData.user.planName />
<cfset BaseProductLabel = UserData.user.BaseProductLabel />

<cfset tzname = UserData.timezone.tzname />
<cfset tzgeneral = UserData.timezone.tzgeneral />

<!--- Set thrivecart data variables --->
<cfset id = userData.thrivecart.id />
<cfset customerFirst = userData.thrivecart.customerFirst />
<cfset customerLast = userData.thrivecart.customerLast />
<cfset purchaseDate = userData.thrivecart.purchaseDate />
<cfset customerFullName = userData.thrivecart.customerFullName />
<cfset baseProductName = userData.thrivecart.baseProductName />
<cfset customerEmail = userData.thrivecart.customerEmail />
<cfset purchaseName = userData.thrivecart.purchaseName />
<cfset billingAddress = userData.thrivecart.billingAddress />
<cfset billingCity = userData.thrivecart.billingCity />
<cfset billingZip = userData.thrivecart.billingZip />
<cfset billingCountry = userData.thrivecart.billingCountry />
<cfset billingState = userData.thrivecart.billingState />
<cfset invoiceId = userData.thrivecart.invoiceId />
<cfset customerId = userData.thrivecart.customerId />
<cfset baseProductLabel = userData.thrivecart.baseProductLabel />
<cfset baseProductId = userData.thrivecart.baseProductId />
<cfset orderDate = userData.thrivecart.orderDate />
<cfset trialDays = userData.thrivecart.trialDays />
<cfset trialEndDate = userData.thrivecart.trialEndDate />
<cfset purchaseAmountCents = userData.thrivecart.purchaseAmountCents />
<cfset basePaymentPlanId = userData.thrivecart.basePaymentPlanId />
<cfset status = userData.thrivecart.status />
<cfset uuid = userData.thrivecart.uuid />
<cfset isDemo = userData.thrivecart.isDemo />
<cfset isDeleted = userData.thrivecart.isDeleted />
<cfset cancelDate = userData.thrivecart.cancelDate />

<cfset regionName = userData.region.regionName />
<cfset countryName = userData.country.countryName />
