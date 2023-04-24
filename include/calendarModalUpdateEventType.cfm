<cfloop query="eventtypes_user">
    <cfoutput>
        <script>
            $(document).ready(function() {
                $("##updateeventtype_#eventtypes_user.id#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/updateeventtype.cfm?id=#eventtypes_user.id#");
                });
            });
        </script>
    </cfoutput>
    <cfoutput>
        <div id="updateeventtype_#eventtypes_user.id#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #eventtypes_user.eventtypecolor#;">
                        <h4 class="modal-title" id="standard-modalLabel">#eventtypes_user.eventtypename# Appointment Type Update</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body">
                    </div>
                </div>
            </div>
        </div>
    </cfoutput>
</cfloop>
