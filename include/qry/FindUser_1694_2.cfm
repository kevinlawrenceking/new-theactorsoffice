
<cfparam name="url.userid" type="numeric" default="0">



    <cfset userService = createObject("component", "services.UserService")>


    <cfset FindUser = userService.GetUserDetails(userid=userid) />


