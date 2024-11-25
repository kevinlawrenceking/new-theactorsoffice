<!--- This ColdFusion page retrieves event data and event types for a user and styles the output accordingly. --->

<cfinclude template="/include/qry/eventss_443_1.cfm" />

<cfinclude template="/include/qry/eventtypes_user_443_2.cfm" />


<style>
    #topbox {
        display: flex;
        flex-flow: row wrap;
    }

    .alignleft {
        width: 25%;
        text-align: left;
    }

    .aligncenter {
        width: 50%;
        text-align: center;
    }

    .alignright {
        width: 25%;
        text-align: right;
    }



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
