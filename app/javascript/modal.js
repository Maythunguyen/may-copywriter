document.addEventListener("turbo:load", () => {
    console.log("Script initialized");
  
    const deleteLinks = document.querySelectorAll(".delete-link");
    const modal = document.getElementById("confirmModal");
    const confirmButton = document.getElementById("confirmButton");
    const cancelButton = document.getElementById("cancelButton");
    let noteIdToDelete = null;
  
    if (!modal || !confirmButton || !cancelButton) {
      console.error("Modal or buttons not found in the DOM.");
      return;
    }
  
    deleteLinks.forEach(link => {
      link.addEventListener("click", (e) => {
        e.preventDefault();
        noteIdToDelete = link.dataset.noteId;
        console.log(`Delete link clicked for note ID: ${noteIdToDelete}`);
        if (noteIdToDelete) {
          modal.classList.add("modal-show");
        } else {
          console.error("Failed to get note ID.");
        }
      });
    });
  
    confirmButton.addEventListener("click", () => {
      console.log("Confirm button clicked");
      if (noteIdToDelete) {
        console.log(`Confirm button clicked for note ID: ${noteIdToDelete}`);
        const form = document.createElement("form");
        form.method = "POST";
        form.action = `/notes/${noteIdToDelete}`;
        form.innerHTML = '<input type="hidden" name="_method" value="delete">' +
                         `<input type="hidden" name="authenticity_token" value="${document.querySelector('meta[name="csrf-token"]').content}">`;
        document.body.appendChild(form);
        console.log('Form created:', form);
        form.submit();
      } else {
        console.error("No note ID found.");
      }
    });
  
    cancelButton.addEventListener("click", () => {
      modal.classList.remove("modal-show");
      noteIdToDelete = null;
      console.log("Cancel button clicked", noteIdToDelete);
    });
  
    // Add click event listener to the entire card
    const cards = document.querySelectorAll("li[data-note-url]");
    cards.forEach(card => {
      card.addEventListener("click", (e) => {
        // Prevent navigation when clicking on delete link or edit link
        if (!e.target.closest('.delete-link') && !e.target.closest('a')) {
          window.location.href = card.getAttribute("data-note-url");
        }
      });
    });
  });
  