<cfset dbug="N" />

<!--- Set default parameters --->
<cfparam name="zquery" default="" />
<cfset unchecked_style="mdi mdi-checkbox-blank-outline font-24 mr-1" />
<cfset checked_style="mdi mdi-checkbox-marked-outline font-24 mr-1" />
<cfparam name="hide_completed_check" default="" />
<cfparam name="hide_completed" default="N" />

<!--- Check if completed items should be hidden --->
<cfif #hide_completed# is "Y">
    <cfset hide_completed_check="checked" />
</cfif>

<cfoutput>
    <div class="d-flex justify-content-between">
        <div class="float-left">
 <!-- Filter checkboxes -->
<label>
  <input type="checkbox" class="status-filter" value="completed" checked>
  Completed
</label>
<label>
  <input type="checkbox" class="status-filter" value="skipped" checked>
  Skipped
</label>
<label>
  <input type="checkbox" class="status-filter" value="upcoming" checked>
  Upcoming
</label>
<label>
  <input type="checkbox" class="status-filter" value="pending" checked>
  Pending
</label>

        </div>
    </div>
</cfoutput>

<div id="tab-relationship-view" style="flex: 1 1 auto;">
    <!--- Loop through active systems --->
     
    <cfloop query="sysActive">

    <cfif #LCase(notsactive.notstatus)# is "active" >
<cfset showstatus = "Active">
<cfelse>
<cfset showstatus = "#LCase(notsactive.notstatus)#">
</cfif>

        <cfinclude template="/include/qry/notsactive_510_1.cfm" />
        <cfoutput>
            <div class="row reminder #shostatus#">
                <div class="col-md-12">
                    <h4>#sysActive.systemName#
                    <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="##action#sysactive.suid#-modal">
                        <i class="fe-info font-14 mr-1"></i>
                    </a>
                    <!--- Check if system status is completed --->
                    <cfif #sysActive.sustatus# is "Completed">
                        <span class="badge bg-warning rounded-pill">Completed</span>
                    </cfif>
                    <span>
                        <a title="Delete System" href="DeleteModal.cfm?rpgid=40&recid=#sysActive.suid#&t4=1" data-bs-toggle="modal" data-bs-target="##remoteDeleteForm#sysActive.suid#">
                        <i class="fe-trash-2"></i>
                        </a>
                    </span>
                    </h4>
                </div>
            </div>
        </cfoutput>

    
        <!--- Check if there are no active items --->
        <cfif #notsActive.recordcount# is "0">
            <p>No action items to show!</p>
        </cfif>

        <!--- Loop through active notifications --->
        <cfif #notsActive.recordcount# is not "0">
 
<cfloop query="notsActive">

    <cfoutput>
        <div class="col-md-12 reminder #LCase(notsactive.notstatus)#" style="padding-bottom:10px; margin-left:30px;">
            <cfif notsActive.notstatus is "Pending" or notsActive.notstatus is "Upcoming">
                <a href="/include/complete_not.cfm?notid=#notsactive.notid#&notstatus=Completed&hide_completed=#hide_completed#">
            </cfif>
            <i class="mdi mdi-checkbox-#notsactive.checktype#-outline font-24 mr-1" 
               style="vertical-align: middle;color:###notsactive.status_color#"></i>
            <cfif notsActive.notstatus is "Pending" or notsActive.notstatus is "Upcoming">
                </a>
            </cfif>
            
            #notsactive.delstart# #notsActive.actiondetails# #notsactive.delend#

            <cfif notsactive.notEndDate neq "">
                (#notsactive.notstatus# #this.formatDate(notsactive.notEndDate)#)
            <cfelse>
                (Due Date #this.formatDate(notsactive.notstartdate)#)
            </cfif>

            <cfif notsactive.ispastdue eq "1">
                <span class="badge badge-soft-danger">Past Due</span>
            </cfif>

            <a href="" title="Click for details" data-bs-toggle="modal" data-bs-target="##action#notsActive.actionid#-modal">
                <i class="fe-info font-14 mr-1"></i>
            </a>

            <cfif notsActive.notstatus is "Pending" or notsActive.notstatus is "Upcoming">
                <a href="/include/complete_not.cfm?notid=#notsactive.notid#&notstatus=Skipped&hide_completed=#hide_completed#" title="Skip reminder">
                    <span class="badge badge-blue" style="margin-left:10px">x Skip</span>
                </a>
            </cfif>
        </div>
    </cfoutput>
</cfloop>
        </cfif>

    </cfloop>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
  // Get all checkboxes
  const checkboxes = document.querySelectorAll('.status-filter');

  // Attach event listeners
  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', filterReminders);
  });

  // Initial run
  filterReminders();
});

function filterReminders() {
  // 1. Figure out which statuses are checked
  const checkboxes = document.querySelectorAll('.status-filter');
  let activeStatuses = [];
  checkboxes.forEach(cb => {
    if (cb.checked) {
      activeStatuses.push(cb.value);
    }
  });

  // 2. Show/hide reminders based on their class
  const allReminders = document.querySelectorAll('.reminder');
  allReminders.forEach(reminder => {
    // e.g. "reminder completed"
    const classes = reminder.className.split(" ");
    // check if the reminder’s status is in the activeStatuses array
    let shouldShow = classes.some(c => activeStatuses.includes(c));
    // Toggle display
    reminder.style.display = shouldShow ? '' : 'none';
  });
}
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \ ")#" />
