const previewThumbnail = () => {
  const input = document.getElementById("post_thumbnail");
  if (input) {
    input.addEventListener("change", () => {
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById("post_thumbnail_preview").src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById("post_thumbnail_preview").classList.remove("d-none");
  }
}

export { previewThumbnail };
