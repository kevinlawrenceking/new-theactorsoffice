<cfset modalid="dashboardupdate"/>

<cfset modaltitle="Dashboard Preferences"/>

<cfinclude template="/include/modal.cfm"/>

<cfinclude template="/include/qry/countries_457_1.cfm"/>

<cfinclude template="/include/qry/regions_518_1.cfm"/>

<cfinclude template="/include/qry/timezones_547_1.cfm" />

<cfinclude template="/include/qry/timezones_min_547_2.cfm" />

       <cfif #ctaction# is "deleteitem">

                <cfinclude template="/include/qry/deleteTeam.cfm"/>

              </cfif>



<cfif #ctaction# is "addmember">

    <cfinclude template="/include/qry/qry_block_1_3.cfm" />

    <cfif #findK.recordcount# is "1">

        <cfset new_contactid=findk.contactid />

        <Cfif #new_contactid# is not "">
        
            <cfinclude template="/include/qry/qry_block_1_4.cfm" />

        </cfif>

    </cfif>

    <cfif #new_region_id# is "" and #def_region_id# is not "">

        <cfset new_region_id=def_region_id />

    </cfif>


    <cfif #new_countryid# is "" and #def_countryid# is not "">

        <cfset new_countryid=def_countryid />

    </cfif>

    <cfparam name="t2" default="0" />

    <cfif #devicetype# is "mobile">


        <cfif #t2# is "1">

            <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=122" />

        </cfif>

        <cfparam name="t3" default="0" />

        <cfif #t3# is "1">

            <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=124" />

        </cfif>

        <cfparam name="t7" default="0" />

        <cfif #t7# is "1">

            <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=125" />

        </cfif>

        

</cfif>
</cfif>
<script>
  $(document).ready(function () {
    $("#dashboardupdate").on("show.bs.modal", function (event) {
      
      $(this)
        .find(".modal-body")
        .load("<cfoutput>/include/dashboardupdate.cfm?userid=#userid#</cfoutput>");
    });
  });
</script>

<cfset modalid="remoteUserUpdate"/>

<cfset modaltitle="Update Account"/>

<cfinclude template="/include/modal.cfm"/>

<cfset modalid="remoteAddContact"/>

<cfset modaltitle="Add Contact"/>

<cfinclude template="/include/modal.cfm"/>

<script>
  $(document).ready(function () {
    $("#remoteUserUpdate").on("show.bs.modal", function (event) {
      $(this)
        .find(".modal-body")
        .load("<cfoutput>/include/remoteUserUpdate.cfm?userid=#userid#&src=account</cfoutput>");
    });
  });
</script>

<script>
  $(document).ready(function () {
    $("#remoteAddContact").on("show.bs.modal", function (event) {
      $(this)
        .find(".modal-body")
        .load("<cfoutput>/include/remoteAddContact.cfm?userid=#userid#&src=account</cfoutput>");
    });
  });
</script>

<cfinclude template="/include/qry/details_1693_1.cfm"/>

<div id="updatecal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" >


  <div class="modal-dialog">

    <div class="modal-content">

      <div class="modal-header" style="background-color: ##f3f7f9;">

        <h4 class="modal-title" id="standard-modalLabel">Default Settings Update</h4>

        <button type="button" class="close" data-bs-dismiss="modal" >

          <i class="mdi mdi-close-thick"></i>

        </button>

      </div>

      <div class="modal-body">

        <p>Update your default settings.</p>

        <form action="/app/myaccount/update_cal.cfm" method="post" class="parsley-examples" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate="data-parsley-validate" id="preferences">

          <div class="row"/>

          <input type="hidden" name="ctaction" value="update_cal"/>

          <input type="hidden" name="t4" value="1"/>

<!--- Start and End times for the loop --->
<cfset startTime = createTime(5, 0, 0)>
<cfset endTime = createTime(23, 45, 0)>

<!--- Start Time Selection --->
    <div class="form-group col-md-6">
        <label for="calstarttime">Start Time<span class="text-danger">*</span></label>
        <select class="form-control" name="calstarttime" id="calstarttime">
            <cfloop from="#startTime#" to="#endTime#" step="#createTimeSpan(0, 0, 15, 0)#" index="timeSlot">
                      <cfset formattedTime = timeFormat(timeSlot, "HH:mm:ss")>
                <cfset displayTime = timeFormat(timeSlot, "h:mm tt")>
            <cfoutput>
      
                <option value="#formattedTime#" <cfif timeFormat(details.calstarttime) EQ formattedTime>selected</cfif>>
                    #displayTime#
                </option>
                </cfoutput>
            </cfloop>
        </select>
    </div>
