<!--- This ColdFusion page handles audition project details, including status updates and appointment management. --->

<cfinclude template="/include/audition_check.cfm" />
<cfparam name="istab" default="Y" />
<cfparam name="pgaction" default="View" />
<cfparam name="new_iscallback" default="0" />
<cfparam name="new_isredirect" default="0" />
<cfparam name="new_ispin" default="0" />
<cfparam name="new_isbooked" default="0" />
<cfinclude template="/include/qry/steps_29_1.cfm" />

<!--- Loop through steps query to generate modals for each step. --->
<cfloop query="steps">
    <Cfoutput>
        <cfset statusfield="is#steps.stepcss#" />

        <div id="StatusConfirm#steps.audstepid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title">#steps.audstep#</h4>
                        <a href="/include/removestatus.cfm?audprojectid=#audprojectid#&STATUSFIELD=#STATUSFIELD#&new_audroleid=#audroleid#&new_audstepid=#steps.audstepid#">
                            <button type="button" class="close" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                        </a>
                    </div>
                    <div class="modal-body">
                        <h4>#steps.stepinfo1#</h4>
                        <BR>
                        <p>#steps.stepinfo2#</p>

                        <cfif #steps.stepinfo4# is not ""> 
                            <p>#steps.stepinfo4#</p>
                            <center>
                                <p><img src="#application.imagesUrl#/#steps.audstepid#.png"></p>
                            </center>
                        </cfif>
                        <p>#steps.stepinfo3#</p>

                        <form action="/include/changestatus.cfm">
                            <input type="hidden" value="#audprojectid#" name="audprojectid" />
                            <input type="hidden" value="changestatus" name="pgaction" />
                            <input type="hidden" name="NEW_AUDROLEID" value="#audroleid#" />
                            <input type="hidden" name="new_audstepid" value="#steps.audstepid#" />
                            <input type="submit" class="btn btn-xs btn-primary waves-effect waves-light" value="#steps.stepinfobutton#" />
                            <input type="hidden" name="statusfield" value="#statusfield#" />
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="StatusCancel#steps.audstepid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: red;color:white;">
                        <h4 class="modal-title">Cancel #steps.audstep#</h4>
                        <a href="">
                            <button type="button" value="Cancel" class="close" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                        </a>
                    </div>
                    <div class="modal-body">
                        <h4>Do you need to cancel your #steps.audstep# status?</h4><BR>
                        <form action="/include/changestatus.cfm">
                            <input type="hidden" value="#audprojectid#" name="audprojectid" />
                            <input type="hidden" value="cancel" name="pgaction" />
                            <input type="hidden" name="NEW_AUDROLEID" value="#audroleid#" />
                            <input type="hidden" name="new_audstepid" value="#steps.audstepid#" />
                            <input type="submit" class="btn btn-xs waves-effect waves-light" style="background-color:red;color:white;" value="Yes" />
                            <input type="hidden" name="statusfield" value="#statusfield#" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </Cfoutput>
</cfloop>

<cfinclude template="/include/qry/rolecheck_29_2.cfm" />

<cfparam name="NEW_ISREDIRECT" default="0" />
<cfparam name="NEW_ispin" default="0" />
<cfparam name="NEW_Iscallback" default="0" />
<cfparam name="NEW_ISbooked" default="0" />

<cfset NEW_AUDSUBCATID=projectdetails.AUDSUBCATID />

<cfif #isdefined('recid')#>
    <cfset audprojectid=recid />
</cfif>

<cfif #pgaction# is "change">
    <cfoutput>
        <cfset cookie.istab="#new_istab#" />
    </cfoutput>
    <cfset pgaction="view">
</cfif>

<cfif #isdefined('cookie.istab')#>
    <cfoutput>
        <cfset istab="#cookie.istab#" />
    </cfoutput>
</cfif>

<Cfif #detect.ismobile()# is "true">
    <cfset istab="N" />
</Cfif>

<cfset new_audcatid=numberformat(projectDetails.audcatid) />
<cfset audcatid=numberformat(projectDetails.audcatid) />
<cfinclude template="/include/qry/audunions_sel.cfm" />
<cfinclude template="/include/qry/audnetworks_user_sel.cfm" />
<cfinclude template="/include/qry/audtones_sel.cfm" />
<cfinclude template="/include/qry/audcontracttypes_sel.cfm" />
<cfinclude template="/include/qry/notesaud.cfm" />

