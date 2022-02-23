import 'simplemde/dist/simplemde.min.css'
import SimpleMDE from "simplemde";

window.onload = function () {
  //Make textarea a Markdown editor
  const simplemde = new SimpleMDE({
    element: document.getElementById("post-editor"),
    spellChecker: false,
    status: false,
    styleSelectedText: false,
    hideIcons: ["guide", "fullscreen"]
  });
};
