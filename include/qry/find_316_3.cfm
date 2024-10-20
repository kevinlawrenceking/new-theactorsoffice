
<cftry>
    <cfset data = {
        audsubcatid = new_audsubcatid,
        uploadid = new_uploadid,
        projDate = importdata.projDate neq "" ? dateformat(importdata.projDate, 'yyyy-mm-dd') : "",
        projName = TRIM(importdata.projName),
        audRoleName = TRIM(importdata.audRoleName),
        audCatName = TRIM(audCatName),
        audSubCatName = TRIM(audSubCatName),
        audsource = TRIM(importdata.audsource),
        cdfirstname = TRIM(importdata.cdfirstname),
        cdlastname = TRIM(importdata.cdlastname),
        callback_yn = LEFT(importdata.callback_yn, 1),
        redirect_yn = LEFT(importdata.redirect_yn, 1),
        pin_yn = LEFT(importdata.pin_yn, 1),
        booked_yn = LEFT(importdata.booked_yn, 1),
        projDescription = TRIM(importdata.projDescription),
        charDescription = TRIM(importdata.charDescription),
        note = TRIM(importdata.note)
    }>

    <cfset resultId = createObject("component", "services.AuditionImportService").insertauditionsimport(data)>
<cfcatch>
    <cflog file="errorLog" text="[Error in find_316_3.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
</cfcatch>
</cftry>

