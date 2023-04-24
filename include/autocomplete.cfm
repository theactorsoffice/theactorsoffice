<cfquery datasource="#dsn#" name="jsons">
            SELECT col1 from contacts_ss WHERE userid = #session.userid# and col1 not like '%#chr(34)#%'
        </cfquery>
        <cfquery datasource="#dsn#" name="jsons_myteam">
            SELECT DISTINCT
            CONCAT( (DATE_FORMAT(e.eventstart, '%m/%d/%Y')),": ",c.recordname," - ",e.eventtitle) AS col1

            FROM events e INNER JOIN eventtypes_user t on t.eventtypename = e.eventtypename

            INNER JOIN eventcontactsxref x ON x.eventID = e.eventid
            INNER JOIN contactdetails c ON c.contactid = x.contactid
            WHERE e.userid = #session.userid# and t.userid = #session.userid#
            AND e.eventstart >= CURDATE()
        </cfquery>
        <cfquery datasource="#dsn#" name="jtags">
            SELECT tagname as col1 from tags_user where userid = #session.userid# order by tagname
        </cfquery>

        <script>
            var e = $.map([ < cfloop query = "jtags" > < cfoutput > < cfif #jtags.currentrow # is not "1" > , < /cfif>"#Replace(jtags.col1,"""""","","all")#"</cfoutput > < /cfloop>], function(e) {
                    return {
                        value: e,
                        data: {
                            category: "Tags"
                        }
                    }
                }),
                a = $.map([ < cfloop query = "jsons" > < cfoutput > < cfif #jsons.currentrow # is not "1" > , < /cfif>"#Replace(jsons.col1,"""""","","all")#"</cfoutput > < /cfloop>], function(e) {
                    return {
                        value: e,
                        data: {
                            category: "Contacts"
                        }
                    }
                }),

                b = $.map([ < cfloop query = "jsons_myteam" > < cfoutput > < cfif #jsons_myteam.currentrow # is not "1" > , < /cfif>"#Replace(jsons_myteam.col1,"""""","","all")#"</cfoutput > < /cfloop>], function(e) {
                    return {
                        value: e,
                        data: {
                            category: "Appointments"
                        }
                    }
                }),


                j = b;
            o = e.concat(a);
            i = o.concat(b);

            $("#autocomplete")
                .devbridgeAutocomplete({
                    lookup: i,
                    minChars: 2,
                    width: "300",
                    maxheight: "400",
                    onSelect: function(event, ui) {
                        $("#submitform").submit();
                    },
                    showNoSuggestionNotice: !0,
                    noSuggestionNotice: "Sorry, no matching results",
                    groupBy: "category"

                });

                          $("#autocomplete2")
                .devbridgeAutocomplete({
                    lookup: j,
                    minChars: 2,
                    width: "300",
                    maxheight: "400",
                    onSelect: function(e) {
                        $("#selection")
                            .html("You selected: " + e.value + ", " + e.data.category)
                    },
                    showNoSuggestionNotice: !0,
                    noSuggestionNotice: "Sorry, no matching results",
                    groupBy: "Contacts"
                })
                           
                        
                           
                           
                           

        </script>