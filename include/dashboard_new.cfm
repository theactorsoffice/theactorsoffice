
  <style>
    .packery-grid {
      width: 100%;
    }
    .grid-item {
      width: calc(25% - 10px);
      box-sizing: border-box;
    }
  </style>

<cfparam name="batchlist" default="0" />
<cfparam name="NEW_SITETYPEID" default="0" /> 
<div class="packery-grid" data-packery='{ "itemSelector": ".grid-item", "gutter": 10 }'>


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
  $(document).ready(function() {
    // Initialize Packery
    var $grid = $('.packery-grid').packery({
      itemSelector: '.grid-item',
      gutter: 10,
      percentPosition: true
    });

    // Make all items draggable
    $grid.find('.grid-item').each(function(i, gridItem) {
      var draggie = new Draggabilly(gridItem);
      $grid.packery('bindDraggabillyEvents', draggie);
    });
  });
</script>