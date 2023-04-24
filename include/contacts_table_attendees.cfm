<table id="<cfoutput>#contacts_table#</cfoutput>" style="width:100%;" class="table display dt-responsive nowrap w-100 table-striped" role="grid">
    <thead>
        <tr>

            <th></th>

            <th>Name</th>
            <th>Tags</th>
  
            <th>Company</th>
            
                      <th>Phone</th>
            <th>Email</th>
        </tr>
    </thead>
    
</table>


<script type="text/javascript">
    $(document).ready(function() {
        var table = $('#<cfoutput>#contacts_table#</cfoutput>').DataTable({
             "dom": 'frtip',
       

            "pageLength": < cfoutput > #userdefRows # < /cfoutput>,
            stateSave: false,

 
            serverSide: true,
            ajax: {
                url: '/include/contacts_attendees.cfm?eventid=<cfoutput>#eventid#</cfoutput>&contacts_table=<cfoutput>#contacts_table#</cfoutput>&userid=<Cfoutput>#session.userid#</cfoutput>',
                type: 'post'
            },

  responsive: {
        details: {
            type: 'column'
        }
    },

            columnDefs: [{
                targets: 0,
                checkboxes: {
                    selectRow: true
                }
            }],
            select: {
                style: 'multi'
            },
            order: [
                [1, 'asc']
            ],

            language: {
                infoEmpty: "No records available"
            }

        });

        // Handle form submission event 
        $('#myform').on('submit', function(e) {
            var form = this;

            var rows_selected = table.column(0).checkboxes.selected();

            // Iterate over all selected checkboxes
            $.each(rows_selected, function(index, rowId) {
                // Create a hidden element 
                $(form).append(
                    $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'idlist')
                    .val(rowId)
                );

            });

        });
        
                // Handle form submission event 
        $('#myformtag').on('submit', function(e) {
            var formtag = this;

            var rows_selectedtag = table.column(0).checkboxes.selected();

            // Iterate over all selected checkboxes
            $.each(rows_selectedtag, function(index, rowId) {
                // Create a hidden element 
                $(formtag).append(
                    $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'idlist')
                    .val(rowId)
                );

            });

        });


        $('#buttonz').click(function() {
            var numChecked = table.column(0).checkboxes.selected();
            $('log').html(numChecked);
        })





    });

</script>



<script>
    var countChecked = function() {
        var n = $("input:checked").length; //n now contains the number of checked elements.
        $("#count").text(n + (n === 1 ? " is" : " zijn") + " aangevinkt!"); //show some text
        if (n == 0) {
            $("#batchbutton_<cfoutput>#contacts_table#</cfoutput>:visible").fadeOut(); //if there are none checked, hide only visible elements
        } else {
            $("#batchbutton_<cfoutput>#contacts_table#</cfoutput>:hidden").fadeIn(); //otherwise (some are selected) fadeIn - if the div is hidden.
        }

    };
    countChecked();

    $("input[type=checkbox]").on("click", countChecked);

</script>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />
