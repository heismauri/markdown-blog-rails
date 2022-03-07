import EasyMDE from "easymde";

const loadEasyMDE = () => {
  new EasyMDE({
    autoDownloadFontAwesome: false,
    element: document.getElementById("post_content"),
    spellChecker: false,
    status: false,
    styleSelectedText: false,
    showIcons: ["strikethrough", "code", "table", "redo",  "undo", "clean-block", "horizontal-rule"],
    hideIcons: ["fullscreen", "side-by-side"]
  });
};

export { loadEasyMDE };
