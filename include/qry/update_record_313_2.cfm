
<cftry>
    <cfset componentPath = "/services/AuditionImportService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.updateAuditionsImport(
        formData = {
            projDate: form.projDate,
            projName: form.projName,
            audRoleName: form.audRoleName,
            audsource: form.audsource,
            cdfirstname: form.cdfirstname,
            cdlastname: form.cdlastname,
            callback_yn: form.callback_yn,
            redirect_yn: form.redirect_yn,
            pin_yn: form.pin_yn,
            booked_yn: form.booked_yn,
            projDescription: form.projDescription,
            charDescription: form.charDescription,
            note: form.note,
            status: form.status,
            audsubcatid: form.audsubcatid,
            recordId: form.recordId
        },
        findData = {
            category: find.category,
            subcategory: find.subcategory
        }
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_record_313_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
