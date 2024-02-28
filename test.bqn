⟨Get,Post⟩ ← •Import "bqn-curl/curl.bqn"
rg ← •Import "../rayed-bqn/ffi/raygui.bqn"

httpbinURL←"http://localhost:3000"

r←⟨
  "Content-Type: application/json"
⟩ Get httpbinURL∾"/get/test"

code‿headers‿content‿time‿redirectcount←r
! 200=r.code
! 0=r.redirectCount
! 1=⊑"HTTP/"⍷r.headers
! 1=+´"Content-Type: "⍷r.headers
! 1=+´"Content-Length: "⍷r.headers
! 1=+´"""Host"": ""localhost:3000"""⍷r.content
! 1=+´"""User-Agent"": ""curl/bqn"""⍷r.content
! 0=+´"""Hello"": ""World"""⍷r.content

•SHow¨ code‿headers‿content‿time‿redirectcount
