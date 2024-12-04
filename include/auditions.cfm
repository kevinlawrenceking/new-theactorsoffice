<!--- This ColdFusion page handles audition management, including adding auditions, filtering by various criteria, and displaying results in both table and gallery formats. --->
<cfinclude template="/include/audition_check.cfm"/>
<cfinclude template="/include/qry/audcategories_sel.cfm"/>

<style>
    #basic-datatable span {
        display: none;
    }
</style>

<cfparam name="isexport" default="N"/>
<cfparam name="sel_audcatid" default="%"/>

<script>
    $(document).ready(function () {

        $("#remoteaudadd").on("show.bs.modal", function (event) {
            var $modal = $(this);
            var cacheBuster = new Date().getTime(); 
            var loadUrl = "/include/remoteaudadd.cfm?userid=<cfoutput>#userid#</cfoutput>&isdirect=0&_=" + cacheBuster;

            $modal.find(".modal-body").html("<p>Loading...</p>");

           $modal.find(".modal-body").load(loadUrl, function (response, status, xhr) {
                if (status === "error") {
                     $modal.find(".modal-body").html("<p>Error loading content. Please try again.</p>");
                } else {
                 
                    $modal.find(".modal-body").focus();
                }
            });
        });
    });
</script>

<div id="remoteaudadd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" 

>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Audition Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" 

>
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        
        $("#remoteaudadddirect").on("show.bs.modal", function (event) {
            
            $(this).find(".modal-body").load("/include/remoteaudadd.cfm?userid=<cfoutput>#userid#</cfoutput>&isdirect=1");
        });
    });
</script>

<div id="remoteaudadddirect" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" 

>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Direct Booking Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" 

>
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<!--- Determine view type based on viewtypeid --->
<cfif #viewtypeid# is "1">
    <cfparam name="view" default="tbl"/>
<cfelse>
    <cfparam name="view" default="glry"/>
</cfif>

<cfinclude template="/include/qry/up_31_1.cfm" />

<style>
    .card img {
        border-top-right-radius: 0;
        border-bottom-left-radius: calc(0.25rem - 1px);
    }
</style>

<cfinclude template="/include/qry/audsteps_sel_31_2.cfm" />
<cfinclude template="/include/qry/audtypes_sel_31_3.cfm" />