<Cfoutput>
    <!--- End Time Selection --->
    <div class="form-group col-md-6">
        <label for="calendtime">End Time<span class="text-danger">*</span></label>
        <select class="form-control" name="calendtime" id="calendtime">
            <cfloop from="#startTime#" to="#endTime#" step="#createTimeSpan(0, 0, 15, 0)#" index="timeSlot">
                <cfset formattedTime = timeFormat(timeSlot, "HH:mm:ss")>
                <cfset displayTime = timeFormat(timeSlot, "h:mm tt")>
                <option value="#formattedTime#" <cfif timeFormat(details.calendtime) EQ formattedTime>selected</cfif>>
                    #displayTime#
                </option>
            </cfloop>
        </select>
    </div>
</cfoutput>

<div class="form-group col-md-6">

            <label for="defrows">Rows Per Page<span class="text-danger">*</span>
            </label>

            <select class="form-control" name="defrows" id="defrows">

              <cfoutput>

                <option value="10" <cfif #details.defrows# is "10"> Selected </cfif>>10</option>

                <option value="25" <cfif #details.defrows# is "25"> Selected </cfif>>25</option>

                <option value="50" <cfif #details.defrows# is "50"> Selected </cfif>>50</option>

                <option value="100" <cfif #details.defrows# is "100"> Selected </cfif>>100</option>

              </cfoutput>

            </select>

          </div>

          <cfoutput>

            <input type="hidden" name="viewtypeid" value="#details.viewtypeid#"/>

          </cfoutput>

          <div class="form-group col-md-12">

            <label for="tzid">Timezone<span class="text-danger">*</span>
            </label>

            <select class="form-control" name="tzid" id="tzid" data-parsley-required="data-parsley-required" data-parsley-error-message="Timezone is required">

              <cfoutput query="timezones_min">

                <option value="#timezones_min.tzid#" <cfif #details.tzid# is "#timezones_min.tzid#"> Selected </cfif>>(#timezones_min.gmt#) #timezones_min.tzgeneral#</option>

              </cfoutput>

            </select>

          </div>

          <div class="form-group text-center col-md-12">

            <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>

          </div>

        </div>
        <!--- row end  --->
      </form>

    </div>
    <!--- modal-body end  --->
  </div>
  <!--- modal-content end  --->

</div>
<!--- modal-dialog end  --->

</div>
<!--- modal end 
<cfinclude template="/include/qry/FindUser_1694_2.cfm"/> --->

<cfinclude template="/include/qry/dateformats_463_1.cfm"/>

<cfparam name="ctaction" default="view"/>





         
<div id="updatecal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" >


              <div class="modal-dialog">

                <div class="modal-content">

                  <div class="modal-header" style="background-color: ##f3f7f9;">

                    <h4 class="modal-title" id="standard-modalLabel">Default Settings Update</h4>

                    <button type="button" class="close" data-bs-dismiss="modal" >

                      <i class="mdi mdi-close-thick"></i>

                    </button>

                  </div>

                  <div class="modal-body">

                    <p>Update your default settings.</p>

                    <form action="/app/myaccount/update_cal.cfm" method="post" class="parsley-examples" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate="data-parsley-validate" id="preferences">

                      <div class="row"/>

                      <input type="hidden" name="ctaction" value="update_cal"/>

                      <input type="hidden" name="t4" value="1"/>

              <!--- Start Time Selection --->
              <cfoutput>
    <div class="form-group col-md-6">
        <label for="calstarttime">Start Time<span class="text-danger">*</span></label>
        <select class="form-control" name="calstarttime" id="calstarttime">
            <cfloop from="#startTime#" to="#endTime#" step="#createTimeSpan(0, 0, 15, 0)#" index="timeSlot">
                <cfset formattedTime = timeFormat(timeSlot, "HH:mm:ss")>
                <cfset displayTime = timeFormat(timeSlot, "h:mm tt")>
                <option value="#formattedTime#" <cfif timeFormat(details.calstarttime) EQ formattedTime>selected</cfif>>
                    #displayTime#
                </option>
            </cfloop>
        </select>
    </div>

    <!--- End Time Selection --->
    <div class="form-group col-md-6">
        <label for="calendtime">End Time<span class="text-danger">*</span></label>
        <select class="form-control" name="calendtime" id="calendtime">
            <cfloop from="#startTime#" to="#endTime#" step="#createTimeSpan(0, 0, 15, 0)#" index="timeSlot">
                <cfset formattedTime = timeFormat(timeSlot, "HH:mm:ss")>
                <cfset displayTime = timeFormat(timeSlot, "h:mm tt")>
                <option value="#formattedTime#" <cfif timeFormat(details.calendtime) EQ formattedTime>selected</cfif>>
                    #displayTime#
                </option>
            </cfloop>
        </select>
    </div>
