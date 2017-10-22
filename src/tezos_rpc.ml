open Node
    
let blocks () =
  let endpoint = "/blocks/head" in
  query endpoint EmptyBody

let getBalance pkh =
  let endpoint = "/blocks/prevalidation/proto/context/contracts/" ^ pkh ^ "/balance" in
  query endpoint EmptyBody
