document.addEventListener('DOMContentLoaded', (event) => {

  

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


  
  const editModeButtons = document.querySelectorAll(".toggle_edit_mode");
  
  editModeButtons.forEach((button) => {
    button.addEventListener("click", function(e){
      e.preventDefault();
      
      const cardId = e.currentTarget.dataset.cardId;
      
      // Note: We're using a query selector that matches the data-card-id to the cardId
      const editIcons = document.querySelectorAll(`[data-card-id="${cardId}"]`);
      
      editIcons.forEach((icon) => {
        icon.classList.toggle("hide-edit-icon");
      });
    });
  });
});
