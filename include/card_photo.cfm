<cfoutput>
    <div class="tao-card-photo">
        <!-- Trash Icon in Header -->
        <div class="tao-card-photo-header">
            <i class="mdi mdi-square-edit-outline" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i>
        </div>

        <!-- Card Body: Image + Overlay -->
        <div class="tao-card-photo-body">
            <img src="#card_image#" alt="#card_name#">
            
            <!-- Magnifying Glass Icon (Opens Lightbox) -->
            <div class="image-overlay">
                <a href="#card_image#" data-lightbox="headshots" data-title="#card_name#">
                    <i class="mdi mdi-magnify"></i>
                </a>
            </div>
        </div>

        <!-- Footer with Editable Name -->
        <div class="tao-card-photo-footer">
            <div class="photo-name editable" data-id="#currentid#">#card_name#</div>
        </div>
    </div>
</cfoutput>

<!-- AJAX Script -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".photo-name").forEach(function (element) {
        element.addEventListener("click", function () {
            if (this.querySelector("input")) return; // Prevent multiple inputs

            let originalText = this.innerText;
            let mediaId = this.getAttribute("data-id");

            // Create input field
            let input = document.createElement("input");
            input.type = "text";
            input.value = originalText;
            input.classList.add("edit-input");
            this.innerHTML = ""; // Clear existing content
            this.appendChild(input);
            input.focus();

            // Handle save on Enter key
            input.addEventListener("keypress", function (e) {
                if (e.key === "Enter") {
                    let newText = input.value.trim();
                    if (newText && newText !== originalText) {
                        fetch("/include/update_media_name.cfm", { // Updated fetch path
                            method: "POST",
                            headers: { "Content-Type": "application/x-www-form-urlencoded" },
                            body: `mediaid=${mediaId}&medianame=${encodeURIComponent(newText)}`
                        })
                        .then(response => response.text())
                        .then(data => {
                            if (data === "success") {
                                // Create a new div with the updated name
                                let newDiv = document.createElement("div");
                                newDiv.classList.add("photo-name", "editable");
                                newDiv.setAttribute("data-id", mediaId);
                                newDiv.innerText = newText;
                                
                                // Replace the input with the new name
                                input.replaceWith(newDiv);
                                
                                // Reattach event listener to allow future edits
                                newDiv.addEventListener("click", function () {
                                    this.dispatchEvent(new Event("click"));
                                });

                            } else {
                                input.replaceWith(createTextDiv(originalText, mediaId));
                            }
                        })
                        .catch(() => {
                            input.replaceWith(createTextDiv(originalText, mediaId));
                        });
                    } else {
                        input.replaceWith(createTextDiv(originalText, mediaId));
                    }
                }
            });

            // Revert if clicked outside
            input.addEventListener("blur", function () {
                input.replaceWith(createTextDiv(originalText, mediaId));
            });

            function createTextDiv(text, id) {
                let div = document.createElement("div");
                div.classList.add("photo-name", "editable");
                div.setAttribute("data-id", id);
                div.innerText = text;
                div.addEventListener("click", function () {
                    this.dispatchEvent(new Event("click"));
                });
                return div;
            }
        });
    });
});

</script>

<style>
    .photo-name {
        cursor: pointer;
        color: #007bff;
        font-weight: bold;
        transition: 0.2s;
    }
    .photo-name:hover {
        text-decoration: underline;
    }
    .edit-input {
        width: 100%;
        font-size: inherit;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    .updated {
        color: #28a745; /* Green text after updating */
    }
</style>
