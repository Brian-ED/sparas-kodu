⟨Get,Post⟩ ← •Import "bqn-curl/curl.bqn"

httpbinURL←"https://212.55.42.148:3000/"

r←⟨⟩ Get httpbinURL∾"/get"
code‿headers‿content‿time‿redirectcount←r
•SHow¨ code‿headers‿content‿time‿redirectcount
! 200=r.code
! 0=r.redirectCount
! 1=⊑"HTTP/"⍷r.headers
! 1=+´"Content-Type: "⍷r.headers
! 1=+´"Content-Length: "⍷r.headers
! 1=+´"""Host"": ""localhost:3000"""⍷r.content
! 1=+´"""User-Agent"": ""curl/bqn"""⍷r.content
! 0=+´"""Hello"": ""World"""⍷r.content

•SHow 1+1