<div class="container px-1">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <cfset i=0>

                    <form action="/app/auditions/">

                        <cfoutput>
                            <input type="hidden" name="view" value="#view#"/>
                        </cfoutput>

                        <div class="row">
                            <div class="col-lg-4 pb-1">
                                <a href="" class="btn btn-primary waves-effect waves-light" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteaudadd" data-bs-placement="top" title="Add Audition" data-bs-original-title="Add Audition">
                                    Add Audition
                                </a>

                                <a href="" class="btn btn-success waves-effect waves-light" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteaudadddirect" data-bs-placement="top" title="Add Direct booking" data-bs-original-title="Add Direct Booking">
                                    Direct Booking
                                </a>
                            </div>

                            <div class="col-lg-4 pb-1">
                                <select id="audstepid" name="sel_audstepid" class="form-control" onchange="this.form.submit()">
                                    <option value="%">All Statuses</option>
                                    <option value="1" <cfif #sel_audstepid# is "1"> Selected </cfif>>Audition</option>
                                    <option value="2" <cfif #sel_audstepid# is "2"> Selected </cfif>>Callback</option>
                                    <option value="3" <cfif #sel_audstepid# is "3"> Selected </cfif>>Redirect</option>
                                    <option value="4" <cfif #sel_audstepid# is "4"> Selected </cfif>>Pin/Avail</option>
                                    <option value="5" <cfif #sel_audstepid# is "5"> Selected </cfif>>Booking</option>
                                    <option value="999" <cfif #sel_audstepid# is "999"> Selected </cfif>>Direct Booking</option>
                                </select>
                            </div>

                            <div class="col-lg-4 pb-1">
                                <select id="audcatid" class="form-control" name="sel_audcatid" onchange="this.form.submit()">
                                    <option value="%">All Categories</option>
                                    <cfoutput query="audcategories_sel">
                                        <cfif #audcategories_sel.id# is "#sel_audcatid#">
                                            <option value="#audcategories_sel.id#" Selected="Selected">#audcategories_sel.name#</option>
                                        <cfelse>
                                            <option value="#audcategories_sel.id#">#audcategories_sel.name#</option>
                                        </cfif>
                                    </cfoutput>
                                </select>
                            </div>

                            <div class="col-lg-4 d-flex">
                                <span>
                                    <Cfif #view# is "tbl">
                                        <cfset table_button="btn-secondary"/>
                                        <cfset gallery_button="btn-outline-secondary"/>
                                    </Cfif>

                                    <Cfif #view# is "glry">
                                        <cfset table_button="btn-outline-secondary"/>
                                        <cfset gallery_button="btn-secondary"/>
                                    </Cfif>

                                    <a href="<cfoutput>/app/auditions/?sel_audstepid=#sel_audstepid#&sel_audtype=#sel_audtype#&sel_contactid=#sel_contactid#&sel_coname=#sel_coname#&auddate=#auddate#&audsearch=#audsearch#&view=tbl&materials=#materials#" class="btn btn-xs #table_button# waves-effect waves-light</cfoutput>">
                                        <i class="mdi mdi-menu fa-2x"></i>
                                    </a>
                                    &nbsp;

                                    <a href="<cfoutput>/app/auditions/?sel_audstepid=#sel_audstepid#&sel_audtype=#sel_audtype#&sel_contactid=#sel_contactid#&sel_coname=#sel_coname#&auddate=#auddate#&audsearch=#audsearch#&view=glry&materials=#materials#" class="btn btn-xs #gallery_button# waves-effect waves-light</cfoutput>">
                                        <i class="mdi mdi-drag fa-2x"></i>
                                    </a>

                                    &nbsp;&nbsp;

                                    <a href="<cfoutput>/app/auditions/?sel_audstepid=#sel_audstepid#&sel_audtype=#sel_audtype#&sel_contactid=#sel_contactid#&sel_coname=#sel_coname#&auddate=#auddate#&audsearch=#audsearch#&view=#view#&isexport=y&materials=#materials#" class="btn btn-xs btn-outline-secondary waves-effect waves-light</cfoutput>" title="Export Auditions">
                                        <i class="mdi mdi-export fa-2x"></i>
                                    </a>

                                    &nbsp;&nbsp;

                                    <a href="<cfoutput>/app/auditions-import/" class="btn btn-xs btn-outline-secondary waves-effect waves-light</cfoutput>" title="Import Auditions">
                                        <i class="mdi mdi-import fa-2x"></i>
                                    </a>
                                </span>
                            </div>

                     
                                <input type="hidden" name="auddate" value="%"/>
    

                            <cfinclude template="/include/qry/cds_31_4.cfm" />
                            <cfinclude template="/include/qry/cos_31_5.cfm" />
                            <cfparam name="sel_coname" default="%"/>

                            <div class="col-lg-4 pb-1">
                                <select id="sel_contactid" name="sel_contactid" class="form-control" onchange="this.form.submit()">
                                    <option value="%">All Casting Directors</option>
                                    <cfoutput query="cds">
                                        <option value="#cds.contactid#" <cfif "#cds.contactid#" is "#sel_contactid#">selected</cfif>>#cds.cd#</option>
                                    </cfoutput>
                                </select>
                            </div>

                            <div class="col-lg-4 pb-1">
                                <select id="sel_coname" name="sel_coname" class="form-control" onchange="this.form.submit()">
                                    <option value="%">All Companies</option>
                                    <cfoutput query="cos">
                                        <option value="#cos.valueCompany#" <cfif "#cos.valueCompany#" is "#sel_coname#" >Selected</cfif>>#cos.valueCompany#</option>
                                    </cfoutput>
                                </select>
                            </div>

                            <div class="col-lg-4 pb-1"></div>

                            <div class="col-lg-8 pb-1">
                                <div class="app-search-box dropdown">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="audsearch" value="<cfoutput>#audsearch#</cfoutput>" id="audsearch" placeholder="Search..." autocomplete="off">
                                        &nbsp;
                                        <div class="input-group-append">
                                            <button class="btn btn-xs btn-primary waves-effect waves-light" id="mybtn" style="height:100%;" type="submit">
                                                <i class="fe-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
