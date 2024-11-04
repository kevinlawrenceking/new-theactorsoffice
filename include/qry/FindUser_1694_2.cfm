
<cfparam name="url.userid" type="numeric" default="0">

<cfif url.userid neq 0>

    <cfset userService = createObject("component", "services.UserService")>


    <cfset FindUser = userService.GetUserDetails(userid=userid)>


