<!--- This ColdFusion page displays active appointments and allows users to view or edit them. --->
<div class="d-flex justify-content-between">

    <div class="float-left">
        <!--- Check if there are no appointments --->
        <cfif #eventresults.eventresults.recordcount# is "0">
            No appointments.
        </cfif>

        <!--- Display the count of active appointments --->
        <cfoutput>
            You have <strong>#eventresults.eventresults.recordcount#</strong> active appointment<cfif #eventresults.eventresults.recordcount# is not "1">s</cfif> with #details.recordname#.
        </cfoutput>
    </div>

    <div class="float-end">
        <!--- Link to add a new appointment --->
        <a href="/app/appoint-add/?returnurl=contact&rcontactid=<cfoutput>#currentid#</cfoutput>" 
           class="btn btn-xs btn-primary waves-effect mb-2 waves-light" 
           style="background-color: #406e8e; border: #406e8e;">
            Add
        </a>
    </div>
</div>

<div class="nomobile">
    <!--- Table to display event results --->
 
<table id="events-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover">
    <thead>
        <!-- Render the table header with column names -->
        <tr>
            <th>Action</th>
            <th>#head1#</th>
            <th>#head2#</th>
            <th>#head3#</th>
            <th>Time</th>
            <th>#head5#</th>
            <th></th>
        </tr>
    </thead>

    <tbody>
        <!-- Loop through each record in the event results query -->
        <cfloop query="eventresults.eventresults">
            <cfinclude template="/include/qry/finall_20_1.cfm" />
            <tr role="row" class="#iif(currentrow mod 2 eq 0, 'Even', 'Odd')#">
                <td>
                    <!-- Details link -->
                    <cfif isdefined("xxxxxx")>
                        <a title="Details" href="/app/appoint/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#">
                            <i class="mdi mdi-information-outline"></i>
                        </a>
                    </cfif>

                    <!-- Edit link based on specific project ID -->
                    <cfif eventresults.eventresults.audprojectid eq "557567567567575757575">
                        <a title="Edit" href="/app/appoint-update/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#">
                            <i class="mdi mdi-square-edit-outline"></i>
                        </a>
                    </cfif>

                    <!-- Conditional view link for audition or appointment -->
                    <cfif eventresults.eventresults.audprojectid neq "">
                        <a href="/app/audition/?audprojectid=#eventresults.audprojectid#" class="btn btn-xs btn-primary waves-effect waves-light">
                            <i class="mdi mdi-eye-outline"></i> View Audition
                        </a>
                    <cfelse>
                        <a href="/app/appoint/?eventid=#eventresults.eventid#" class="btn btn-xs btn-primary waves-effect waves-light">
                            <i class="mdi mdi-eye-outline"></i> View Appointment
                        </a>
                    </cfif>
                </td>

                <td>#eventresults.eventresults.col1#</td>
                <td>#eventresults.eventresults.col2#</td>
                <td>#dateformat(eventresults.eventresults.col3, 'm-d-YYYY')#</td>
                <td>#timeformateventresults.(eventresults.eventStartTime, 'medium')#</td>
                <td>
                    #eventresults.eventresults.col5#
                    <cfif eventresults.eventresults.audstep neq "" and eventresults.eventresults.audstep neq "Audition"> (#eventresults.eventresults.audstep#)</cfif>
                </td>
                
                <!-- Delete link, only displayed when there's one matching record -->
                <td>
                    <cfif finall.recordcount eq 1>
                        <a href="/include/deleteappointment.cfm?recid=#eventresults.eventresults.recid#&contactid=#currentid#">
                            <i class="mdi mdi-trash-can-outline mr-1"></i>
                        </a>
                    </cfif>
                </td>
            </tr>
        </cfloop>
    </tbody>
</table>


</div>

<div class="mobile" style="100%;">
    <!--- Initialize target ID for mobile view --->
    <cfparam name="target_id" default="0" />
    <div class="row">
        <div class="col-xl-12">
            <div id="accordion_systems" class="mb-3" style="width:100%;">
                <cfset k=0 />
                <!--- Loop through event results for mobile display --->
                <cfloop query="eventresults">
                    <cfset new_eventid = eventresults.eventresults.eventid />
                    <cfoutput>
                        <cfset k=#k# + 1 />
                    </cfoutput>

                    <cfset cardclass="" />
                    <!--- Set target ID for the first event --->
                    <cfif #eventresults.eventresults.currentrow# is "1">
                        <cfoutput>
                            <cfset target_id="#new_eventid#" />
                        </cfoutput>
                    </cfif>

                    <!--- Determine if the current event matches the target ID for collapse behavior --->
                    <cfif #new_eventID# is "#target_id#">
                        <cfset header_aria_exanded="true" />
                        <cfset collapse_show = "collapse show" />
                    </cfif>

                    <cfif #new_eventID# is not "#target_id#">
                        <cfset header_aria_exanded="false" />
                        <cfset collapse_show = "collapse" />
                    </cfif>

                    <div class="card mb-1" style="width:100%;">
                        <div class="card-header" id="heading_system_<cfoutput>#eventresults.eventresults.currentrow#</cfoutput>">
                            <h5 class="m-0 align-middle" style="width:100%;">
                                <a class="text-dark collapsed" data-bs-toggle="collapse" 
                                   href="#collapse_system_<cfoutput>#eventresults.eventresults.currentrow#</cfoutput>" 
                                   aria-expanded="<cfoutput>#header_aria_exanded#</cfoutput>">
                                    <cfoutput>
                                        <strong>#dateformat('#eventresults.eventresults.col3#','short')#</strong> - 
                                        #timeformat('#eventresults.eventresults.eventStartTime#','short')# 
                                        <i class="fe-menu"></i>
                                    </cfoutput>
                                    <span class="badge badge-sm badge-blue badge-pill float-end" style="font-size:.7em;">
                                        <cfoutput>#eventresults.eventresults.col5#</cfoutput>
                                    </span>
                                </a>
                            </h5>
                        </div>

                        <div id="collapse_system_<cfoutput>#eventresults.eventresults.currentrow#</cfoutput>" 
                             class="<cfoutput>#collapse_show#</cfoutput>" 
                             aria-labelledby="collapse_system_<cfoutput>#eventresults.eventresults.currentrow#</cfoutput>" 
                             data-bs-parent="#accordion_systems">
                            <div class="card-body">
                                <cfoutput>
                                    <h5>#eventresults.eventresults.col1# 
                                        <a title="Edit" href="/app/appoint-update/?eventid=#eventresults.eventresults.eventid#&returnurl=contact&rcontactid=#currentid#">
                                            <i class="mdi mdi-square-edit-outline"></i>
                                        </a>
                                    </h5>
                                </cfoutput>
                                <cfif #eventresults.eventresults.col2# is not "">
                                    <h6>Location</h6>
                                    <p><cfoutput>#eventresults.eventresults.col2#</cfoutput></p>
                                </cfif>

                                <cfif #eventresults.eventresults.eventDescription# is not "">
                                    <h6>Description</h6>
                                    <p><cfoutput>#eventresults.eventresults.eventDescription#</cfoutput></p>
                                </cfif>
                            </div>
                        </div>
                    </div>
                </cfloop>
            </div>
        </div>
    </div>
</div>

<!--- Include script name for further processing --->
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
