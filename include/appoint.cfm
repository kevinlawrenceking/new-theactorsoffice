<cfinclude template="/include/qry/notesevent.cfm" />
<cfparam name="rContactId" default="0" />
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
    <cfset tab1Expand = "true" />
</cfif>

<style>
    <!--- Hide or show hidden_div based on event details --->
    <cfif eventdetails.dow EQ "">
        #hidden_div { display: none; }
    <cfelse>
        #hidden_div { display: block; }
    </cfif>
</style>

<style>
    <!--- Style for DataTables filter visibility --->
    .dataTables_wrapper .dataTables_filter { float: right; text-align: right; visibility: hidden; }
</style>

<script>
    <!--- Initialize selectize for relationship selection --->
    $(document).ready(function() {
        $("#select-relationship").selectize({
            persist: !1,
            createOnBlur: !0,
            create: !0,
            plugins: ["remove_button"],
            delimiter: ",",
            persist: false,
            create: function(input) {
                return { value: input, text: input };
            },
        });
    });
</script>

<cfset session.newEventId = eventdetails.eventid />

<div class="row">
    <div class="card" style="width:100%;">
        <div class="card-body">
            <form method="post" action="/include/appoint-update2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                <input type="hidden" name="returnUrl" value="<cfoutput>#returnUrl#</cfoutput>">
                <input type="hidden" name="rContactId" value="<cfoutput>#rContactId#</cfoutput>">
                <input type="hidden" name="eventId" value="<cfoutput>#eventdetails.eventid#</cfoutput>">

                <div class="row">
                    <div class="col-md-12">
                        <a href="/app/appoint-update/?eventId=<cfoutput>#session.newEventId#</cfoutput>&returnUrl=appoint">
                            <h4><cfoutput>#eventdetails.eventtitle#</cfoutput> <i class="mdi mdi-square-edit-outline"></i></h4>
                        </a>
                    </div>

                    <div class="col-md-12">
                        <div class="media-body">
                            <cfif eventdetails.eventstart NEQ "">
                                <i class="fe-calendar"></i> <cfoutput>#dateformat(eventdetails.eventStart,'long')#<br></cfoutput>
                            </cfif>

                            <cfif eventdetails.eventStartTime NEQ "">
                                <i class="fe-clock"></i> <cfoutput>#timeformat(eventdetails.eventStartTime,'short')#</cfoutput>
                            </cfif>

                            <cfif eventdetails.eventStopTime NEQ "">
                                - <cfoutput>#timeformat(eventdetails.eventStopTime,'short')#</cfoutput>
                            </cfif>

                            <cfif eventdetails.eventlocation NEQ "">
                                <br><i class="fe-map-pin"></i> <cfoutput>#eventdetails.eventlocation#</cfoutput>
                            </cfif>

                            <h4 class="mt-0 mb-0">
                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteUpdateName" data-bs-placement="top" title="Update Contact" data-bs-original-title="Update Contact"></a>
                            </h4>

                            <p class="mt-1 mb-0 text-muted font-16">
                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateTag" data-bs-placement="top" title="Update Tag" data-bs-original-title="Update Tag">
                                    <span class="badge badge-blue" style="font-size: 12px; font-weight: 500;"><cfoutput>#eventdetails.eventtypename#</cfoutput></span>
                                </a>
                            </p>
                        </div>
                    </div>

                    <cfif eventdetails.eventDescription NEQ "">
                        <div class="col-md-12">
                            <div class="form-group">
                                <h5>Description</h5>
                                <p><cfoutput>#eventdetails.eventDescription#</cfoutput></p>
                            </div>
                        </div>
                    </cfif>
                </div>

                <div style="height:24px;">&nbsp;</div>

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="##attendees" data-bs-toggle="tab" aria-expanded="<cfoutput>#tab1Expand#</cfoutput>" class="nav-link<cfif tab1Expand EQ 'true'> active</cfif>">
                            Attendees
                            <cfif Attendees.recordcount NEQ 0>
                                <span class="badge badge-primary badge-pill"><cfoutput>#Attendees.recordcount#</cfoutput></span>
                            </cfif>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="##notes" data-bs-toggle="tab" aria-expanded="<cfoutput>#tab2Expand#</cfoutput>" class="nav-link<cfif tab2Expand EQ 'true'> active</cfif>">
                            Notes
                            <cfif NotesEvent.recordcount NEQ 0>
                                <span class="badge badge-primary badge-pill"><cfoutput>#NotesEvent.recordcount#</cfoutput></span>
                            </cfif>
                        </a>
                    </li>

                    <cfif isdefined('blahblah')>
                        <li class="nav-item">
                            <a href="##links" data-bs-toggle="tab" aria-expanded="<cfoutput>#tab3Expand#</cfoutput>" class="nav-link<cfif tab3Expand EQ 'true'> active</cfif>">Links</a>
                        </li>

                        <li class="nav-item">
                            <a href="##attachments" data-bs-toggle="tab" aria-expanded="<cfoutput>#tab4Expand#</cfoutput>" class="nav-link<cfif tab4Expand EQ 'true'> active</cfif>">Attachments</a>
                        </li>
                    </cfif>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane<cfif tab1Expand EQ 'true'> show active</cfif>" id="attendees">
                        <h4>Attendees</h4>
                        <cfset contactsTable = "contacts_attendees" />
                        <cfset eventId = eventdetails.eventid />
                        <cfinclude template="/include/contacts_table_attendees.cfm" />
                    </div>

                    <div class="tab-pane<cfif tab2Expand EQ 'true'> show active</cfif>" id="notes">
                        <h4>Notes</h4>
                        <cfinclude template="/include/notes_event_pane.cfm" />
                    </div>

                    <div class="tab-pane<cfif tab3Expand EQ 'true'> show active</cfif>" id="links">
                        <h4>Links</h4>
                    </div>

                    <div class="tab-pane<cfif tab4Expand EQ 'true'> show active</cfif>" id="attachments">
                        <h4>Attachments</h4>
                    </div>
                </div>

                <cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
            </form>
        </div>
    </div>
</div>

<!--- Changes: Standardized variable names and casing, removed unnecessary cfoutput tags, avoided using # symbols within conditional checks unless essential, simplified record count logic for icons or conditional displays, ensured consistent attribute quoting, spacing, and formatting, used uniform date and time formatting across the code. --->