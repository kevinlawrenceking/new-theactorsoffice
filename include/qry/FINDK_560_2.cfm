<cfquery  name="FINDK" maxrows="1">
        SELECT CONTACTID from contacts_ss WHERE userid = #userid# and col1 = '#topsearch_myteam#'
    </cfquery>
