<div class="packery-grid" data-packery='{ "itemSelector": ".grid-item", "gutter": 10 }'>
<cfloop query="dashboards">
<cfoutput>
<div class="grid-item panel panel-default" data-id="#dashboards.pnid#">
  <div class="panel-heading">#dashboards.pntitle#</div>
  <div class="panel-body">Content 1</div>
</div>
</cfoutput>
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