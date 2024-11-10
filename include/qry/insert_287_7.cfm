<cfset componentPath = "/services/AuditionOpenCallOptionUserService.cfc">
<cfset component = createObject("component", componentPath)>
<cfset component.INSaudopencalloptions_user(new_opencallname=new_opencallname, userid=userid)>