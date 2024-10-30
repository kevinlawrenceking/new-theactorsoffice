
<cfset userService = new "services.UserService"()>
<cfset userData = userService.getUserById(userID)>




<!--- Assuming you are fetching these values in the same query or have separate queries for them 
<cfset defcountry = userData.countryid[1] />
<cfset defState = userData.region_id[1] />  --->
<!--- If these columns don’t exist in your original query, add them to the SQL or handle them separately --->
