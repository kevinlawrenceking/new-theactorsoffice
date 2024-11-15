<cfquery  name="FINDz" maxrows="1">
        SELECT itemid from contactitems WHERE contactid=#deletecontactid# and valuetext = 'My Team'
    </cfquery>
