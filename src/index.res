@val external document: {..} = "document"
@val external window: {..} = "window"

type keyboardEvent = {key: string, code: string}
type fontSize = Small(string) | Regular(string) | Large(string)

let textArea = document["getElementById"]("textEditor")

let handleTextAreaUpdate = () => {
    Js.log(textArea["value"])
}

textArea["addEventListener"]("keyup", handleTextAreaUpdate)
