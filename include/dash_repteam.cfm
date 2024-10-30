<!--- This ColdFusion page displays a dashboard card with team member information and avatars. --->

<cfinclude template="/include/qry/myteam_499_1.cfm" />


<div class="card grid-item loaded" data-id="32">
    <div class="card-header" id="heading_system_3">
        <h5 class="m-0">
            <!-- Ensure href and id match exactly for the collapse toggle -->
            <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_3" aria-expanded="false" aria-controls="collapse_system_3">
                My Team
            </a>
        </h5>
    </div>

    <!-- Collapse component with matching ID -->
    <div id="collapse_system_3" class="collapse" aria-labelledby="heading_system_3" data-bs-parent="#accordion">
        <div class="card-body">
            <div class="row">
                <!-- Team Member Block 1 -->
                <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
                    <a href="/app/contact/?contactid=131360&t1=1" title="Blocky Block">
                        <img src="/media-abod/users/30/contacts/131360/avatar.jpg" style="width:30px;" alt="Blocky Block" />
                    </a>
                </div>
                <div class="col-md-9 col-lg-9">
                    <a href="/app/contact/?contactid=131360&t1=1" title="Blocky Block">Blocky Block</a>
                    <br>
                    <small>Agent: Modeling</small>
                </div>

                <!-- Space between rows -->
                <div class="col-12 my-3"></div>

                <!-- Team Member Block 2 -->
                <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
                    <a href="/app/contact/?contactid=130978&t1=1" title="Mariettas Putignanos">
                        <img src="/media-abod/users/30/contacts/130978/avatar.jpg" style="width:30px;" alt="Mariettas Putignanos" />
                    </a>
                </div>
                <div class="col-md-9 col-lg-9">
                    <a href="/app/contact/?contactid=130978&t1=1" title="Mariettas Putignanos">Mariettas Putignanos</a>
                    <br>
                    <small>Agent: Commercial</small>
                </div>

                <!-- Space between rows -->
                <div class="col-12 my-3"></div>

                <!-- Team Member Block 3 -->
                <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
                    <a href="/app/contact/?contactid=130880&t1=1" title="Third Test">
                        <img src="/media-abod/users/30/contacts/130880/avatar.jpg" style="width:30px;" alt="Third Test" />
                    </a>
                </div>
                <div class="col-md-9 col-lg-9">
                    <a href="/app/contact/?contactid=130880&t1=1" title="Third Test">Third Test</a>
                    <br>
                    <small>Family</small>
                </div>
            </div>

            <!-- Centered edit link -->
            <div class="col-12 text-center my-3">
                <a href="/app/myaccount/?t2=1"><i class="mdi mdi-square-edit-outline"></i></a>
            </div>
        </div>
    </div>
</div>








<cfoutput>
    <div class="card grid-item loaded" data-id="#dashboards.pnid#">
        <div class="card-header" id="heading_system_#dashboards.currentrow#">
            <h5 class="m-0">
                <a class="text-dark collapsed" data-bs-toggle="collapse" href="##collapse_system_#dashboards.currentrow#">
                    #dashboards.pnTitle#
                </a>
            </h5>
        </div>
 
        <div id="collapse_system_#dashboards.currentrow#" class="card-body collapse">
            <div class="row">
                <!--- Loop through each member in the myteam query --->
                <cfloop query="myteam">
                    <cfinclude template="/include/qry/findtag_97_1.cfm" />

                    <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
                        <cfoutput>
                            <a href="/app/contact/?contactid=#myteam.contactid#&t1=1" title="#myteam.contactname#">
                                <!--- Check if the avatar image exists --->
                                <cfif isimagefile("https://#host#.theactorsoffice.com#session.userContactsUrl#/#myteam.contactid#/avatar.jpg")>
                                    <img src="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg" style="width:30px;" alt="#myteam.contactname#" />
                                <cfelse>
                                    <img src="#application.defaultAvatarUrl#" style="width:30px;" alt="#myteam.contactname#" />
                                </cfif>
                            </a>
                        </cfoutput>
                    </div>

                    <div class="col-md-9 col-lg-9">
                        <cfoutput>
                            <a href="/app/contact/?contactid=#myteam.contactid#&t1=1" title="#myteam.contactname#">
                                #myteam.contactname#
                            </a>
                            <br>
                            <small>#findtag.tag#</small>
                        </cfoutput>
                    </div>

                    <!-- Clear row for spacing -->
                    <div class="col-md-12 col-lg-12">&nbsp;</div>
                </cfloop>
            </div>

            <!-- Centered edit link -->
            <div class="col-md-12 col-lg-12">
                <p style="text-align:center;">
                    <a href="/app/myaccount/?t2=1"><i class="mdi mdi-square-edit-outline"></i></a>
                </p>
            </div>
        </div> 
    </div> 
</cfoutput>
