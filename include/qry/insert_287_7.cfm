
<cftry>
    <cfset componentPath = "/services/AuditionOpenCallOptionUserService.cfc">
    <cfset component = createObject("component", componentPath)>
    <cfset component.INSaudopencalloptions_user(new_opencallname=new_opencallname, userid=userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_7.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