<!--- Loop through events to generate audition details modals. --->
<cfloop query="events">
    <cfinclude template="/include/qry/auditionDetails_29_3.cfm" />
    <cfoutput>
        <div id="auditionDetails_#events.eventid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title" id="standard-modalLabel">Appointment Details</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin: auto;">
                            <Cfif #auditiondetails.eventStart# is not "">
                                <h4 class="px-1 d-flex text-nowrap">
                                    <img src="#application.datesUrl#/#DateFormat('#auditiondetails.eventStart#','yyyy-mm-dd')#.png" style="max-width:75px;" alt="...">
                                </h4>
                            </Cfif>
                            <div class="col-md-12 p-1"><strong>Time: </strong>#timeformat(auditiondetails.eventStartTime)# <cfif #auditiondetails.eventStopTime# is not "">- #timeformat(auditiondetails.eventStopTime)#</cfif></div>
                            <div class="col-md-12 p-1"><strong> Stage: </strong>#auditiondetails.audstep#</div>
                            <cfif #auditionDetails.audstepid# is "2">
                                <div class="col-md-12 p-1"><strong>Callback Type: </strong>#auditionDetails.callbacktype#</div>
                            </cfif>
                            <div class="col-md-12 p-1"><strong> Type: </strong><button type="button" class="btn btn-xs btn-soft-secondary rounded-pill waves-effect">#auditiondetails.audtype#</button></div>
                            <cfif #auditiondetails.audstepid# is "5">
                                <div class="col-md-12 p-1"><strong>Booking Type: </strong>#auditiondetails.audbooktype#</div>
                            </cfif>
                            <cfif #auditiondetails.audtype# is "online">
                                <div class="col-md-12 p-1"><strong> Platform: </strong>#auditiondetails.audplatform#</div>
                            </cfif>
                            <div class="col-md-12 p-1"><strong> Worked with Coach: </strong>
                                <cfif #auditiondetails.workwithcoach# is "1">Yes<cfelse>No</cfif>
                            </div>
                            <cfif #auditiondetails.audtype# is "In Person">
                                <div class="col-md-12 p-1"><strong>Parking Details: </strong>#auditiondetails.parkingdetails#</div>
                            </cfif>
                            <cfif #auditiondetails.audtype# is "In Person">
                                <div class="col-md-12 p-1"><strong> Track Mileage: </strong>
                                    <cfif #auditiondetails.trackmileage# is "1">Yes<cfelse>No</cfif>
                                </div>
                                <cfif #auditiondetails.audtype# is "In Person">
                                    <div class="col-md-12 p-1"><strong>Parking Details: </strong>#auditiondetails.parkingdetails#</div>
                                </cfif>
                            </cfif>
                            <cfif #auditiondetails.islocation# is "true">
                                <div class="col-md-12 p-1"><strong>Location: </strong>#auditionDetails.eventLocation#<cfif #auditionDetails.eventLocation# is not "" and #auditionDetails.audlocadd1# is not "">, #auditionDetails.audlocadd1#</cfif>
                                    <cfif #auditionDetails.audlocadd2# is not "">, #auditionDetails.audlocadd2#</cfif>
                                    <cfif #auditionDetails.audcity# is not "">, #auditionDetails.audcity#</cfif>
                                    <cfif #auditionDetails.regionname# is not ""> , #auditionDetails.regionname#</cfif>
                                    <cfif #auditionDetails.audzip# is not ""> , #auditionDetails.audzip#</cfif>
                                    <cfif #auditionDetails.countryname# is not "" and #auditiondetails.countryname# is not "United States">#auditionDetails.countryname#</cfif>
                                </div>
                                <cfelse>
                                    <cfif #auditiondetails.audtype# is "online">
                                        <div class="col-md-12 p-1"><strong>Zoom Link: </strong>#auditiondetails.audLocation# </div>
                                    </cfif>
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
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteaudupdateform.cfm?secid=#secid#&eventid=#events.eventid#&audcatid=#audcatid#&audprojectid=#audprojectid#&rpgid=175&details_pgid=176&pgdir=audition&userid=#userid#");
                });
            });
        </script>

        <div id="auditionupdate_#events.eventid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title" id="standard-modalLabel">Appointment Update</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>
    </cfoutput>
</cfloop>

<cfoutput query="projectdetails">
    <script>
        $(document).ready(function() {
            $("##remoteDeleteFormAudproject#projectdetails.audprojectid#").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteDeleteFormAudproject.cfm?audprojectid=#projectdetails.audprojectid#");
            });
        });
    </script>

    <div id="remoteDeleteFormAudproject#projectdetails.audprojectid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: red;">
                    <h4 class="modal-title">Delete Audition Project</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfoutput>

