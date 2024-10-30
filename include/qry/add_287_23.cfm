
<!--- This ColdFusion page handles the insertion of a new submission site into the database. --->

<cftry>
    <cfset objService = createObject("component", "/services/AuditionSubmitSiteUserService")>
    <cfset objService.INSaudsubmitsites_user_24297(
        new_submitsitename=trim(new_submitsitename),
        userid=userid,
        new_catid=new_catid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_287_23.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudsubmitsites_user_24297." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
