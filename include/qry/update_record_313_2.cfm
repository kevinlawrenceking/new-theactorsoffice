
<cftry>
    <cfset var data = {
        projDate = form.projDate,
        projName = form.projName,
        audRoleName = form.audRoleName,
        audCatName = find.category,
        audSubCatName = find.subcategory,
        audsource = form.audsource,
        cdfirstname = form.cdfirstname,
        cdlastname = form.cdlastname,
        callback_yn = form.callback_yn,
        redirect_yn = form.redirect_yn,
        pin_yn = form.pin_yn,
        booked_yn = form.booked_yn,
        projDescription = form.projDescription,
        charDescription = form.charDescription,
        note = form.note,
        status = form.status,
        audsubcatid = form.audsubcatid
    }>

    <cfset var result = createObject("component", "services.AuditionImportService").updateauditionsimport(ID=form.recordId, data=data)>

    <cfif not result>
        <cfthrow message="Update failed" detail="The update operation did not succeed.">
    </cfif>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_record_313_2.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
