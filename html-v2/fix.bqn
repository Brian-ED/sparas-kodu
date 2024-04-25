r ← •FLines¨ "old"⊸•file.At¨ names←•file.List "old"

r ∾˜⚇2‿∞↩ ⟨"<link rel=""stylesheet"" href=""https://fonts.googleapis.com/css?family=Inter"">"⟩

names "new"⊸•file.At⊸•FLines¨ r

# open all html files in firefox
# link ← "file:///mnt/0AD47A53D47A414D/Users/brian/Persinal/Scripts/JSScripts/sparas-kodu/html-v2/new/"
# (•SH "firefox"⋈link⊸∾)¨∧(".html"≢¯5⊸↑)⊸/ •file.List "old"

