@val external document: {..} = "document"
@val external window: {..} = "window"

type keyboardEvent = {key: string, code: string}
type fontSize = Small(string) | Regular(string) | Large(string)

let theText = ref("")
let textArea = document["getElementById"]("textEditor")
let previewArea = document["getElementById"]("textView")
let smallCheck = document["getElementById"]("selectSmall")
let largeCheck = document["getElementById"]("selectLarge")
let regularCheck = document["getElementById"]("selectRegular")

let sizeSelection = (text: string) => {
    let smallChecked = smallCheck["checked"]
    let regularChecked = regularCheck["checked"]

    if smallChecked {
        Small(text)
    } else if regularChecked {
        Regular(text)
    } else {
        Large(text)
    }
}

let removeSizeClass = () => {
    let classList = previewArea["classList"]
    if classList["length"] > 2 {
        classList["remove"](classList[2])
    }
}

let addSizeClass = (className: string) => {
    previewArea["classList"]["add"](className)
}

let updateClass = (className: string) => {
    let _ = removeSizeClass()
    className->addSizeClass
}

let handleUpdateClass = (text: fontSize) => {
    switch text {
    | Small(text) => {
        let _ = updateClass("text-sm")
        text
    }
    | Regular(text) => {
        let _ = updateClass("text-2xl")
        text
    }
    | Large(text) => {
        let _ = updateClass("text-6xl")
        text
    }
    }
}

let updatePreviewText = (text: fontSize) => {
    previewArea["innerText"] = text->handleUpdateClass
}

let handleTextAreaUpdate = () => {
    theText.contents = textArea["value"]
    theText.contents
        ->sizeSelection
        ->updatePreviewText
}

textArea["addEventListener"]("keyup", handleTextAreaUpdate)
smallCheck["addEventListener"]("click", handleTextAreaUpdate)
largeCheck["addEventListener"]("click", handleTextAreaUpdate)
regularCheck["addEventListener"]("click", handleTextAreaUpdate)
