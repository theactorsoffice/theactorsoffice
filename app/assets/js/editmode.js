document.addEventListener('DOMContentLoaded', (event) => {
  // Debugging: check if DOMContentLoaded is firing
  console.log('DOMContentLoaded fired');

  const editModeButtons = document.querySelectorAll(".toggle_edit_mode");
  
  // Debugging: print out the NodeList of buttons
  console.log('Edit Mode Buttons:', editModeButtons);

  editModeButtons.forEach((button) => {
    button.addEventListener("click", function(e){
      e.preventDefault();
      
      // Debugging: print out which button was clicked
      console.log('Button clicked:', e.currentTarget);

      const cardId = e.currentTarget.dataset.cardId;
      
      // Debugging: print out the cardId
      console.log('Card ID:', cardId);

      const editIcons = document.querySelectorAll(`[data-card-id="${cardId}"]`);
      
      // Debugging: print out the NodeList of matching edit icons
      console.log('Edit Icons:', editIcons);

      editIcons.forEach((icon) => {
        icon.classList.toggle("hide-edit-icon");
      });
    });
  });
});