</cfoutput>
                      <div class="form-group col-md-6">

                        <label for="defrows">Rows Per Page<span class="text-danger">*</span>
                        </label>

                        <select class="form-control" name="defrows" id="defrows">

                          <cfoutput>

                            <option value="10" <cfif #details.defrows# is "10"> Selected </cfif>>10</option>

                            <option value="25" <cfif #details.defrows# is "25"> Selected </cfif>>25</option>

                            <option value="50" <cfif #details.defrows# is "50"> Selected </cfif>>50</option>

                            <option value="100" <cfif #details.defrows# is "100"> Selected </cfif>>100</option>

                          </cfoutput>

                        </select>

                      </div>

                      <cfoutput>

                        <input type="hidden" name="viewtypeid" value="#details.viewtypeid#"/>

                      </cfoutput>

                      <div class="form-group col-md-12">

                        <label for="tzid">Timezone<span class="text-danger">*</span>
                        </label>

                        <select class="form-control" name="tzid" id="tzid" data-parsley-required="data-parsley-required" data-parsley-error-message="Timezone is required">

                          <cfoutput query="timezones">

                            <option value="#timezones.tzid#" <cfif #details.tzid# is "#timezones.tzid#"> Selected </cfif>>(#timezones.gmt#) #timezones.tzname#</option>

                          </cfoutput>

                        </select>

                      </div>

                      <div class="form-group text-center col-md-12">

                        <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>

                      </div>

                    </div>
                    <!--- row end  --->
                  </form>

                </div>
                <!--- modal-body end  --->
              </div>
              <!--- modal-content end  --->

            </div>
            <!--- modal-dialog end  --->

          </div>
          <!--- modal end  --->


    

                <CFOUTPUT>

                  <CFSET CURRENTID=#userContactid#/>

                </CFOUTPUT>

                <cfparam name="ITEMIDD" default="0"/>

                <cfset ctaction="view"/>

                <cfset teamaction="view"/>

                <cfset t2=1/>

       

              <cfparam name="currentid" default="0"/>

              <cfset session.pgrtn="P"/>

              <cfset pgrtn="P"/>

              <cfif #devicetype# is "mobilez">
                <div class="card">

                  <div class="btn-group col-md-12">

                    <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                      <Cfoutput>#pgname#</Cfoutput>
                      <i class="fe-menu"></i>

                    </button>
                    <div class="dropdown-menu">

                      <cfloop query="FindOptions">
                        <cfoutput>
                          <a class="dropdown-item" href="/app/#pgDir#/?new_pgid=#FindOptions.pgid#">#FindOptions.pgname#</a>
                        </cfoutput>
                      </cfloop>

                    </div>
                  </div>
                  <!--- /btn-group  --->

                  <div class="card-body">

                    <cfif #pgid# is "121">
                      <cfinclude template="/include/mylinks_pane.cfm"/>
                    </cfif>

                    <cfif #pgid# is "122">
                      <cfinclude template="/include/myteam_pane.cfm"/>
                    </cfif>

                    <cfif #pgid# is "124">
                      <cfinclude template="/include/prefs_pane.cfm"/>
                    </cfif>

                    <cfif #pgid# is "125">
                      <cfinclude template="/include/systemprefs_pane.cfm"/>
                    </cfif>

                  </div>
                </div>

              </cfif>

              <cfif #devicetype# is not "mobile">

                <cfinclude template="/include/tab_check_account.cfm"/>

                <cfparam name="tab1_expand" default="false"/>

                <cfparam name="tab2_expand" default="false"/>

                <cfparam name="tab3_expand" default="false"/>

                <cfparam name="tab4_expand" default="false"/>

                <cfparam name="tab5_expand" default="false"/>

                <cfparam name="tab6_expand" default="false"/>

                <cfparam name="tab7_expand" default="false"/>

                <cfparam name="tab8_expand" default="false"/>

                <cfparam name="tab9_expand" default="false"/>

                <cfparam name="tab0_expand" default="false"/>

                <cfparam name="tab10_expand" default="false"/>

                <cfif #tab1_expand# is "false" and #tab2_expand# is "false" and #tab3_expand# is "false" and #tab4_expand# is "false" and #tab7_expand# is "false" and #tab8_expand# is "false" and #tab9_expand# is "false" and #tab0_expand# is "false" and #tab10_expand# is "false">

                  <cfset tab0_expand="true"/>

                  <cfset t0=1/>

                </cfif>

                <div class="card">

                  <div class="card-body">

                    <ul class="nav nav-pills navtab-bg nav-justified p-1">

                      <cfoutput>

                        <li class="nav-item">
                          <a href="##info" data-bs-toggle="tab" aria-expanded="#tab0_expand#" class="nav-link<cfif #tab0_expand# is 'true'> active</cfif>">Info
                          </a>
                        </li>

                        <li class="nav-item">
                          <a href="##profile" data-bs-toggle="tab" aria-expanded="#tab1_expand#" class="nav-link<cfif #tab1_expand# is 'true'> active</cfif>">Dashboard
                          </a>
                        </li>

                        <li class="nav-item">
                          <a href="##myteam" data-bs-toggle="tab" aria-expanded="#tab2_expand#" class="nav-link<cfif #tab2_expand# is 'true'> active</cfif>">My Team</a>
                        </li>

                        <li class="nav-item">
                          <a href="##mybrand" data-bs-toggle="tab" aria-expanded="#tab3_expand#" class="nav-link<cfif #tab3_expand# is 'true'> active</cfif>">Brand Essence</a>
                        </li>

                        <li class="nav-item">
                          <a href="##myheadshots" data-bs-toggle="tab" aria-expanded="#tab8_expand#" class="nav-link<cfif #tab8_expand# is 'true'> active</cfif>">Headshots</a>
                        </li>

                        <li class="nav-item">
                          <a href="##mymaterials" data-bs-toggle="tab" aria-expanded="#tab9_expand#" class="nav-link<cfif #tab9_expand# is 'true'> active</cfif>">Materials</a>
                        </li>

                        <li class="nav-item">
                          <a href="##pref" data-bs-toggle="tab" aria-expanded="#tab4_expand#" class="nav-link<cfif #tab4_expand# is 'true'> active</cfif>">Preferences</a>
                        </li>

                        <li class="nav-item">
                          <a href="##systems" data-bs-toggle="tab" aria-expanded="#tab7_expand#" class="nav-link<cfif #tab7_expand# is 'true'> active</cfif>">Systems</a>
                        </li>

                        <li class="nav-item">
                          <a href="##billing" data-bs-toggle="tab" aria-expanded="#tab10_expand#" class="nav-link<cfif #tab10_expand# is 'true'> active</cfif>">Billing</a>
                        </li>

                        <span class="ml-auto padding-bottom:11px;text-nowrap border border-top-0 !important border-left-0 !important border-right-0 !important" style="border-top:0 !important;border-left:0 !important;border-right:0 !important;"></span>

                      </cfoutput>

                    </ul>

                    <div class="tab-content">

                      <div class="tab-pane<cfif #tab0_expand# is 'true'> show active</cfif>" id="info">

                        <cfinclude template="/include/myinfo_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab1_expand# is 'true'> show active</cfif>" id="profile">

                        <cfinclude template="/include/mylinks_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab2_expand# is 'true'> show active</cfif>" id="myteam">

                        <cfinclude template="/include/myteam_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab3_expand# is 'true'> show active</cfif>" id="mybrand">

                        <cfinclude template="/include/mybrand_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab8_expand# is 'true'> show active</cfif>" id="myheadshots">

                        <cfinclude template="/include/myheadshots_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab9_expand# is 'true'> show active</cfif>" id="mymaterials">

                        <cfinclude template="/include/mymaterials_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab4_expand# is 'true'> show active</cfif>" id="pref">

                        <cfinclude template="/include/prefs_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab7_expand# is 'true'> show active</cfif>" id="systems">

                        <cfinclude template="/include/systemprefs_pane.cfm"/>

                      </div>

                      <div class="tab-pane<cfif #tab10_expand# is 'true'> show active</cfif>" id="billing">

                        <cfinclude template="/include/mybilling_pane.cfm"/>

                      </div>

                    </div>

                  </div>

                </cfif>

              