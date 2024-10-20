<!--- This ColdFusion page handles user account settings and preferences, including modals for updating dashboard preferences, adding contacts, and managing account security. --->

<cfset modalid = "dashboardupdate" />
<cfset modaltitle = "Dashboard Preferences" />

<cfinclude template="/include/modal.cfm" />

<!--- Include fetchLocationService.cfm to get the countries and regions --->
<cfinclude template="/include/fetchLocationService.cfm" />

<cfinclude template="/include/qry/timezones.cfm" />

<script>
    $(document).ready(function() {
        $("#dashboardupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/dashboardupdate.cfm?userid=#userid#</cfoutput>");
        });
    });
</script>

<cfset modalid="remoteAddContact" />
<cfset modaltitle="Add Contact" />

<cfinclude template="/include/modal.cfm" />

<script>
    $(document).ready(function() {
        $("#remoteAddContact").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteAddContact.cfm?userid=#userid#&src=account</cfoutput>");
        });
    });
</script>

<div id="updatecal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Default Settings Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>

            <div class="modal-body">
                <p>Update your default settings.</p>

                <form action="/app/myaccount/update_cal.cfm" method="post" class="parsley-examples" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate id="preferences">
                    <div class="row" />

                    <input type="hidden" name="ctaction" value="update_cal" />
                    <input type="hidden" name="t4" value="1" />

                    <div class="form-group col-md-6">
                        <label for="calstarttime">Start Time<span class="text-danger">*</span></label>
                        <select class="form-control" name="calstarttime" id="calstarttime">
                            <cfoutput>
                                <cfset new_calstarttime = "#calstarttime#" />
                                <option value="05:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('05:00:00')#">Selected</cfif>>5:00 AM</option>
                                <option value="05:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('05:15:00')#">Selected</cfif>>5:15 AM</option>
                                <option value="05:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('05:30:00')#">Selected</cfif>>5:30 AM</option>
                                <option value="05:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('05:45:00')#">Selected</cfif>>5:45 AM</option>
                                <option value="06:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('06:00:00')#">Selected</cfif>>6:00 AM</option>
                                <option value="06:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('06:15:00')#">Selected</cfif>>6:15 AM</option>
                                <option value="06:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('06:30:00')#">Selected</cfif>>6:30 AM</option>
                                <option value="06:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('06:45:00')#">Selected</cfif>>6:45 AM</option>
                                <option value="07:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('07:00:00')#">Selected</cfif>>7:00 AM</option>
                                <option value="07:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('07:15:00')#">Selected</cfif>>7:15 AM</option>
                                <option value="07:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('07:30:00')#">Selected</cfif>>7:30 AM</option>
                                <option value="07:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('07:45:00')#">Selected</cfif>>7:45 AM</option>
                                <option value="08:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('08:00:00')#">Selected</cfif>>8:00 AM</option>
                                <option value="08:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('08:15:00')#">Selected</cfif>>8:15 AM</option>
                                <option value="08:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('08:30:00')#">Selected</cfif>>8:30 AM</option>
                                <option value="08:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('08:45:00')#">Selected</cfif>>8:45 AM</option>
                                <option value="09:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('09:00:00')#">Selected</cfif>>9:00 AM</option>
                                <option value="09:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('09:15:00')#">Selected</cfif>>9:15 AM</option>
                                <option value="09:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('09:30:00')#">Selected</cfif>>9:30 AM</option>
                                <option value="09:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('09:45:00')#">Selected</cfif>>9:45 AM</option>
                                <option value="10:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('10:00:00')#">Selected</cfif>>10:00 AM</option>
                                <option value="10:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('10:15:00')#">Selected</cfif>>10:15 AM</option>
                                <option value="10:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('10:30:00')#">Selected</cfif>>10:30 AM</option>
                                <option value="10:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('10:45:00')#">Selected</cfif>>10:45 AM</option>
                                <option value="11:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('11:00:00')#">Selected</cfif>>11:00 AM</option>
                                <option value="11:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('11:15:00')#">Selected</cfif>>11:15 AM</option>
                                <option value="11:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('11:30:00')#">Selected</cfif>>11:30 AM</option>
                                <option value="11:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('11:45:00')#">Selected</cfif>>11:45 AM</option>
                                <option value="12:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('12:00:00')#">Selected</cfif>>12:00 PM</option>
                                <option value="12:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('12:15:00')#">Selected</cfif>>12:15 PM</option>
                                <option value="12:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('12:30:00')#">Selected</cfif>>12:30 PM</option>
                                <option value="12:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('12:45:00')#">Selected</cfif>>12:45 PM</option>
                                <option value="13:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('13:00:00')#">Selected</cfif>>1:00 PM</option>
                                <option value="13:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('13:15:00')#">Selected</cfif>>1:15 PM</option>
                                <option value="13:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('13:30:00')#">Selected</cfif>>1:30 PM</option>
                                <option value="13:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('13:45:00')#">Selected</cfif>>1:45 PM</option>
                                <option value="14:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('14:00:00')#">Selected</cfif>>2:00 PM</option>
                                <option value="14:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('14:15:00')#">Selected</cfif>>2:15 PM</option>
                                <option value="14:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('14:30:00')#">Selected</cfif>>2:30 PM</option>
                                <option value="14:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('14:45:00')#">Selected</cfif>>2:45 PM</option>
                                <option value="15:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('15:00:00')#">Selected</cfif>>3:00 PM</option>
                                <option value="15:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('15:15:00')#">Selected</cfif>>3:15 PM</option>
                                <option value="15:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('15:30:00')#">Selected</cfif>>3:30 PM</option>
                                <option value="15:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('15:45:00')#">Selected</cfif>>3:45 PM</option>
                                <option value="16:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('16:00:00')#">Selected</cfif>>4:00 PM</option>
                                <option value="16:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('16:15:00')#">Selected</cfif>>4:15 PM</option>
                                <option value="16:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('16:30:00')#">Selected</cfif>>4:30 PM</option>
                                <option value="16:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('16:45:00')#">Selected</cfif>>4:45 PM</option>
                                <option value="17:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('17:00:00')#">Selected</cfif>>5:00 PM</option>
                                <option value="17:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('17:15:00')#">Selected</cfif>>5:15 PM</option>
                                <option value="17:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('17:30:00')#">Selected</cfif>>5:30 PM</option>
                                <option value="17:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('17:45:00')#">Selected</cfif>>5:45 PM</option>
                                <option value="18:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('18:00:00')#">Selected</cfif>>6:00 PM</option>
                                <option value="18:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('18:15:00')#">Selected</cfif>>6:15 PM</option>
                                <option value="18:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('18:30:00')#">Selected</cfif>>6:30 PM</option>
                                <option value="18:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('18:45:00')#">Selected</cfif>>6:45 PM</option>
                                <option value="19:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('19:00:00')#">Selected</cfif>>7:00 PM</option>
                                <option value="19:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('19:15:00')#">Selected</cfif>>7:15 PM</option>
                                <option value="19:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('19:30:00')#">Selected</cfif>>7:30 PM</option>
                                <option value="19:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('19:45:00')#">Selected</cfif>>7:45 PM</option>
                                <option value="20:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('20:00:00')#">Selected</cfif>>8:00 PM</option>
                                <option value="20:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('20:15:00')#">Selected</cfif>>8:15 PM</option>
                                <option value="20:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('20:30:00')#">Selected</cfif>>8:30 PM</option>
                                <option value="20:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('20:45:00')#">Selected</cfif>>8:45 PM</option>
                                <option value="21:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('21:00:00')#">Selected</cfif>>9:00 PM</option>
                                <option value="21:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('21:15:00')#">Selected</cfif>>9:15 PM</option>
                                <option value="21:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('21:30:00')#">Selected</cfif>>9:30 PM</option>
                                <option value="21:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('21:45:00')#">Selected</cfif>>9:45 PM</option>
                                <option value="22:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('22:00:00')#">Selected</cfif>>10:00 PM</option>
                                <option value="22:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('22:15:00')#">Selected</cfif>>10:15 PM</option>
                                <option value="22:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('22:30:00')#">Selected</cfif>>10:30 PM</option>
                                <option value="22:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('22:45:00')#">Selected</cfif>>10:45 PM</option>
                                <option value="23:00:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('23:00:00')#">Selected</cfif>>11:00 PM</option>
                                <option value="23:15:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('23:15:00')#">Selected</cfif>>11:15 PM</option>
                                <option value="23:30:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('23:30:00')#">Selected</cfif>>11:30 PM</option>
                                <option value="23:45:00" <cfif "#timeformat(new_calstarttime)#" is "#timeformat('23:45:00')#">Selected</cfif>>11:45 PM</option>
                            </cfoutput>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="calendtime">End Time<span class="text-danger">*</span></label>
                        <select class="form-control" name="calendtime" id="calendtime">
                            <cfoutput>
                                <cfset new_calendtime = "#calendtime#" />
                                <option value="05:00:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('05:00:00')#">Selected</cfif>>5:00 AM</option>
                                <option value="05:15:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('05:15:00')#">Selected</cfif>>5:15 AM</option>
                                <option value="05:30:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('05:30:00')#">Selected</cfif>>5:30 AM</option>
                                <option value="05:45:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('05:45:00')#">Selected</cfif>>5:45 AM</option>
                                <option value="06:00:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('06:00:00')#">Selected</cfif>>6:00 AM</option>
                                <option value="06:15:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('06:15:00')#">Selected</cfif>>6:15 AM</option>
                                <option value="06:30:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('06:30:00')#">Selected</cfif>>6:30 AM</option>
                                <option value="06:45:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('06:45:00')#">Selected</cfif>>6:45 AM</option>
                                <option value="07:00:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('07:00:00')#">Selected</cfif>>7:00 AM</option>
                                <option value="07:15:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('07:15:00')#">Selected</cfif>>7:15 AM</option>
                                <option value="07:30:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('07:30:00')#">Selected</cfif>>7:30 AM</option>
                                <option value="07:45:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('07:45:00')#">Selected</cfif>>7:45 AM</option>
                                <option value="08:00:00" <cfif "#timeformat(new_calendtime)#" is "#timeformat('08:00:00')#">Selected</cfif>>8:00 AM</option>
                                <option value="08:15:00" <
