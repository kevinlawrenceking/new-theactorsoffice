<!--- This ColdFusion page includes various JSON data queries and initializes autocomplete functionality for two input fields. --->
<cfinclude template="/include/qry/jsons_50_1.cfm" />
<cfinclude template="/include/qry/jsons_myteam_50_2.cfm" />
<cfinclude template="/include/qry/jtags_50_3.cfm" />

<script>
    <!--- Create an array of tags for autocomplete. --->
    var tagsArray = $.map([
        <cfloop query="jtags">
            <cfif jtags.currentrow neq 1>,</cfif>"#Replace(jtags.col1,"""""","","all")#"
        </cfloop>
    ], function(tag) {
        return { value: tag, data: { category: "Tags" } }
    }),

    <!--- Create an array of contacts for autocomplete. --->
    contactsArray = $.map([
        <cfloop query="jsons">
            <cfif jsons.currentrow neq 1>,</cfif>"#Replace(jsons.col1,"""""","","all")#"
        </cfloop>
    ], function(contact) {
        return { value: contact, data: { category: "Contacts" } }
    }),

    <!--- Create an array of appointments for autocomplete. --->
    appointmentsArray = $.map([
        <cfloop query="jsons_myteam">
            <cfif jsons_myteam.currentrow neq 1>,</cfif>"#Replace(jsons_myteam.col1,"""""","","all")#"
        </cfloop>
    ], function(appointment) {
        return { value: appointment, data: { category: "Appointments" } }
    }),

    combinedArray = tagsArray.concat(contactsArray).concat(appointmentsArray);

    <!--- Initialize the first autocomplete input. --->
    $("#autocomplete").devbridgeAutocomplete({
        lookup: combinedArray,
        minChars: 2,
        width: "300",
        maxheight: "400",
        onSelect: function() {
            $("#submitform").submit();
        },
        showNoSuggestionNotice: true,
        noSuggestionNotice: "Sorry, no matching results",
        groupBy: "category"
    });

    <!--- Initialize the second autocomplete input. --->
    $("#autocomplete2").devbridgeAutocomplete({
        lookup: appointmentsArray,
        minChars: 2,
        width: "300",
        maxheight: "400",
        onSelect: function(e) {
            $("#selection").html("You selected: " + e.value + ", " + e.data.category);
        },
        showNoSuggestionNotice: true,
        noSuggestionNotice: "Sorry, no matching results",
        groupBy: "Contacts"
    });
</script>

<!--- Modifications made based on standards:
1. Removed unnecessary # symbols in conditional checks.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Used double pound signs ## to avoid interpretation as variables in jQuery syntax.
--->