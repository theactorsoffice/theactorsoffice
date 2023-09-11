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
  