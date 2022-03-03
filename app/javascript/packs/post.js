import EasyMDE from "easymde";

window.onload = function () {
  //Make textarea a Markdown editor
  const easymde = new EasyMDE({
    autoDownloadFontAwesome: false,
    element: document.getElementById("post-editor"),
    spellChecker: false,
    status: false,
    styleSelectedText: false,
    showIcons: ["strikethrough", "code", "table", "redo",  "undo", "clean-block", "horizontal-rule"],
    hideIcons: ["fullscreen", "side-by-side"]
  });
};
