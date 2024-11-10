<!--- This ColdFusion page formats a phone number based on specific rules and outputs the formatted version. --->
<cfset cleanPhoneNumber = reReplace(phoneNumber, "[^0-9]|^\+1(?=\d{10})$", "", "ALL")>

<!--- Check if the cleaned phone number has a length of 10 digits --->
<cfif len(cleanPhoneNumber) is 10>

    <!--- Format the phone number into a standard format --->
    <cfset formatPhoneNumber = "(" & left(cleanPhoneNumber, 3) & ") " & mid(cleanPhoneNumber, 4, 3) & "-" & right(cleanPhoneNumber, 4)>
    <cfset anchorPhoneNumber = left(cleanPhoneNumber, 3) & "-" & mid(cleanPhoneNumber, 4, 3) & "-" & right(cleanPhoneNumber, 4)>
    
<cfelse>

    <!--- If the phone number is not 10 digits, use the original phone number --->
    <cfset formatPhoneNumber = phoneNumber>
    <cfset anchorPhoneNumber = cleanPhoneNumber>

</cfif>

<!--- Set the formatted phone number variables for later use --->
<cfset formattedPhoneNumber = cleanPhoneNumber>
<cfset anchorPhoneNumber = cleanPhoneNumber>

<!--- Modifications: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks.
3. Standardized variable names and casing.
--->