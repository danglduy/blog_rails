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

// Expose jQuery & EasyMDE
import $ from 'expose-loader?exposes[]=$&exposes[]=jQuery!jquery';
import EasyMDE from 'expose-loader?exposes[]=$&exposes[]=EasyMDE!easymde';

// Custom javascript
$(document).on('turbolinks:load', function() {
  let editorElement = document.getElementById('content');
  if (editorElement) {
    let easymde = new EasyMDE({
      element: editorElement,
      spellChecker: false
    });
  }
});
