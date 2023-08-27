
<div class="packery-grid" data-packery='{ "itemSelector": ".grid-item", "gutter": 10 }'>


<cfloop query="dashboards">
 <div class="card grid-item mb-1"  data-id="#dashboards.pnid#">
               
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
                                         <cfif #dashboards.pnfilename# is not "">

                <cfoutput>

                    <cfset pntitle="#dashboards.pnTitle#" />

                </cfoutput>

                <cfinclude template="/include/#dashboards.pnFilename#" />



            </cfif>

                            </p>

                        </div>

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
  gutter: 10
});

// make all items draggable
$grid.find('.grid-item').each( function( i, gridItem ) {
  var draggie = new Draggabilly( gridItem );
  // bind drag events to Packery
  $grid.packery( 'bindDraggabillyEvents', draggie );
});
</script>