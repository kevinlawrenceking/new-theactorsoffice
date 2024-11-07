

    <cfset service = createObject("component", "services.AuditionSubmitSiteUserService")>
    <cfset service.INSaudsubmitsites_user(
        new_submitsitename = new_submitsitename,
        sortedCatList = sortedCatList,
        userid = userid
    )>
