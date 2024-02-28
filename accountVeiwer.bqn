home ← "/home/brian/"
#home ↩ "/mnt/0AD47A53D47A414D/Users/brian/Persinal/Scripts/BQN/"
⟨rf⇐rayffi⋄draw⋄window⋄color⟩ ← r ← •Import home•file.At"rayed-bqn/raylib.bqn"
json ← •Import home•file.At"rayed-bqn/src/imports/bqn-libs/json.bqn"
⟨Get,Post⟩ ← •Import "bqn-curl/curl.bqn"
⟨httpURL⋄delay⇐dataRefreshRate⟩ ← •Import "settings.bqn"

window.Setsize 0.5
window.Open "veiwer"
window.SetPos 2‿∞÷˜r.monitor.Size@

{𝕊frame‿text:
  textNew ← {𝕤
    code‿content←⟨
      "Content-Type: application/json"
    ⟩ Get httpURL∾"/get"
    code≡200?
    '{'∾'}'∾˜content
    ;𝕩
  }⎊⊢⍟(0=(⌈60×delay)|frame)text

  {
    rf.DrawText⟨𝕨⋄0⋄𝕩⋄20⋄color.darkgreen⟩ # text posX posY fontSize color                                     # Draw text (using default font)
  }¨⟜(20×↕∘≠)(@+10) ((⊢-˜+`×¬)∘=⊔⊢) (@+13)⊸≠⊸/textNew

  ⟨1+frame⋄textNew⟩
} draw._withCanvas_ color.lightgreen •_while_ {
  𝕊:¬window.ShouldClose@
} 0‿""

window.Close@