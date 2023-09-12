
<script>
$(document).ready(function(){
    // Wait for a moment before triggering the animation
    setTimeout(function(){
        $(".card").addClass("loaded");
    }, 100); // The delay in milliseconds
});
</script>


<cfparam name="batchlist" default="0" />

<cfparam name="NEW_SITETYPEID" default="0" /> 

<div class="packery-grid" data-packery='{ "itemSelector": ".grid-item", "gutter": 10 }'>

<cfloop query="dashboards">
         
  <cfinclude template="/include/#dashboards.pnFilename#" />

</cfloop>

</div>




















<script>

console.log("Before Packery");
var $grid = $('.packery-grid').packery({
  itemSelector: '.grid-item',
  gutter: 10,
  fitWidth: true,
  resizable: true,
  columnWidth: '.grid-item',
  percentPosition: true
});
console.log("After Packery");

// Make all items draggable
$grid.find('.grid-item').each( function(i, gridItem) {
  var draggie = new Draggabilly(gridItem);
  $grid.packery( 'bindDraggabillyEvents', draggie );
});

$grid.on('dragItemPositioned', function() {
  // Create an array to store the new order
  var newOrder = [];

  // Iterate over each item and push its data-id to the array
  $grid.packery('getItemElements').forEach(function(itemElem) {
    var id = $(itemElem).attr('data-id');
    newOrder.push(id);
  });

  // Send the new order to the server via AJAX
  $.ajax({
    url: '/include/update_order.cfm', // your ColdFusion script
    type: 'POST',
    data: { order: newOrder.join(',') }, // send as comma-separated list
    success: function(response) {
      console.log('Updated successfully:', response);
    },
    error: function() {
      console.log('Failed to update order');
    }
  });
});

</script>

 
 









<script>
function openAllUrls(siteurl_list) {
  const urls = siteurl_list.split(',');
  console.log(`Attempting to open ${urls.length} URLs`);

  urls.forEach((url, index) => {
    const trimmedUrl = url.trim();
    console.log(`Opening URL ${index + 1}: ${trimmedUrl}`);
    
    try {
      const newWindow = window.open(trimmedUrl, '_blank');
      
      if (newWindow === null) {
        console.warn(`Failed to open ${trimmedUrl}`);
      } else {
        console.log(`Successfully opened ${trimmedUrl}`);
      }
    } catch (e) {
      console.error(`An error occurred while trying to open ${trimmedUrl}: ${e.message}`);
    }
  });
}
</script>

<script>
  $(document).ready(function(){
    // Wait for a moment before triggering the animation
    setTimeout(function(){
      $(".card").addClass("loaded");
    }, 100); // The delay in milliseconds
  });
</script>


