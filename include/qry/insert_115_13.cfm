
<cftry>
    <cfset exportItemService = new "/services/ExportItemService.cfc"()>
    <cfset exportItemService.insertexportitems(
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
        new_ContactMeetingDate = new_ContactMeetingDate,
        new_ContactMeetingLoc = new_ContactMeetingLoc,
        new_contactBirthday = new_contactBirthday,
        new_Website = new_Website
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in insert_115_13.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
