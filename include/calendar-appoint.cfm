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

<!--- Include event types for user --->
<cfinclude template="/include/qry/eventtypes_user.cfm" />

<!--- Include events by user --->
<cfinclude template="/include/qry/events_byuser.cfm" />

<!--- Include calendar section --->
<cfinclude template="calendarSectionCalendar.cfm" />

<!--- Include modal for adding event type --->
<cfinclude template="calendarModalAddeventtype.cfm" />

<!--- Include modal for subscription --->
<cfinclude template="calendarModalSubscription.cfm" />

<!--- Include modal for updating event type --->
<cfinclude template="calendarModalUpdateeventtype.cfm" />

<!--- Set script name for include path --->
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

