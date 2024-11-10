<!--- This ColdFusion page processes contact information, including meeting dates and birthdays, and updates the contact records accordingly. --->
<cfparam name="deleteItem" default="0" />
<cfparam name="valueText" default="" />
<cfparam name="referContactId" default="" />
<cfparam name="customPronoun" default="" />

<cfscript>

    if (Len(trim(form.contactMeetingDate)) && REFind("^\d{4}-\d{2}-\d{2}$", form.contactMeetingDate)) {
        parsedDate = ParseDateTime(form.contactMeetingDate);
        contactMeetingDate = DateFormat(parsedDate, "yyyy-mm-dd");
    } else {
        contactMeetingDate = JavaCast("null", "");
    }


    if (Len(trim(form.contactBirthday)) && REFind("^\d{4}-\d{2}-\d{2}$", form.contactBirthday)) {
        parsedDate = ParseDateTime(form.contactBirthday);
        contactBirthday = DateFormat(parsedDate, "yyyy-mm-dd");
    } else {
        contactBirthday = JavaCast("null", "");
    }
</cfscript>

<cfinclude template="/include/qry/updateContact_270_1.cfm" />

<!--- Check if contactBirthday is not empty --->
<cfif contactBirthday is not "">
    <cfinclude template="/include/birthday_fix.cfm" />
</cfif>

<!--- Check if custom pronoun is provided and matches "custom" --->
<cfif customPronoun is not "" and contactPronoun is "custom">
    <cfinclude template="/include/qry/find_270_2.cfm" />

    <!--- If no records found, add new record --->
    <cfif find.recordCount is 0>
        <cfinclude template="/include/qry/add_270_3.cfm" />
    </cfif>
</cfif>

<!--- Redirect to contact page with contactId --->
<cflocation url="/app/contact/?contactId=#contactId#" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
--->