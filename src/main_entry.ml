open Tezos

let () =
  Js.log "Start";
  let output = blocks () in
  Js.log (output);
