<!--- This ColdFusion page displays a dashboard card with team member information and avatars. --->

<cfinclude template="/include/qry/myteam_499_1.cfm" />

<cfoutput>
    <div class="card grid-item loaded" data-id="#dashboards.pnid#">
        <div class="card-header" id="heading_system_#dashboards.currentrow#">
            <h5 class="m-0">
                <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_#dashboards.currentrow#">
                    #dashboards.pnTitle#
                </a>
            </h5>
        </div>

        <!-- Card Body with Collapse ID -->
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
