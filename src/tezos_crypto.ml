(* Externally declaring libsodium *)
(*type sodium*)
(*external sodium : sodium = "libsodium-wrappers" [@@bs.module]*)

type keypair = 
  { publicKey : string
  ; privateKey : string
  }
external crypto_sign_keypair : unit -> keypair = "crypto_sign_keypair" [@@bs.module "libsodium-wrappers", "sodium"]

type sodium
external sodium : sodium = "libsodium-wrappers" [@@bs.module]

external ready : string Js_promise.t = "ready" [@@bs.module "libsodium-wrappers"]

let generateKeyNoSeed = 
  crypto_sign_keypair

let ready =
  ready
