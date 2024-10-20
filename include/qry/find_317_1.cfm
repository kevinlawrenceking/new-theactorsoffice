
<cftry>
    <cfset data = {
        uploadid = new_uploadid,
        projDate = importdata.projDate neq "" ? dateformat(importdata.projDate, 'yyyy-mm-dd') : "",
        projName = trim(importdata.projName),
        audRoleName = trim(importdata.audRoleName),
        audCatName = trim(audCatName),
        audSubCatName = trim(audSubCatName),
        audsource = trim(importdata.audsource),
        cdfirstname = trim(importdata.cdfirstname),
        cdlastname = trim(importdata.cdlastname),
        callback_yn = left(importdata.callback_yn, 1),
        redirect_yn = left(importdata.redirect_yn, 1),
        pin_yn = left(importdata.pin_yn, 1),
        booked_yn = left(importdata.booked_yn, 1),
        projDescription = trim(importdata.projDescription),
        charDescription = trim(importdata.charDescription),
        note = trim(importdata.note)
    }>

    <cfset result = createObject("component", "/services/AuditionImportService").insertauditionsimport(data)>
<cfcatch>
    <cflog file="errorLog" text="[Error in find_317_1.cfm] #cfcatch.message# Details: #cfcatch.detail#">
</cfcatch>
</cftry>