<div class="container p-3">
                <div class="row">
                    <cfif #view# is "glry">
                        <cfif #results.recordcount# is "0">
                            <p>No events found</p>
                        </cfif>

                        <cfif #results.recordcount# is not "0">
                            <p>
                                <cfoutput>
                                    <strong> #results.recordcount#</strong> audition<cfif #results.recordcount# is not "1">s</cfif> found
                                </cfoutput>
                            </p>
                        </cfif>

                        <cfloop query="results">
                            <cfoutput>
                                <cfif #results.isbooked# is "1">
                                    <cfset col6="Booked"/>
                                <cfelseif #results.ispin# is "1">
                                    <cfset col6="Pin"/>
                                <cfelseif #results.isredirect# is "1">
                                    <cfset col6="Redirect"/>
                                <cfelseif #results.iscallback# is "1">
                                    <cfset col6="Callback"/>
                                <cfelse>
                                    <cfset col6="Audition"/>
                                </cfif>
                            </cfoutput>

                            <cfoutput>
                                <cfset i=#i# + 1/>
                                <div class="col-lg-4">
                                    <div class="card ribbon-box border-secondary">
                                        <cfif #results.isbooked# is "1">
                                            <div class="ribbon-two ribbon-two-success">
                                                <span>Booked</span>
                                            </div>
                                        </cfif>

                                        <div class="card-header text-white bg-secondary d-flex" style="font-size:16px;">
                                            <center>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;#results.col2#</center>
                                            <span class="ms-auto text-light">
                                                <a href="/app/audition/?audprojectid=#results.audprojectid#" class="btn btn-xs btn-primary waves-effect waves-light">
                                                    <i class="mdi mdi-eye-outline"></i>
                                                </a>
                                            </span>
                                        </div>

                                        <div class="row g-0">
                                            <div class="col-md-4 p-2">
                                                <cfif #isdefined('option1')#>
                                                    <center>
                                                        <img src="#application.datesUrl#/#DateFormat('#results.col1#','mm-dd')#.png" style="max-width:75px;" alt="...">
                                                    </center>
                                                    <br>
                                                    <center>#DateFormat('#results.col1#','yyyy')#</center>
                                                </cfif>

                                                <cfif #results.col1#is not "">
                                                    <a href="/app/audition/?audprojectid=#results.recid#" title="#DateFormat('#results.col1#','long')#">
                                                        <img src="#application.datesUrl#/#DateFormat('#results.col1#','mm-dd')#.png" style="max-width:75px;" alt="...">
                                                    </a>
                                                <cfelse>
                                                    <a href="/app/audition/?audprojectid=#results.recid#" title="#DateFormat('#results.col1b#','long')# at #timeformat('#results.col1b#')#">
                                                        <img src="#application.datesUrl#/#DateFormat('#results.col1b#','mm-dd')#.png" style="max-width:75px;" alt="...">
                                                    </a>
                                                </cfif>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <cfif #results.ispin# is "1">
                                                        <div class="ribbon ribbon-Pin float-end">
                                                            <i class="mdi mdi-access-point me-1"></i>Pin
                                                        </div>
                                                    </cfif>

                                                    <cfif #results.isredirect# is "1">
                                                        <div class="ribbon ribbon-Redirect float-end">
                                                            <i class="mdi mdi-access-point me-1"></i>Redirect
                                                        </div>
                                                    </cfif>

                                                    <cfif #results.iscallback# is "1">
                                                        <div class="ribbon ribbon-Callback float-end">
                                                            <i class="mdi mdi-access-point me-1"></i>Callback
                                                        </div>
                                                    </cfif>

                                                    <cfif #results.col4#is not "">
                                                        <h5 class="card-title">#results.audcatname#</h5>
                                                        <h6>#results.audsubcatname#</h6>
                                                        <h7>#results.col4#</h7>
                                                    <cfelse>
                                                        <h5 class="card-title">#results.audcatname#</h5>
                                                        <h6>#results.audsubcatname#</h6>
                                                        <h7>Role: TBD</h7>
                                                    </cfif>

                                                    <p class="card-text">
                                                        <small class="text-muted">
                                                            Source: <cfif #results.col5#is not "">
                                                                <cfif #results.col5# is "My Team" and #results.contactname#is not "">
                                                                    #results.contactname#
                                                                <cfelse>
                                                                    #results.col5#
                                                                </cfif>
                                                            <cfelse>
                                                                TBD
                                                            </cfif>
                                                        </small>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--- end card --->
                            </cfoutput>

                            <cfif #i# is "3">
                                </div>
                                <div class="row">
                                    <cfset i=0>
                            </cfif>
                        </cfloop>
                   
                   
                   
                    </cfif>

                    <cfif #view# is "tbl">
                        <div class="container">
                            <div class="card pb-3">
                                <div class="card-body">
                                    <cfif #results.recordcount# is "0">
                                        <p>No events found</p>
                                    </cfif>

                                    <cfif #results.recordcount# is not "0">
                                        <p>
                                            <cfoutput>
                                                <strong>#results.recordcount#</strong> audition <cfif #results.recordcount# is not "1">s</cfif> found
                                            </cfoutput>
                                        </p>
                                    </cfif>

                                    <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                                        <thead>
                                            <cfloop query="results" endrow="1">
                                                <cfoutput>
                                                    <cfif (Results.CurrentRow MOD 2)>
                                                        <Cfset rowtype="Odd"/>
                                                    <cfelse>
                                                        <Cfset rowtype="Even"/>
                                                    </cfif>

                                                    <tr class="#rowtype#">
                                                        <th width="50">Action</th>
                                                        <th>#results.head1#</th>
                                                        <th>#results.head2#</th>
                                                        <th>#results.head3#</th>
                                                        <th>#results.head4#</th>
                                                        <th>#results.head5#</th>
                                                        <th>#results.head6#</th>
                                                    </tr>
                                                </cfoutput>
                                            </cfloop>
                                        </thead>
                                        <tbody>
                                            <cfloop query="results">
                                                <cfoutput>
                                                    <cfif #results.isbooked# is "1">
                                                        <cfset col6="Booked"/>
                                                    <cfelseif #results.ispin# is "1">
                                                        <cfset col6="Pin"/>
                                                    <cfelseif #results.isredirect# is "1">
                                                        <cfset col6="Redirect"/>
                                                    <cfelseif #results.iscallback# is "1">
                                                        <cfset col6="Callback"/>
                                                    <cfelse>
                                                        <cfset col6="Audition"/>
                                                    </cfif>
                                                </cfoutput>
                                                <cfoutput>
                                                    <tr>
                                                        <td>
                                                            <a href="/app/audition/?audprojectid=#results.recid#" class="btn btn-xs btn-primary waves-effect waves-light">
                                                                <i class="mdi mdi-eye-outline"></i>
                                                            </a>
                                                        </td>

                                                        <td style="word-break: break-all;">
                                                            <span>#dateformat('#results.col1#','YYYYMMdd')#</span>
                                                            #dateformat('#results.col1#','MM-dd-YYYY')#
                                                        </td>

                                                        <td style="word-break: break-all;">#results.col2#</td>
                                                        <td style="word-break: break-all;">
                                                            <cfif #results.col3#is not "">
                                                                <cfif #results.col3# is "My Team" and #results.contactname#is not "">
                                                                    #results.contactname#
                                                                <cfelse>
                                                                    #results.col3#
                                                                </cfif>
                                                            <cfelse>
                                                                TBD
                                                            </cfif>
                                                        </td>
                                                        <td style="word-break: break-all;">#results.col4#</td>
                                                        <td style="word-break: break-all;">#results.col5#</td>
                                                        <td style="word-break: break-all;">#col6#</td>
                                                    </tr>
                                                </cfoutput>
                                            </cfloop>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <SCRIPT>
                            $(document).ready(function () {
                                $("#basic-datatable").DataTable({
                                    "bFilter": false,
                                    "dom": 'rtip',
                                    "pageLength": 100,
                                    responsive: true,
                                    language: {
                                        paginate: {
                                            previous: "<i class='mdi mdi-chevron-left'>",
                                            next: "<i class='mdi mdi-chevron-right'>"
                                        }
                                    },
                                    drawCallback: function () {
                                        $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
                                    }
                                });
                                var a = $("#datatable-buttons").DataTable({
                                    lengthChange: !1,
                                    buttons: [
                                        {
                                            extend: "copy",
                                            className: "btn-light"
                                        }, {
                                            extend: "print",
                                            className: "btn-light"
                                        }, {
                                            extend: "pdf",
                                            className: "btn-light"
                                        }
                                    ],
                                    language: {
                                        paginate: {
                                            previous: "<i class='mdi mdi-chevron-left'>",
                                            next: "<i class='mdi mdi-chevron-right'>"
                                        }
                                    },
                                    drawCallback: function () {
                                        $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
                                    }
                                });
                            });
                        </SCRIPT>
                    </cfif>
               </div>
                </div>
                <!--- end card body --->
            </div>
            <!--- end card --->
        </div>
        <!--- end col --->
    </div>

    <cfif #isexport# is "Y">
        <cfinclude template="/include/qry/export_ac_31_6.cfm">
   
        <cfoutput>

          <cfset app_direct="C:\home\theactorsoffice.com\media-#host#\users\#userid#\"/>
          <cfset sub_name_c="#dateformat('#now()#','YYYYMMDD')#"/>
          <cfset sub_name_d="#timeformat('#now()#','HHMMSS')#"/>
          <cfset fileName="xexport_auditions_#sub_name_c##sub_name_d#.xls"/>

          <cfscript>
            cfspreadsheet(action = "write", fileName = "#app_direct#\#fileName#", query = "export_ac", overwrite = true);
          </cfscript>

          <cfheader name="content-disposition" value="Attachment;filename=#fileName#">
          <cfcontent file="#app_direct#\#fileName#" type="application/vnd.ms-excel">

        </cfoutput>

        <cfset isexport="N"/>
      </cfif>
