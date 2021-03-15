@val external document: {..} = "document"
@val external window: {..} = "window"

type keyboardEvent = {key: string, code: string}
type fontSize = Small | Regular | Large

let theText = ref("")
let textArea = document["getElementById"]("textEditor")
let previewArea = document["getElementById"]("textView")
let smallCheck = document["getElementById"]("selectSmall")
let largeCheck = document["getElementById"]("selectLarge")
let regularCheck = document["getElementById"]("selectRegular")

let removeSizeClass = () => {
    let classList = previewArea["classList"]
    if classList["length"] > 2 {
        classList["remove"](classList[2])
    }
}

let addSizeClass = (className: string): unit => {
    previewArea["classList"]["add"](className)
}

let updateClass = (className: string) => {
    removeSizeClass()
    className->addSizeClass
}

let updatePreviewText = () => {
    previewArea["innerText"] = theText.contents
}

let handleTextAreaUpdate = (~size: option<fontSize>, ()) => {
    theText.contents = textArea["value"]

    switch size {
    | Some(Small) => updateClass("text-sm")
    | Some(Regular) => updateClass("text-2xl")
    | Some(Large) => updateClass("text-6xl")
    | None => updateClass("text-2xl")
    }

    updatePreviewText
}

textArea["addEventListener"]("keyup", handleTextAreaUpdate())
smallCheck["addEventListener"]("click", handleTextAreaUpdate(~size=Some(Small)))
largeCheck["addEventListener"]("click", handleTextAreaUpdate(~size=Some(Large)))
regularCheck["addEventListener"]("click", handleTextAreaUpdate(~size=Some(Regular)))
