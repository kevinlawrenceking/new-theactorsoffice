<!--- This ColdFusion page handles audition project details, including status updates and appointment management. --->
<cfinclude template="/include/audition_check.cfm" />
<cfparam name="isTab" default="Y" />
<cfparam name="pgAction" default="View" />
<cfparam name="newIsCallback" default="0" />
<cfparam name="newIsRedirect" default="0" />
<cfparam name="newIsPin" default="0" />
<cfparam name="newIsBooked" default="0" />

<cfinclude template="/include/qry/steps_29_1.cfm" />

<!--- Loop through steps query to generate modals for each step. --->
<cfloop query="steps">
    <cfset statusField = "is#steps.stepCss#" />
    <div id="StatusConfirm#steps.audStepId#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##f3f7f9;">
                    <h4 class="modal-title">#steps.audStep#</h4>
                    <a href="/include/removeStatus.cfm?audProjectId=#audProjectId#&statusField=#statusField#&newAudRoleId=#audRoleId#&newAudStepId=#steps.audStepId#">
                        <button type="button" class="close" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </a>
                </div>
                <div class="modal-body">
                    <h4>#steps.stepInfo1#</h4>
                    <br>
                    <p>#steps.stepInfo2#</p>
                    <cfif steps.stepInfo4 is not "">
                        <p>#steps.stepInfo4#</p>
                        <center>
                            <p><img src="#application.imagesUrl#/#steps.audStepId#.png"></p>
                        </center>
                    </cfif>
                    <p>#steps.stepInfo3#</p>
                    <form action="/include/changeStatus.cfm">
                        <input type="hidden" value="#audProjectId#" name="audProjectId" />
                        <input type="hidden" value="changeStatus" name="pgAction" />
                        <input type="hidden" name="newAudRoleId" value="#audRoleId#" />
                        <input type="hidden" name="newAudStepId" value="#steps.audStepId#" />
                        <input type="submit" class="btn btn-xs btn-primary waves-effect waves-light" value="#steps.stepInfoButton#" />
                        <input type="hidden" name="statusField" value="#statusField#" />
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="StatusCancel#steps.audStepId#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: red;color:white;">
                    <h4 class="modal-title">Cancel #steps.audStep#</h4>
                    <a href="">
                        <button type="button" value="Cancel" class="close" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </a>
                </div>
                <div class="modal-body">
                    <h4>Do you need to cancel your #steps.audStep# status?</h4><br>
                    <form action="/include/changeStatus.cfm">
                        <input type="hidden" value="#audProjectId#" name="audProjectId" />
                        <input type="hidden" value="cancel" name="pgAction" />
                        <input type="hidden" name="newAudRoleId" value="#audRoleId#" />
                        <input type="hidden" name="newAudStepId" value="#steps.audStepId#" />
                        <input type="submit" class="btn btn-xs waves-effect waves-light" style="background-color:red;color:white;" value="Yes" />
                        <input type="hidden" name="statusField" value="#statusField#" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</cfloop>

<cfinclude template="/include/qry/roleCheck_29_2.cfm" />

<cfparam name="newIsRedirect" default="0" />
<cfparam name="newIsPin" default="0" />
<cfparam name="newIsCallback" default="0" />
<cfparam name="newIsBooked" default="0" />

<cfset newAudSubCatId = projectDetails.audSubCatId />

<cfif isDefined('recId')>
    <cfset audProjectId = recId />
</cfif>

<cfif pgAction is "change">
    <cfset cookie.isTab = newIsTab />
    <cfset pgAction = "view">
</cfif>

<cfif isDefined('cookie.isTab')>
    <cfset isTab = cookie.isTab />
</cfif>

<cfif detect.isMobile() is "true">
    <cfset isTab = "N" />
</cfif>

<cfset newAudCatId = numberFormat(projectDetails.audCatId) />
<cfset audCatId = numberFormat(projectDetails.audCatId) />

<cfinclude template="/include/qry/audUnions_sel.cfm" />
<cfinclude template="/include/qry/audNetworks_user_sel.cfm" />
<cfinclude template="/include/qry/audTones_sel.cfm" />
<cfinclude template="/include/qry/audContractTypes_sel.cfm" />
<cfinclude template="/include/qry/notesAud.cfm" />

<!--- Loop through events to generate audition details modals. --->
<cfloop query="events">
    <cfinclude template="/include/qry/auditionDetails_29_3.cfm" />
    <div id="auditionDetails_#events.eventId#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">Appointment Details</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body">
                    <div class="row" style="margin: auto;">
                        <cfif auditionDetails.eventStart is not "">
                            <h4 class="px-1 d-flex text-nowrap">
                                <img src="#application.datesUrl#/#DateFormat(auditionDetails.eventStart,'yyyy-mm-dd')#.png" style="max-width:75px;" alt="...">
                            </h4>
                        </cfif>
                        <div class="col-md-12 p-1"><strong>Time: </strong>#timeFormat(auditionDetails.eventStartTime)# <cfif auditionDetails.eventStopTime is not "">- #timeFormat(auditionDetails.eventStopTime)#</cfif></div>
                        <div class="col-md-12 p-1"><strong> Stage: </strong>#auditionDetails.audStep#</div>
                        <cfif auditionDetails.audStepId is "2">
                            <div class="col-md-12 p-1"><strong>Callback Type: </strong>#auditionDetails.callbackType#</div>
                        </cfif>
                        <div class="col-md-12 p-1"><strong> Type: </strong><button type="button" class="btn btn-xs btn-soft-secondary rounded-pill waves-effect">#auditionDetails.audType#</button></div>
                        <cfif auditionDetails.audStepId is "5">
                            <div class="col-md-12 p-1"><strong>Booking Type: </strong>#auditionDetails.audBookType#</div>
                        </cfif>
                        <cfif auditionDetails.audType is "online">
                            <div class="col-md-12 p-1"><strong> Platform: </strong>#auditionDetails.audPlatform#</div>
                        </cfif>
                        <div class="col-md-12 p-1"><strong> Worked with Coach: </strong> <cfif auditionDetails.workWithCoach is "1">Yes<cfelse>No</cfif> </div>
                        <cfif auditionDetails.audType is "In Person">
                            <div class="col-md-12 p-1"><strong>Parking Details: </strong>#auditionDetails.parkingDetails#</div>
                        </cfif>
                        <cfif auditionDetails.audType is "In Person">
                            <div class="col-md-12 p-1"><strong> Track Mileage: </strong> <cfif auditionDetails.trackMileage is "1">Yes<cfelse>No</cfif> </div>
                        </cfif>
                        <cfif auditionDetails.audType is "In Person">
                            <div class="col-md