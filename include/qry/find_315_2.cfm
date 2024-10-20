
<cftry>
    <cfset result = createObject("component", "/services/ContactImportService").insertcontactsimport(
        uploadid=new_uploadid,
        fname=TRIM(importdata.FirstName),
        lname=TRIM(importdata.LastName),
        tag1=TRIM(importdata.Tag1),
        tag2=TRIM(importdata.Tag2),
        tag3=TRIM(importdata.Tag3),
        business_email=TRIM(importdata.BusinessEmail),
        personal_email=TRIM(importdata.PersonalEmail),
        work_phone=TRIM(importdata.WorkPhone),
        mobile_phone=TRIM(importdata.MobilePhone),
        home_phone=TRIM(importdata.HomePhone),
        company=TRIM(importdata.Company),
        address=TRIM(importdata.Address),
        address_second=TRIM(importdata.Address2),
        city=TRIM(importdata.City),
        state=TRIM(importdata.State),
        zip=TRIM(importdata.Zip),
        country=TRIM(importdata.Country),
        contactMeetingDate=(importdata.contactMeetingDate neq "" ? dateformat(importdata.contactMeetingDate, 'yyyy-mm-dd') : ""),
        contactMeetingLocation=(importdata.contactMeetingLocation neq "" ? TRIM(importdata.contactMeetingLocation) : ""),
        birthday=(importdata.birthday neq "" ? dateformat(importdata.birthday, 'yyyy-mm-dd') : ""),
        website=TRIM(importdata.website),
        status="Pending",
        notes=TRIM(importdata.Notes)
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_315_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
