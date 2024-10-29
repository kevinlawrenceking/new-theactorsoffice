
<cftry>
    <cfset ExportItemService = createObject("component", "services.ExportItemService")>
    <cfset ExportItemService.insertExportItem(
        new_exportid = new_exportid,
        new_contactid = new_contactid,
        new_FirstName = new_FirstName,
        new_LastName = new_LastName,
        new_Tag1 = new_Tag1,
        new_Tag2 = new_Tag2,
        new_Tag3 = new_Tag3,
        new_BusinessEmail = new_BusinessEmail,
        new_PersonalEmail = new_PersonalEmail,
        new_WorkPhone = new_WorkPhone,
        new_MobilePhone = new_MobilePhone,
        new_HomePhone = new_HomePhone,
        new_Company = new_Company,
        new_Address = new_Address,
        new_Address2 = new_Address2,
        new_City = new_City,
        new_State = new_State,
        new_Zip = new_Zip,
        new_Country = new_Country,
        new_ContactMeetingDate = isDate(new_ContactMeetingDate) ? dateFormat(new_ContactMeetingDate, "yyyy-mm-dd") : "",
        new_ContactMeetingLoc = trim(new_ContactMeetingLoc),
        new_contactBirthday = isDate(new_contactBirthday) ? dateFormat(new_contactBirthday, "yyyy-mm-dd") : "",
        new_Website = trim(new_Website)
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog("[Error in insert_115_13.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
