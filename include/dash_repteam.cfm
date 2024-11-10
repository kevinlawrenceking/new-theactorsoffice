<cfinclude template="/include/qry/myteam_499_1.cfm"/>
<div class="card grid-item loaded" data-id="#dashboards.pnid#">
    <div class="card-header" id="heading_system_#dashboards.currentrow#">
        <h5 class="m-0">
            <a class="text-dark collapsed" data-bs-toggle="collapse" href="##collapse_system_#dashboards.currentrow#"> 
                #dashboards.pnTitle#
            </a>
        </h5>
    </div>
    <div class="card-body">
        <div class="row">
            <cfloop query="myteam">
                <cfinclude template="/include/qry/findtag_97_1.cfm"/>
                <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
                    <a href="/app/contact/?contactid=#myteam.contactid#&t1=1" title="#myteam.contactname#">
                        <cfif isImageFile("https://#host#.theactorsoffice.com#session.userContactsUrl#/#myteam.contactid#/avatar.jpg")>
                            <img src="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg" style="width:30px;" alt="#myteam.contactname#"/>
                        <cfelse>
                            <img src="#application.defaultAvatarUrl#" style="width:30px;" alt="#myteam.contactname#"/>
                        </cfif>
                    </a>
                </div>
                <div class="col-md-9 col-lg-9">
                    <a href="/app/contact/?contactid=#myteam.contactid#&t1=1" title="#myteam.contactname#"> 
                        #myteam.contactname#
                    </a> 
                    <br>
                    <small> 
                        #findtag.tag# 
                    </small>
                </div>
                <div class="col-md-12 col-lg-12"> &nbsp; </div>
            </cfloop>
        </div>
        <div class="col-md-12 col-lg-12">
            <p style="text-align:center;">
                <a href="/app/myaccount/?t2=1">
                    <i class="mdi mdi-square-edit-outline"></i>
                </a>
            </p>
        </div>
    </div> <!--end card -->
</div>

<!--- Modifications: Removed unnecessary cfoutput tags (Standard 2), removed # symbols from conditional checks (Standard 3), standardized variable names and casing (Standard 5), ensured consistent attribute quoting, spacing, and formatting (Standard 6). --->