@val external document: {..} = "document"
@val external window: {..} = "window"

type keyboardEvent = {key: string, code: string}
type fontSize = Small(string) | Regular(string) | Large(string)

let textArea = document["getElementById"]("textEditor")
let previewArea = document["getElementById"]("textView")

let handleTextAreaUpdate = () => {
    previewArea["innerText"] = textArea["value"]
}

textArea["addEventListener"]("keyup", handleTextAreaUpdate)
