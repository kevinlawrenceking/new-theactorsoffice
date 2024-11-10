<style>
    .popper, .tooltip {
        position: absolute;
        z-index: 9999;
        background: ##FFC107;
        color: black;
        width: 150px;
        border-radius: 3px;
        box-shadow: 0 0 2px rgba(0,0,0,0.5);
        padding: 10px;
        text-align: center;
    }
    .style5 .tooltip {
        background: ##1E252B;
        color: ##FFFFFF;
        max-width: 200px;
        width: auto;
        font-size: .8rem;
        padding: .5em 1em;
    }
    .popper .popper__arrow, .tooltip .tooltip-arrow {
        width: 0;
        height: 0;
        border-style: solid;
        position: absolute;
        margin: 5px;
    }
    .tooltip .tooltip-arrow, .popper .popper__arrow {
        border-color: ##FFC107;
    }
    .style5 .tooltip .tooltip-arrow {
        border-color: ##1E252B;
    }
    /* ... rest of the CSS rules ... */
</style>

<cfinclude template="/include/qry/eventTypesUser.cfm" />
<cfinclude template="/include/qry/eventsByUser.cfm" />
<cfinclude template="calendarSectionCalendar.cfm" />
<cfinclude template="calendarModalAddEventType.cfm" />
<cfinclude template="calendarModalSubscription.cfm" />
<cfinclude template="calendarModalUpdateEventType.cfm" />

<cfset scriptNameInclude = "/include/" & ListLast(GetCurrentTemplatePath(), " \")" />

<!--- Changes made:
1. Replaced `#` with `##` in CSS hex color codes to avoid interpretation as variables.
2. Standardized variable names and casing.
--->