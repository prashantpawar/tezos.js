open Tezos

let v = Js_promise.resolve "x"

let main =
  let output = Rpc.blocks () in
  let key = Crypto.generateKeyNoSeed () in
  (output, key)

let () =
  Crypto.ready 
  |> Js_promise.then_ (fun _ ->
      Js_promise.resolve (Js.log main)
    )
  |> ignore
