<cfinclude template="/include/qry/notesevent.cfm" />
<cfparam name="contactId" default="0" />
<cfparam name="returnUrl" default="0" />
<cfparam name="tab1Expand" default="false" />
<cfparam name="tab2Expand" default="false" />
<cfparam name="tab3Expand" default="false" />
<cfparam name="tab4Expand" default="false" />
<cfparam name="tab5Expand" default="false" />
<cfparam name="tab6Expand" default="false" />
<cfparam name="tab7Expand" default="false" />

<cfset returnUrl = "appoint" />

<!--- Check if all tabs are collapsed and expand the first tab if true --->
<cfif NOT tab1Expand AND NOT tab2Expand AND NOT tab3Expand AND NOT tab4Expand AND NOT tab5Expand AND NOT tab6Expand AND NOT tab7Expand>
    <cfset tab1Expand = true />
</cfif>

<style>
    <!--- Set display property based on event details day of the week --->
    <cfif eventdetails.dow EQ "">
        #hidden_div { display: none; }
    <cfelse>
        #hidden_div { display: block; }
    </cfif>
</style>

<style>
    .dataTables_wrapper .dataTables_filter {
        float: right;
        text-align: right;
        visibility: hidden;
    }
</style>

<cfset session.newEventId = eventdetails.eventid />

<div class="row">
    <div class="col-md-3 col-sm-6 col-xs-12">
        <div class="card h-100">
            <center>
                <h4 class="text-center text-white text-nowrap py-0" style="color:white;background-color: ##406E8E;margin:0!important;padding:15px!important;">
                    <cfif eventdetails.eventstart NEQ "">
                        <a href="/app/appoint-update/?eventid=#session.newEventId#&returnurl=appoint" style="color:white;">
                            <i class="fe-calendar"></i> #dateformat(eventdetails.eventStart,'long')#
                        </a>
                    </cfif>
                </h4>
            </center>
            <div class="card-body">
                <div class="py-0 px-2 flex text-center font-18">
                    <a href="/app/appoint-update/?eventid=#session.newEventId#&returnurl=appoint" title="Edit Appointment" data-bs-original-title="Edit Appointment">
                        <i class="mdi mdi-square-edit-outline"></i>
                    </a>
                </div>
                <p class="card-text">
                    <cfif eventdetails.eventStartTime NEQ "">
                        <i class="fe-clock"></i> #timeformat(eventdetails.eventStartTime,'short')#
                    </cfif>
                    <cfif eventdetails.eventStopTime NEQ "">
                        - #timeformat(eventdetails.eventStopTime,'short')#
                    </cfif>
                    <cfif eventdetails.eventlocation NEQ "">
                        <br><i class="fe-map-pin"></i> #eventdetails.eventlocation#
                    </cfif>
                </p>
                <p class="mt-1 mb-0 text-muted font-16">
                    <a href="/app/appoint-update/?eventid=#session.newEventId#&returnurl=appoint" title="Update Tag" data-bs-original-title="Edit Appointment">
                        <span class="badge badge-blue" style="font-size: 12px; font-weight: 500;">#eventdetails.eventtypename#</span>
                    </a>
                </p>
            </div>
        </div>
    </div>

    <cfset h5style = "font-size:0.875rem;font-weight: 500;text-align:left;margin-bottom:0;" />

    <div class="col-md-9 col-sm-6 col-xs-12">
        <div class="card h-100">
            <div class="card-body">
                <h4 class="text-nowrap"> #eventdetails.eventtitle# </h4>
                <p>#eventdetails.eventDescription#</p>
            </div>
        </div>
    </div>
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>

<div class="card">
    <div class="card" class="p-3">
        <ul class="nav nav-pills navtab-bg nav-justified p-1" role="tablist">
            <li class="nav-item" role="presentation">
                <a href="##role" data-bs-toggle="tab" aria-expanded="#tab1Expand#" class="nav-link <cfif tab1Expand> active</cfif>" role="tab"> Attendees
                    <cfif Attendees.recordcount NEQ 0> (#Attendees.recordcount#)</cfif>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a href="##rel" data-bs-toggle="tab" aria-expanded="#tab2Expand#" class="nav-link <cfif tab2Expand> active</cfif>" role="tab" tabindex="-1"> Notes
                    <cfif NotesEvent.recordcount NEQ 0> (#NotesEvent.recordcount#)</cfif>
                </a>
            </li>
        </ul>
    </div>

    <div class="tab-content p-0">
        <div class="tab-pane <cfif tab1Expand> active</cfif>" id="role" role="tabpanel">
            <div class="p-3">
                <cfinclude template="/include/eventcontacts_pane.cfm" />
            </div>
        </div>
        <div class="tab-pane <cfif tab2Expand> active</cfif>" id="rel" role="tabpanel">
            <div class="p-3">
                <cfinclude template="/include/eventnotes_pane.cfm" />
            </div>
        </div>
    </div>
</div>

<cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), ' \')#" />

<!--- Modifications were made based on the following rules: 1, 2, 3, 4, 5, 6, 7, 8, 10. --->