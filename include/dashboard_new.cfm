
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
// Initialize Packery
var $grid = $('.packery-grid').packery({
  itemSelector: '.grid-item',
  gutter: 10,  // Increasing gutter
   fitWidth: true,  // layout will be centered within parent
  resizable: true,  // container will resize to fit items
    columnWidth: '.grid-item',
  percentPosition: true
});

// Make all items draggable
$grid.find('.grid-item').each( function(i, gridItem) {
  var draggie = new Draggabilly(gridItem);
  $grid.packery( 'bindDraggabillyEvents', draggie );
});

packery.on( 'dragItemPositioned', function( event, draggedItem ) {
    app.tiles.settings.packeryEl.packery();
});
</script>

<script>
  $(document).ready(function(){
    // Wait for a moment before triggering the animation
    setTimeout(function(){
      $(".card").addClass("loaded");
    }, 100); // The delay in milliseconds
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
document.addEventListener('DOMContentLoaded', (event) => {
  const editModeButtons = document.querySelectorAll(".toggle_edit_mode");
  
  console.log("Found buttons:", editModeButtons); // Debugging line
  
  editModeButtons.forEach((button) => {
    button.addEventListener("click", function(e){
      e.preventDefault();
      
      console.log("Button clicked");  // Debugging line

      const cardId = e.currentTarget.dataset.cardId;
      
      console.log("Card ID:", cardId);  // Debugging line

      const editIcons = document.querySelectorAll(`[data-id="${cardId}"] .hide-edit-icon`);
      
      console.log("Edit icons:", editIcons);  // Debugging line
      
      editIcons.forEach((icon) => {
        icon.classList.toggle("hide-edit-icon");
      });
    });
  });
});

</script>
