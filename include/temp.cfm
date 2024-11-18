<cfloop query="events">
    <cfinclude template="/include/qry/auditionDetails_29_3.cfm" />
    <cfoutput>
        <div id="auditionDetails_#events.eventid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" <!-- aria-hidden="true" removed -->
>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title" id="standard-modalLabel">Appointment Details</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" <!-- aria-hidden="true" removed -->
><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin: auto;">
                            <!-- Open cfif for eventStart -->
                            <cfif auditiondetails.eventStart is not "">
                                <h4 class="px-1 d-flex text-nowrap">
                                    <img src="#application.datesUrl#/#DateFormat(auditiondetails.eventStart, 'yyyy-mm-dd')#.png" style="max-width:75px;" alt="...">
                                </h4>
                            </cfif>
                            <div class="col-md-12 p-1"><strong>Time: </strong>#timeformat(auditiondetails.eventStartTime)# 
                                <!-- Open cfif for eventStopTime -->
                                <cfif auditiondetails.eventStopTime is not "">- #timeformat(auditiondetails.eventStopTime)#</cfif>
                            </div>
                            <div class="col-md-12 p-1"><strong> Stage: </strong>#auditiondetails.audstep#</div>
                            <!-- Callback Type -->
                            <cfif auditionDetails.audstepid is "2">
                                <div class="col-md-12 p-1"><strong>Callback Type: </strong>#auditionDetails.callbacktype#</div>
                            </cfif>
                            <!-- Booking Type -->
                            <div class="col-md-12 p-1"><strong> Type: </strong>
                                <button type="button" class="btn btn-xs btn-soft-secondary rounded-pill waves-effect">#auditiondetails.audtype#</button>
                            </div>
                            <cfif auditiondetails.audstepid is "5">
                                <div class="col-md-12 p-1"><strong>Booking Type: </strong>#auditiondetails.audbooktype#</div>
                            </cfif>
                            <!-- Platform -->
                            <cfif auditiondetails.audtype is "online">
                                <div class="col-md-12 p-1"><strong> Platform: </strong>#auditiondetails.audplatform#</div>
                            </cfif>
                            <!-- Coach -->
                            <div class="col-md-12 p-1"><strong> Worked with Coach: </strong>
                                <cfif auditiondetails.workwithcoach is "1">Yes<cfelse>No</cfif>
                            </div>
                            <!-- In-Person Details -->
                            <cfif auditiondetails.audtype is "In Person">
                                <div class="col-md-12 p-1"><strong>Parking Details: </strong>#auditiondetails.parkingdetails#</div>
                                <div class="col-md-12 p-1"><strong> Track Mileage: </strong>
                                    <cfif auditiondetails.trackmileage is "1">Yes<cfelse>No</cfif>
                                </div>
                            </cfif>
                            <!-- Location -->
                            <cfif auditiondetails.islocation is "true">
                                <div class="col-md-12 p-1"><strong>Location: </strong>#auditionDetails.eventLocation# 
                                    <cfif auditionDetails.eventLocation is not "" and auditionDetails.audlocadd1 is not "">, #auditionDetails.audlocadd1#</cfif>
                                    <cfif auditionDetails.audlocadd2 is not "">, #auditionDetails.audlocadd2#</cfif>
                                    <cfif auditionDetails.audcity is not "">, #auditionDetails.audcity#</cfif>
                                    <cfif auditionDetails.regionname is not ""> , #auditionDetails.regionname#</cfif>
                                    <cfif auditionDetails.audzip is not ""> , #auditionDetails.audzip#</cfif>
                                    <cfif auditionDetails.countryname is not "" and auditiondetails.countryname is not "United States">
                                        #auditionDetails.countryname#
                                    </cfif>
                                </div>
                            <cfelse>
                                <!-- Online Zoom -->
                                <cfif auditiondetails.audtype is "online">
                                    <div class="col-md-12 p-1"><strong>Zoom Link: </strong>#auditiondetails.audLocation# </div>
                                </cfif>
                            </cfif>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $("##auditionupdate_#events.eventid#").on("show.bs.modal", function(event) {
                    $(this).find(".modal-body").load("/include/remoteaudupdateform.cfm?secid=#secid#&eventid=#events.eventid#&audcatid=#audcatid#&audprojectid=#audprojectid#&rpgid=175&details_pgid=176&pgdir=audition&userid=#userid#");
                });
            });
        </script>
        <div id="auditionupdate_#events.eventid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" <!-- aria-hidden="true" removed -->
>
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title" id="standard-modalLabel">Appointment Update</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" <!-- aria-hidden="true" removed -->
><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>
    </cfoutput>
</cfloop>
