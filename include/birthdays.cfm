<!--- This ColdFusion page displays a dashboard card for upcoming birthdays, fetching data from the BirthdayService and rendering it in a structured format. --->
<!--- Initialize BirthdayService --->
<cfset birthdayService = createObject("component", "services.BirthdayService")>


<!--- Fetch birthdays for the dashboard --->
<cfset birthdays = birthdayService.getBirthdaysForDashboard(session.userid)>

<!--- Card for Birthdays --->
<cfoutput>
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
                <!--- Check if there are birthdays to display --->
                <cfif birthdays.recordcount eq 0>
                    <div class="col-12">
                        <p class="text-center">No birthdays to show.</p>
                    </div>
                <cfelse>
                    <!--- Loop through birthdays and display --->
                    <cfloop query="birthdays">
                        <!--- Avatar and Contact Link --->
                        <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
                            <a href="/app/contact/?contactid=#birthdays.contactid#&t1=1" title="#birthdays.col1#">
                                <cfif isImageFile("#session.userContactsUrl#/#birthdays.contactid#/avatar.jpg")>
                                    <img src="#session.userContactsUrl#/#birthdays.contactid#/avatar.jpg" class="img-fluid" alt="#birthdays.col1#" style="width: 30px;" />
                                <cfelse>
                                    <img src="#application.defaultAvatarUrl#" class="img-fluid" alt="#birthdays.col1#" style="width: 30px;" />
                                </cfif>
                            </a>
                        </div>

                        <!--- Birthday Information --->
                        <div class="col-md-9 col-lg-9">
                            <a href="/app/contact/?contactid=#birthdays.contactid#&t1=1" title="#birthdays.col1#">
                                #birthdays.col1#
                            </a>
                            <br>
                            <small>#birthdays.col2#</small>
                        </div>

                        <!--- Spacing between entries --->
                        <div class="col-12 mb-2"></div>
                    </cfloop>
                </cfif>
            </div>
        </div>
    </div>

    <!--- Include script name --->
    <cfset script_name_include = "/include/#ListLast(GetCurrentTemplatePath(), ' \')#" />
</cfoutput>
