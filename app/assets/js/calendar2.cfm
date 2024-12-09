    minTime: "<cfoutput>#CalStarttime#</cfoutput>",
            maxTime: "<cfoutput>#CalEndtime#</cfoutput>",


<cfsavecontent variable="events_loop">
    <cfoutput>
    <cfloop query="events">
        {
            <cfif events.dow neq "">
                groupId: "recurring#events.eventid#",
                startRecur: "#dateformat(events.col3, 'YYYY-mm-dd')#",
                daysOfWeek: [ "#replace(trim(events.dow), ',', "','")#" ],
                startTime: "#timeformat(events.eventStartTime, 'HH:mm')#",
                endTime: "#timeformat(events.eventstopTime, 'HH:mm')#",
                <cfif events.endrecur neq "">
                    endRecur: "#dateformat(DateAdd('d', 2, events.endrecur), 'YYYY-mm-dd')#",
                </cfif>
            </cfif>
            title: "#replace(events.col1, "'", "\'", 'ALL')#",
            start: "#dateformat(events.col3, 'YYYY-mm-dd')# #timeformat(events.eventStartTime, 'HH:mm')#",
            end: "#dateformat(events.eventstop, 'YYYY-mm-dd')# #timeformat(events.eventstopTime, 'HH:mm')#",
            url: "<cfif events.audprojectid eq "">/app/appoint/?eventid=#events.eventid#&returnurl=calendar-appoint&rcontactid=0<cfelse>/app/audition/?focusid=#events.eventid#&audprojectid=#events.audprojectid#</cfif>",
            description: "#replace(events.col5, "'", "\'", 'ALL')#",
            className: "colorkey-#events.id#"
        }<cfif events.currentrow lt events.recordcount>,</cfif>
    </cfloop>
    </cfoutput>
</cfsavecontent>


<script>
! function(l) {
    "use strict";
    function e() {
        this.$body = l("body"), this.$modal = l("#event-modal"), this.$calendar = l("#calendar"), this.$btnNewEvent = l("#btn-new-event"), this.$btnDeleteEvent = l("#btn-delete-event"), this.$btnSaveEvent = l("#btn-save-event"), this.$modalTitle = l("#modal-title"), this.$calendarObj = null, this.$selectedEvent = null, this.$newEventData = null
    }
    e.prototype.init = function() {
        var e = new Date(l.now());
        var t = [<cfoutput>#events_loop#</cfoutput>
              ],
            a = this;
        a.$calendarObj = new FullCalendar.Calendar(a.$calendar[0], {
            plugins: ["bootstrap", "dayGrid", "timeGrid", "list"],
            slotDuration: "00:30:00",
            contentHeight: 'auto',
            timeZone: 'America/Los_Angeles',
            minTime: "<cfoutput>#CalStarttime#</cfoutput>",
            maxTime: "<cfoutput>#CalEndtime#</cfoutput>",
            themeSystem: "bootstrap",
            bootstrapFontAwesome: !1,
            buttonText: {
                today: "Today",
                month: "Month",
                week: "Week",
                day: "Day",
                list: "List",
                prev: "Prev",
                next: "Next"
            },
displayEventTime: false,
            defaultView: "timeGridWeek",
            handleWindowResize: !0,
            header: {
                left: "prev,next today",
                center: "title",
                right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth"
            },
            events: t,
            eventClick: function(e) {
                a.onEventClick(e)
            }
        }), a.$calendarObj.render(), a.$btnNewEvent.on("click", function(e) {
            a.onSelect({
                date: new Date,
                allDay: !0
            })
        })
            , 
            l(a.$btnDeleteEvent.on("click", function(e) {
            a.$selectedEvent && (a.$selectedEvent.remove(), a.$selectedEvent = null, a.$modal.modal("hide"))
        }))
    }, l.CalendarApp = new e, l.CalendarApp.Constructor = e
}(window.jQuery),
function() {
    "use strict";
    window.jQuery.CalendarApp.init()
}();
</script>
    
    <script>
    #calendar-container {
    position: relative;
    padding-bottom: 20px; /* Add spacing to avoid overlap */
    overflow: hidden;
    height: calc(100vh - 100px); /* Adjust based on your layout */
}
</script>
    
    
 
