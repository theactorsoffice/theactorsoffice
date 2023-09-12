document.addEventListener('DOMContentLoaded', (event) => {
  // ... Your other code for packery and stuff ...
  
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
