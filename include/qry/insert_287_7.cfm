
<cftry>
    <cfset variables.service = new "/services/AuditionOpenCallOptionUserService.cfc" />
    <cfset variables.service.insertAudOpenCallOptionsUser(new_opencallname=new_opencallname, userid=userid) />
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_7.cfm]: #cfcatch.message#" />
        <cfthrow />
    </cfcatch>
</cftry>
