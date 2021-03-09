@val external document: {..} = "document"
@val external window: {..} = "window"

type keyboardEvent = {key: string, code: string}
type fontSize = Small(string) | Regular(string) | Large(string)

let theSize = ref("")
let textArea = document["getElementById"]("textEditor")
let previewArea = document["getElementById"]("textView")

let sizeSelection = (text: string) => {
    let smallCheck = document["getElementById"]("selectSmall")["checked"]
    let regularCheck = document["getElementById"]("selectRegular")["checked"]

    if smallCheck {
        Small(text)
    } else if regularCheck {
        Regular(text)
    } else {
        Large(text)
    }
}

let updatePreviewText = (text: fontSize) => {
    // previewArea["innerText"] = text
}

let handleTextAreaUpdate = () => {
    let theText = textArea["value"]
    theText
        ->sizeSelection
        ->updatePreviewText
}

textArea["addEventListener"]("keyup", handleTextAreaUpdate)
