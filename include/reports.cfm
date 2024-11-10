<!--- This ColdFusion page generates reports based on user input and displays them dynamically. --->
<style> 
    .anchor-offset { 
        box-sizing: border-box; 
        padding-top: 75px; 
        margin-top: -75px; 
    } 
</style> 

<!--- Check if the user has access to the audition module --->
<cfif isauditionmodule is "0"> 
    Reports are only available to users who have access to the events module.
    <cfabort> 
</cfif> 

<!--- Set default parameters --->
<cfset pgCol = 3 /> 
<cfparam name="focusReportId" default="0" /> 
<cfparam name="customStart" default="2022-01-01" /> 
<cfparam name="customEnd" default="" /> 
<cfparam name="bookRatio" default="0" /> 
<cfparam name="anchorTag" default="" /> 
<cfparam name="newAudSourceId" default="0" /> 
<cfparam name="newAudSourceIdB" default="0" /> 
<cfparam name="refresh" default="y" /> 

<!--- Refresh the page if needed --->
<cfif refresh is "y"> 
    <cflocation url="/include/reportsRefresh.cfm?refresh=n" /> 
</cfif> 

<style> 
    .col-lg { min-width: 0; } 

    <!--- Hide divs based on range ID --->
    <cfif newRangeId is not "7"> 
        #hiddenDiv, #hiddenDivs { display: none; } 
    </cfif> 
</style> 

<!--- Form for report generation --->
<form action="/include/reportsRefresh.cfm"> 
    <input type="hidden" name="refresh" value="n" /> 
    <input type="hidden" name="anchorTag" value="" /> 
    <input type="hidden" name="newAudCatId" value="#newAudCatId#" /> 
    <input type="hidden" name="newAudSourceId" value="#newAudSourceId#" /> 
    <input type="hidden" name="newAudSourceIdB" value="#newAudSourceIdB#" /> 
    <input type="hidden" name="userId" value="#userId#" /> 
    <input type="hidden" name="oldRangeId" value="#newRangeId#" /> 

    <div class="row"> 
        <div class="form-group col-md-2"> 
            <label for="eventStart">Date Range<span class="text-danger">*</span></label> 
            <select id="newRangeId" name="newRangeId" class="form-control" onchange="this.form.submit();showDiv('hiddenDiv', this);showDiv('hiddenDivs', this)"> 
                <cfoutput query="ranges"> 
                    <option value="#ranges.rangeId#" <cfif ranges.rangeId is newRangeId> selected </cfif>>#ranges.rangeName#</option> 
                </cfoutput> 
            </select> 
        </div> 

        <div class="form-group col-md-2 align-bottom"> 
            <br> 
            <input type="submit" class="btn btn-primary waves-effect waves-light" value="Refresh" /> 
        </div> 

        <div id="hiddenDiv" class="form-group col-md-2"> 
            <label for="customStart">Start Date</label> 
            <input id="customStart" class="form-control" autocomplete="off" value="#customStart#" name="customStart" type="date" onchange="this.form.submit();"> 
        </div> 

        <div id="hiddenDivs" class="form-group col-md-2"> 
            <label for="customEnd">End Date</label> 
            <input id="customEnd" class="form-control" autocomplete="off" value="#customEnd#" name="customEnd" type="date" onchange="this.form.submit();"> 
        </div> 
    </div> 
</form> 

