<!--- Check if the user has access to the audition module --->
<cfif isauditionmodule eq 0>
  Reports are only available to users who have access to the events module.
  <cfabort>
</cfif>

<!--- Set default parameters --->
<cfset pgcol=3>
<cfparam name="focus_reportid" default="0"/>
<cfparam name="customstart" default="2022-01-01"/>
<cfparam name="customend" default="2100-12-31"/>
<cfparam name="bookratio" default="0"/>
<cfparam name="anchortag" default=""/>
<cfparam name="new_audsourceid" default="0"/>
<cfparam name="new_audsourceidb" default="0"/>
<cfparam name="refresh" default="y"/>

<!--- Refresh the page if needed --->
<cfif refresh eq "y">
  <cflocation url="/include/reportsrefresh.cfm?refresh=n">
</cfif>

<!--- Form for report generation --->
<form action="/include/reportsRefresh.cfm">
  <cfoutput>
    <input type="hidden" name="refresh" value="n"/>
    <input type="hidden" name="anchortag" value=""/>
    <input type="hidden" name="new_audcatid" value="#new_audcatid#"/>
    <input type="hidden" name="new_audsourceid" value="#new_audsourceid#"/>
    <input type="hidden" name="new_audsourceidb" value="#new_audsourceidb#"/>
    <input type="hidden" name="userid" value="#userid#"/>
    <input type="hidden" name="old_rangeid" value="#new_rangeid#"/>
  </cfoutput>
  <div class="row">
    <!--- Date Range Selector --->
    <div class="form-group col-md-2">
      <label for="eventStart">Date Range<span class="text-danger">*</span>
      </label>
      <select id="new_rangeid" name="new_rangeid" class="form-control" onchange="this.form.submit();showDiv('hidden_div', this);showDiv('hidden_divs', this);">
        <cfoutput query="ranges">
          <option value="#ranges.rangeid#" <cfif ranges.rangeid eq new_rangeid>selected</cfif>>#ranges.rangename#</option>
        </cfoutput>
      </select>
    </div>

    <!--- Refresh Button --->
    <div class="form-group col-md-2 align-bottom">
      <br>
        <input type="submit" class="btn btn-primary waves-effect waves-light" value="Refresh"></div>

        <Cfoutput>

          <!--- Start Date --->
          <div id="hidden_div" class="form-group col-md-2">
            <label for="customstart">Start Date</label>
            <input id="customstart" class="form-control" autocomplete="off" value="#customstart#" name="customstart" type="date" onchange="this.form.submit();"/></div>

          <!--- End Date --->
          <div id="hidden_divs" class="form-group col-md-2">
            <label for="customend">End Date</label>
            <input id="customend" class="form-control" autocomplete="off" value="#customend#" name="customend" type="date" onchange="this.form.submit();"/></div>

        </cfoutput>
      </div>
    </form>

    <div class="row">
      <!--- Loop through stats query to display statistics --->
      <cfoutput>
        <cfloop query="stats">

          <div class="col-md-#stats.colmd# col-lg">
            <div id="#stats.reportid#" class="widget-rounded-circle card">
              <div class="card-body text-center">
                <cfset bookratio=round(bookratio)>
                <h3 class="text-dark mt-1">
                  <span data-plugin="counterup">#statvalue#</span>
                  <cfif stats.reportid eq 13>(#int(bookratio)#%)</cfif>
                </h3>
                <p class="text-muted mb-1 text-truncate">#stats.reportname#</p>
              </div>
            </div>
          </div>

        </cfloop>

      </cfoutput>
    </div>



    <div class="row">
      <!--- Loop through reports query to display report cards --->
<cfloop query="reports">
 <cfoutput>
    <div id="anchor-#reports.reportid#" class="anchor-offset col-xl-#reports.colxl# col-md-#reports.colmd# col-lg">
      <a>
        <div class="card" id="#reports.reportid#" style="border: 1px solid ##e5e5e5; border-radius:3px;">
          <div class="card-body" dir="ltr">
            <h6 class="p-1 d-flex header-title">#reports.reportname#
              <span class="ms-auto">
              </cfoutput>
              <!--- Conditional forms based on report ID --->
              <cfif #reports.reportid# is "2" OR #reports.reportid# is "7" OR #reports.reportid# is "8">
                <form action="/app/reportsRefresh/">
                  <cfoutput>
                    <input type="hidden" name="anchortag" value="anchor-#reports.reportid#"/>
                    <input type="hidden" name="new_rangeid" value="#new_rangeid#"/>
                    <input type="hidden" name="new_audsourceid" value="#new_audsourceid#"/>
                    <input type="hidden" name="customstart" value="#customstart#"/>
                    <input type="hidden" name="customend" value="#customend#"/>
                    <input type="hidden" name="userid" value="#userid#"/>
                  </cfoutput>
                  <select name="new_audcatid" onchange="this.form.submit();">
                    <cfoutput query="categories">
                      <option value="#categories.audcatid#" <cfif #categories.audcatid# is "#new_audcatid#">selected</cfif>>#categories.audcatname#</option>
                    </cfoutput>
                  </select>
                </form>
              </cfif>
            </span>
          </h6>
          <Cfoutput>
            <!-- Check if data is available -->
            <cfif dataset_x.recordCount GT 0>
              <canvas id="myChart_#reports.reportid#"></canvas>
            <cfelse>
              <!-- No data available message -->
              <div style="text-align: center; color: grey; font-size: 16px; height: 100px; display: flex; align-items: center; justify-content: center;">
                No data available
              </div>
            </cfif>
          </cfoutput>
        </div>
      </div>
    </a>
  </div>



  <cfif ListFindNoCase("3,4,6,5,7,8,9,2,4,18", reports.reportid)>

                 <cfinclude template="/include/qry/reportitems_x_281_3.cfm" />
            <cfinclude template="/include/qry/dataset_x_281_4.cfm" />
            <cfinclude template="/include/qry/labels_x_281_5.cfm" />
        <cfset k = 0 />

        <!--- Generate dataset content --->
        <cfsavecontent variable="dataset_data">
         <cfloop query="dataset_x">
           <cfinclude template="/include/qry/values_x_281_6.cfm" />
                    <cfoutput>
                        <cfset itemvalues = "#ValueList(values_x.itemValueInt, ',')#" />
                    </cfoutput>

                <cfset k = k + 1 />
                <cfif k EQ 1 OR k EQ 3>
                    <cfset bgcolor = ",backgroundColor: ['##406E8E']" />
                <cfelse>
                    <cfset bgcolor = ",backgroundColor: ['##1ABC9C']" />
                </cfif>

                <cfif k GT 1>,</cfif>
                <cfoutput>
                    {
                        label: '#dataset_x.itemdataset#',
                        data: [#itemvalues#]
                        <cfif reports.reporttypename NEQ "bar">
                            ,backgroundColor: [#reports.colorscheme#]
                        <cfelse>
                            #bgcolor#
                        </cfif>
                    }
                </cfoutput>
            </cfloop>
        </cfsavecontent>

        <!--- Prepare data for the chart --->
        <cfscript>
            reportlabels = QuotedValueList(labels_x.itemLabel, ",");
            reportvalues = QuotedValueList(reportitems_x.itemValueInt, ",");
        </cfscript>

        <cfoutput>
            <cfset reportvalues = "#reportvalues#">
            <cfset reportlabels = "#reportlabels#">

            <script>
                const chart#reports.reportid# = document.getElementById('myChart_#reports.reportid#');
                new Chart(chart#reports.reportid#, {
                    type: '#reports.reporttypename#',
                    data: {
                        labels: [#reportlabels#],
                        datasets: [#dataset_data#],
                    },
                    options: {
                        responsive: true,
                        <cfif reports.reportid EQ 4>
                            scales: {
                                x: { stacked: true },
                                y: { stacked: true }
                            },
                        </cfif>
                        <cfif reports.reportid EQ 9>
                            scales: {
                                x: { stacked: true },
                                y: {
                                    ticks: { precision: 0 },
                                    stacked: true
                                }
                            },
                        </cfif>
                    }
                });
            </script>
        </cfoutput>

    </cfif>
</cfloop>
   </div>













    

    <script>
      function showDiv(divId, element) {
        var checked = document.querySelectorAll('input:checked');
        document
          .getElementById(divId)
          .style
          .display = checked.length === 0
            ? 'none'
            : 'block';
        $("#hidden_div").prop('required', checked.length > 0);
      }
    </script>
