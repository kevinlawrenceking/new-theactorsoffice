<!--- This ColdFusion page retrieves event data and event types for a user and styles the output accordingly. --->

<cfinclude template="/include/qry/eventss_443_1.cfm" />

<cfinclude template="/include/qry/eventtypes_user_443_2.cfm" />

<style>

    <!--- Loop through event types to apply color styles. --->
    <cfloop query="eventtypes_user">
        <cfoutput>
            .colorkey-#eventtypes_user.id# {
                background-color: #eventtypes_user.eventtypecolor# !important;
            }

            a.colorkey:hover,
            a.colorkey:focus,
            button.colorkey:hover,
            button.colorkey:focus {
                background-color: ##343a40 !important;
            }
        </cfoutput>
    </cfloop>
</style>

<style>
    .fc-event-time,
    .fc-event-title {
        padding: 0 1px;
        white-space: nowrap;
    }

    .fc-title {
        white-space: normal;
    }
</style>

