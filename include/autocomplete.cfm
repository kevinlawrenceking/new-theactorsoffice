<!--- This ColdFusion page includes various JSON data queries and initializes autocomplete functionality for two input fields. --->

<cfinclude template="/include/qry/jsons_50_1.cfm" />
<cfinclude template="/include/qry/jsons_myteam_50_2.cfm" />
<cfinclude template="/include/qry/jtags_50_3.cfm" />

<script>
    <!--- Create an array of tags for autocomplete. --->
    var e = $.map([
        <cfloop query="jtags">
            <cfoutput>
                <cfif #jtags.currentrow# is not "1">,</cfif>"#Replace(jtags.col1,"""""","","all")#"
            </cfoutput>
        </cfloop>
    ], function(e) {
        return {
            value: e,
            data: {
                category: "Tags"
            }
        }
    }),

    <!--- Create an array of contacts for autocomplete. --->
    a = $.map([
        <cfloop query="jsons">
            <cfoutput>
                <cfif #jsons.currentrow# is not "1">,</cfif>"#Replace(jsons.col1,"""""","","all")#"
            </cfoutput>
        </cfloop>
    ], function(e) {
        return {
            value: e,
            data: {
                category: "Contacts"
            }
        }
    }),

    <!--- Create an array of appointments for autocomplete. --->
    b = $.map([
        <cfloop query="jsons_myteam">
            <cfoutput>
                <cfif #jsons_myteam.currentrow# is not "1">,</cfif>"#Replace(jsons_myteam.col1,"""""","","all")#"
            </cfoutput>
        </cfloop>
    ], function(e) {
        return {
            value: e,
            data: {
                category: "Appointments"
            }
        }
    }),

    j = b;
    o = e.concat(a);
    i = o.concat(b);

    <!--- Initialize the first autocomplete input. --->
    $("#autocomplete").devbridgeAutocomplete({
        lookup: i,
        minChars: 2,
        width: "300",
        maxheight: "400",
        onSelect: function(event, ui) {
            $("#submitform").submit();
        },
        showNoSuggestionNotice: !0,
        noSuggestionNotice: "Sorry, no matching results",
        groupBy: "category"
    });

    <!--- Initialize the second autocomplete input. --->
    $("#autocomplete2").devbridgeAutocomplete({
        lookup: j,
        minChars: 2,
        width: "300",
        maxheight: "400",
        onSelect: function(e) {
            $("#selection").html("You selected: " + e.value + ", " + e.data.category);
        },
        showNoSuggestionNotice: !0,
        noSuggestionNotice: "Sorry, no matching results",
        groupBy: "Contacts"
    });
</script>