<div class="row"> 
    <!--- Loop through stats query to display statistics --->
    <cfloop query="stats"> 
        <div class="col-md-#stats.colMd# col-lg"> 
            <div id="#stats.reportId#" class="widget-rounded-circle card"> 
                <div class="card-body"> 
                    <cfset bookRatio = round(bookRatio) /> 

                    <div class="text-center"> 
                        <h3 class="text-dark mt-1"> 
                            <span data-plugin="counterup">#statValue#</span> 
                            <cfif stats.reportId is "13">(##int(bookRatio)##%)</cfif> 
                        </h3> 

                        <p class="text-muted mb-1 text-truncate">#stats.reportName#</p> 
                    </div> 
                </div> <!--- end row--> 
            </div> 
        </div>
    </cfloop> 
</div>

<!--- Loop through reports query to display report cards --->
<cfloop query="reports"> 
    <div id="anchor-#reports.reportId#" class="anchor-offset col-xl-#reports.colXl# col-md-#reports.colMd# col-lg"> 
        <a> 
            <div class="card" id="#reports.reportId#" style="border: 1px solid ##e5e5e5;border-radius:3px;"> 
                <div class="card-body" dir="ltr"> 
                    <h6 class="p-1 d-flex header-title">#reports.reportName# 
                        <span class="ms-auto"> 

                            <!--- Conditional forms based on report ID --->
                            <cfif reports.reportId is "2" or reports.reportId is "7" or reports.reportId is "8"> 
                                <form action="/app/reportsRefresh/"> 
                                    <input type="hidden" name="anchorTag" value="anchor-#reports.reportId#" /> 
                                    <input type="hidden" name="newRangeId" value="#newRangeId#" /> 
                                    <input type="hidden" name="newAudSourceId" value="#newAudSourceId#" /> 
                                    <input type="hidden" name="customStart" value="#customStart#" /> 
                                    <input type="hidden" name="customEnd" value="#customEnd#" /> 
                                    <input type="hidden" name="userId" value="#userId#" /> 

                                    <select name="newAudCatId" onchange="this.form.submit()"> 
                                        <cfoutput query="categories"> 
                                            <option value="#categories.audCatId#" <cfif categories.audCatId is newAudCatId>Selected </cfif>>#categories.audCatName#</option> 
                                        </cfoutput> 
                                    </select> 
                                </form> 
                            </cfif> 

                            <cfif reports.reportId is "6"> 
                                <cfinclude template="/include/qry/audSources_281_1.cfm" /> 

                                <form action="/app/reportsRefresh/"> 
                                    <input type="hidden" name="anchorTag" value="anchor-#reports.reportId#" /> 
                                    <input type="hidden" name="newRangeId" value="#newRangeId#" /> 
                                    <input type="hidden" name="newAudSourceId" value="#newAudSourceId#" /> 
                                    <input type="hidden" name="newAudCatId" value="#newAudCatId#" /> 
                                    <input type="hidden" name="customStart" value="#customStart#" /> 
                                    <input type="hidden" name="customEnd" value="#customEnd#" /> 
                                    <input type="hidden" name="userId" value="#userId#" /> 

                                    <select name="newAudSourceIdB" onchange="this.form.submit()"> 
                                        <option value="0" <cfif newAudSourceIdB is "0">Selected </cfif>>All Sources</option> 

                                        <cfoutput query="audSources"> 
                                            <option value="#audSources.audSourceId#" <cfif audSources.audSourceId is newAudSourceIdB>Selected </cfif>>#audSources.audSource#</option> 
                                        </cfoutput> 
                                    </select> 
                                </form> 
                            </cfif> 

                            <cfif reports.reportId is "18"> 
                                <cfinclude template="/include/qry/audSources_281_1.cfm" /> 

                                <form action="/app/reportsRefresh/"> 
                                    <input type="hidden" name="anchorTag" value="anchor-#reports.reportId#" /> 
                                    <input type="hidden" name="newRangeId" value="#newRangeId#" /> 
                                    <input type="hidden" name="newAudSourceIdB" value="#newAudSourceIdB#" /> 
                                    <input type="hidden" name="newAudCatId" value="#newAudCatId#" /> 
                                    <input type="hidden" name="customStart" value="#customStart#" /> 
                                    <input type="hidden" name="customEnd" value="#customEnd#" /> 
                                    <input type="hidden" name="userId" value="#userId#" /> 

                                    <select name="newAudSourceId" onchange="this.form.submit()"> 
                                        <