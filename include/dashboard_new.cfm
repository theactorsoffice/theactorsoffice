
<style>
.grid-item {
  box-sizing: border-box; /* To make sure padding is included in the width */
  width: calc(25% - 10px); /* Assuming 10px as the total padding + margin */
}
.card {
  margin: 0;
  padding: 0;
}

</style>
<cfparam name="batchlist" default="0" />
<cfparam name="NEW_SITETYPEID" default="0" /> 
<div class="packery-grid" data-packery='{ "itemSelector": ".grid-item", "gutter": 5 }'>


<cfloop query="dashboards">
 <cfoutput><div class="card grid-item" data-id="#dashboards.pnid#"></cfoutput>
               
                    <div class="card-header" id="heading_system_<cfoutput>#dashboards.currentrow#</cfoutput>">

                        <h5 class="m-0" style="width:100%'">

                 <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#dashboards.currentrow#</cfoutput>" aria-expanded="#header_aria_expanded#">

                                <cfoutput>#dashboards.pnTitle# <cfif #dashboards.pntitle# is "Relationship Reminders"> 
                            <span class="badge bg-secondary">#nots_total#</span> </cfif></cfoutput>  

                            </a>

                        </h5>

                    </div>

          


                        <div class="card-body">

                            <p>


                            </p>

                        </div>

                    </div>

                 
    




</cfloop>
</div>




<script>

$( function() {
  $( "#sortable" ).sortable();
  $( "#sortable" ).disableSelection();
} );

</script>
<script>
// initialize Packery
var $grid = $('.packery-grid').packery({
  itemSelector: '.grid-item',
  gutter: 0, // Setting gutter to 0
  percentPosition: true
});

// make all items draggable
$grid.find('.grid-item').each( function( i, gridItem ) {
  var draggie = new Draggabilly( gridItem );
  // bind drag events to Packery
  $grid.packery( 'bindDraggabillyEvents', draggie );
});
</script>