type response_status =
  { code : int
  ; message : string
  }

type requestBody = Web.XMLHttpRequest.body
type bodyType = Web.XMLHttpRequest.responseType
type responseBody = Web.XMLHttpRequest.responseBody

let blocks () =
  let endpoint = "/blocks/head" in
  let xhr = Web.XMLHttpRequest.create () in
  Web.XMLHttpRequest.open_ "POST"  ("https://tezrpc.me/api" ^ endpoint) xhr
