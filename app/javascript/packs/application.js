// Import stylesheet files
import '../src/application.scss'

// Import javascript files
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")
require("bootstrap")
require("expose-loader?$!jquery");
require("expose-loader?SimpleMDE!simplemde");

// Custom javascript
$(document).on('turbolinks:load', function() {
  let editorElement = document.getElementById('content');
  if (editorElement) {
    let simplemde = new SimpleMDE({
      element: editorElement,
      spellChecker: false
    });
  }
});