<cfloop list="2,3,5" index="new_audstepid" delimiters=",">
    <Cfoutput>
        <cfinclude template="/include/qry/findstep_29_4.cfm" />
        <script>
            $(document).ready(function() {
                $("##auditionadd_#findstep.audstep#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteaudupdateform.cfm?NEW_AUDSUBCATID=#new_audsubcatid#&audcatid=#audcatid#&pgaction=add&audstepid=#new_audstepid#&secid=#secid#&audprojectid=#audprojectid#&rpgid=184&details_pgid=176&pgdir=audition&userid=#userid#");
                });
            });
        </script>

        <script>
            $(document).ready(function() {
                $("##auditionadd_#findstep.audstep#_cancel").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteaudupdateform_cancel.cfm?NEW_AUDSUBCATID=#new_audsubcatid#&audcatid=#audcatid#&pgaction=add&audstepid=#new_audstepid#&secid=#secid#&audprojectid=#audprojectid#&rpgid=184&details_pgid=176&pgdir=audition&userid=#userid#");
                });
            });
        </script>

        <div id="auditionadd_#findstep.audstep#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title" id="standard-modalLabel">Appointment Add</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>
    </Cfoutput>
</cfloop>

<script>
    $(document).ready(function() {
        $("#catupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/catupdateform.cfm?AUDPROJECTID=<cfoutput>#audprojectid#</cfoutput>&audcatid=<cfoutput>#projectdetails.audcatid#</cfoutput>&rpgid=184&secid=176&details_pgid=176&pgdir=audition");
        });
    });
</script>

<div id="catupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Category Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#projectupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remote_aud_project_update.cfm?<cfoutput>secid=#secid#</cfoutput>&audprojectid=<cfoutput>#projectdetails.audprojectid#</cfoutput>&rpgid=148&pgdir=audition");
        });
    });
</script>

<div id="projectupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Project Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#audlocupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/audlocupdate.cfm?secid=<cfoutput>#secid#</cfoutput>&userid=<cfoutput>#userid#</cfoutput>&audprojectid=<cfoutput>#audprojectid#</cfoutput>");
        });
    });
</script>

<div id="audlocupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Audition Location Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<cfparam name="secid" default="176" />

<form action="/include/rolecheck.cfm">
    <Cfoutput>
        <input type="hidden" name="audroleid" value="#audroleid#" />
        <input type="hidden" name="audprojectid" value="#audprojectid#" />
        <input type="hidden" name="pgaction" value="switchit" />
    </Cfoutput>

    <div class="card h-100 ribbon-box p-1 pb-0 mb-1" style="background-color: #FFFAE8;border-width:thin;border-color:#406E8E;">
        <center>
            <div class="container">
                <div class="row">
                    <cfoutput>
                        <div class="form-switch col-md-3 col-sm-6 col-xs-6">
                            <cfif #projectdetails.isdirect# is "0">
                                <cfinclude template="/include/qry/callback_check_29_5.cfm" />
                                <cfif #rolecheck.iscallback# is "1">
                                    <input class="form-check-input form-check-input-callback" type="checkbox" id="new_iscallback" name="new_iscallback" value="1" <cfif #rolecheck.iscallback# is "1"> checked </cfif>
                                    <cfif #callback_check.recordcount# is not "0"> onclick="return false;" <cfelse> data-bs-toggle="modal" data-bs-target="##StatusCancel2" </cfif> />
                                <cfelse>
                                    <input class="form-check-input form-check-input-callback" type="checkbox" data-bs-toggle="modal" data-bs-target="##StatusConfirm2" id="new_iscallback" name="new_iscallback" value="1" <cfif #rolecheck.iscallback# is "1"> checked </cfif>
                                    <cfif #callback_check.recordcount# is not "0"> onclick="return false;" </cfif> />
                                </cfif>
                                <label class="form-check-label" for="new_iscallback">Callback </label>
                                <cfif #rolecheck.iscallback# is "1">
                                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##auditionadd_Callback" data-bs-placement="top" title="Add Callback appointment" data-bs-original-title="Add Callback"><i class="fe-plus-circle"></i></a>
                                </cfif>
                            </cfif>
                        </div><!--- end form-check --->

                        <div class="form-switch col-md-3 col-sm-6 col-xs-6">
                            <cfif #projectdetails.isdirect# is "0">
                                <cfinclude template="/include/qry/Redirect_check_29_6.cfm" />
                                <cfif #rolecheck.isRedirect# is "1">
                                    <input class="form-check-input form-check-input-Redirect" type="checkbox" id="new_isRedirect" name="new_isRedirect" value="1" <cfif #rolecheck.isRedirect# is "1"> checked </cfif>
                                    <cfif #Redirect_check.recordcount# is not "0"> onclick="return false;" <cfelse> data-bs-toggle="modal" data-bs-target="##StatusCancel3" </cf
