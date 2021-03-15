// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml_array from "bs-platform/lib/es6/caml_array.js";

var theText = {
  contents: ""
};

var textArea = document.getElementById("textEditor");

var previewArea = document.getElementById("textView");

var smallCheck = document.getElementById("selectSmall");

var largeCheck = document.getElementById("selectLarge");

var regularCheck = document.getElementById("selectRegular");

function removeSizeClass(param) {
  var classList = previewArea.classList;
  if (classList.length > 2) {
    return classList.remove(Caml_array.get(classList, 2));
  }
  
}

function addSizeClass(className) {
  return previewArea.classList.add(className);
}

function updateClass(className) {
  removeSizeClass(undefined);
  return addSizeClass(className);
}

function updatePreviewText(param) {
  previewArea.innerText = theText.contents;
  
}

function handleTextAreaUpdate(size, param) {
  theText.contents = textArea.value;
  if (size !== undefined) {
    switch (size) {
      case /* Small */0 :
          removeSizeClass(undefined);
          addSizeClass("text-sm");
          break;
      case /* Regular */1 :
          removeSizeClass(undefined);
          addSizeClass("text-2xl");
          break;
      case /* Large */2 :
          removeSizeClass(undefined);
          addSizeClass("text-6xl");
          break;
      
    }
  } else {
    removeSizeClass(undefined);
    addSizeClass("text-2xl");
  }
  return updatePreviewText;
}

textArea.addEventListener("keyup", (function (param) {
        return handleTextAreaUpdate(param, undefined);
      }));

var partial_arg = /* Small */0;

smallCheck.addEventListener("click", (function (param) {
        return handleTextAreaUpdate(partial_arg, param);
      }));

var partial_arg$1 = /* Large */2;

largeCheck.addEventListener("click", (function (param) {
        return handleTextAreaUpdate(partial_arg$1, param);
      }));

var partial_arg$2 = /* Regular */1;

regularCheck.addEventListener("click", (function (param) {
        return handleTextAreaUpdate(partial_arg$2, param);
      }));

export {
  theText ,
  textArea ,
  previewArea ,
  smallCheck ,
  largeCheck ,
  regularCheck ,
  removeSizeClass ,
  addSizeClass ,
  updateClass ,
  updatePreviewText ,
  handleTextAreaUpdate ,
  
}
/* textArea Not a pure module */
