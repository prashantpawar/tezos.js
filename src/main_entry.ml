type response_status =
  { code : int
  ; message : string
  }

type requestBody = Web.XMLHttpRequest.body
type bodyType = Web.XMLHttpRequest.responseType
type responseBody = Web.XMLHttpRequest.responseBody

let tezos =
  object(self) val mutable url = "localhost:8732"

    method blocks () =
      let xhr = Web.XMLHttpRequest.create () in
      (*Web.XMLHttpRequest.open_ ~method':"GET" ~url:"localhost" ~x:xhr*)
      Web.XMLHttpRequest.open_ "GET" "localhost" xhr
  end [@bs]
