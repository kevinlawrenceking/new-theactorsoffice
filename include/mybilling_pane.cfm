<!--- This ColdFusion page displays billing information including invoice ID, purchase date, trial end date, product, and plan details. --->
<cfset authToken = "4OWaGHPXFibE">
<cfset userEmail = "kevinking7135@gmail.com">
<cfset apiUrl = "https://app.paykickstart.com/api/billing-customer?auth_token=#authToken#&email=#urlEncodedFormat(userEmail)#">

<!--- Make API request to fetch the secret --->
<cfhttp url="#apiUrl#" method="post" result="apiResponse">
    <cfhttpparam type="header" name="Cookie" value="laravel_session=YOUR_SESSION_COOKIE">
</cfhttp>

<!--- Parse the JSON response --->
<cfset responseData = DeserializeJSON(apiResponse.fileContent)>

<!--- Extract the secret --->
<cfif structKeyExists(responseData, "status") AND responseData.status EQ true>
    <cfset secret = responseData.secret>
<cfelse>
    <cfset secret = "">
</cfif>

<!--- Debug Output (Remove in Production) --->
<cfdump var="#responseData#" label="API Response">
