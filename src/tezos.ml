module StringMap = Map.Make(String);;

type response_status =
  { code : int
  ; message : string
  }

type requestBody = Web.XMLHttpRequest.body
type bodyType = Web.XMLHttpRequest.responseType
type responseBody = Web.XMLHttpRequest.responseBody

type response =
  { url : string
  ; status : response_status
  ; headers : string Map.Make(String).t
  ; body : responseBody
  }

let query endpoint body =
  let xhr = Web.XMLHttpRequest.create () in
  let setEvent ev cb = ev cb xhr in
  let () = Web.XMLHttpRequest.open_ "POST" ("https://tezrpc.me/api" ^ endpoint) xhr in
  let () = setEvent Web.XMLHttpRequest.set_onload
    ( fun _ev ->
        let open Web.XMLHttpRequest in
        let headers =
          match getAllResponseHeadersAsDict xhr with
          | Error _e -> StringMap.empty
          | Ok headers -> headers in
        let response =
          { status = { code = get_status xhr; message = get_statusText xhr }
          ; headers = headers
          ; url = get_responseURL xhr
          ; body = get_response xhr
          } in
        Js.log response
    ) in
    Web.XMLHttpRequest.send body xhr
    
let blocks () =
  let endpoint = "/blocks/head" in
  query endpoint EmptyBody
