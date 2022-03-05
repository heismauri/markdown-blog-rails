import EasyMDE from "easymde";

import { previewThumbnailOnFileSelect } from "../components/thumbnail_preview"

const loadEasyMDE = () => {
  new EasyMDE({
    autoDownloadFontAwesome: false,
    element: document.getElementById("post-editor"),
    spellChecker: false,
    status: false,
    styleSelectedText: false,
    showIcons: ["strikethrough", "code", "table", "redo",  "undo", "clean-block", "horizontal-rule"],
    hideIcons: ["fullscreen", "side-by-side"]
  });
};

loadEasyMDE();
previewThumbnailOnFileSelect();
