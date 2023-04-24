


    <cfsavecontent variable="events_loop">
        
        <cfloop query="events">

            <cfoutput>
                <cfset starttime="#timeformat('#events.eventStartTime#','HH:mm')#" />
                <cfset stoptime="#timeformat('#events.eventstopTime#','HH:mm')#" />
                <cfset newdate="#dateformat('#events.col3#','YYYY-mm-dd')#" />
                <cfset enddate="#dateformat('#events.eventstop#','YYYY-mm-dd')#" />
                <cfset dow1="#trim(events.dow)#" />
                <cfset dow2="#replace(dow1,',',''',''')#" />
                <cfset final_dow="'#dow2#'">
                    <cfif #events.endrecur# is not "">
                        <cfset initial_endrecur="#dateformat('#events.endrecur#','YYYY-mm-dd')#" />
                        <cfset endrecur=DateAdd('d', 2, initial_endrecur) />
                    </cfif>
                    {


                    <Cfif #events.dow# is not "">
                        groupId: 'recurring#events.eventid#',
                        startRecur: '#newdate#',
                        daysOfWeek: [ #final_dow# ],
                        startTime: '#starttime#',
                        endTime: '#stoptime#',

                        <cfif #events.endrecur# is not "">
                            endRecur: '#endrecur#',
                        </cfif>
                    </Cfif>

                    title: '#replace(events.col1, "'", "\'", "ALL")#',
                    start: '#newdate# #starttime#',
                    end: '#enddate# #stoptime#',
                    <cfif #events.audprojectid# is "">
                    url: '/app/appoint/?eventid=#events.eventid#&returnurl=calendar-appoint&rcontactid=0',
                    <cfelse>
                        url: '/app/audition/?focusid=#events.audid#&audprojectid=#events.audprojectid#',
                        
                    </cfif>
                    
                    description: '#replace(events.col5, "'", "\'", "ALL")#',
                    className: "colorkey-#EVENTS.id#"
                    }

                    <cfif #events.currentrow# is "#events.recordcount#">

                        <cfelse>,
                    </cfif>
            </cfoutput>
        </cfloop>
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
            timeZone: 'America/Los_Angeles',
            minTime: "<cfoutput>#userCalStarttime#</cfoutput>",
            maxTime: "<cfoutput>#userCalEndtime#</cfoutput>",
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
    
    </script> 
    
    
    
    
 