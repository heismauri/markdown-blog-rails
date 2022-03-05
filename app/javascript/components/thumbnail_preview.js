const previewThumbnailOnFileSelect = () => {
  // we select the thumbnail input
  const input = document.getElementById('thumbnail-upload');
  console.log(input);
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('thumbnail-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('thumbnail-preview').classList.remove('d-none');
  }
}

export { previewThumbnailOnFileSelect };
