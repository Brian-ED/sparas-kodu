
# Replace each instance of a string in old with the corresponding
# string in new.
# Instances are non-overlapping, and earlier ones take precedence.
ReplaceAll ← { [old,new] 𝕊 str:
  l ← ≠old
  "ReplaceAll: Can't replace empty" ! ∧´0<≠¨old
  match ← 1-˜ (l+1)|⌊´ (↕⊸-l) × old (1<≠∘⊣)◶⟨⊑⊸=,≠∘⊢↑⍷⟩¨ <str
  cont ← (-⟜1⌈≤⟜1×⊢)` match ⊏ (≠¨old)∾0
  keep ← ⋈⟜(⊏⟜str) / 0=cont
  insert ← (new⊏˜⊏⟜match)⊸(≠¨⊸/⋈∾∘⊣) / (0⊸<∧»⊸≤) cont
  ⍋⊸⊏´ keep ∾¨ insert
}


r ← •FChars¨ "old"⊸•file.At¨ names←•file.List "old"

map ← ⍉[
  "https://via.placeholder.com/400x399"‿"logo.png"
  "https://via.placeholder.com/130x130"‿"logo.png"
]
r ReplaceAll¨˜ ↩ <map

r ∾¨˜ ↩ <"<link rel=""stylesheet"" href=""https://fonts.googleapis.com/css?family=Inter"">"

names "new"⊸•file.At⊸•FChars¨ r

# open all html files in firefox
# link ← "file:///mnt/0AD47A53D47A414D/Users/brian/Persinal/Scripts/JSScripts/sparas-kodu/html-v2/new/"
# (•SH "firefox"⋈link⊸∾)¨∧(".html"≢¯5⊸↑)⊸/ •file.List "old"

