
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

begins ← "<div style=""width: 390px; height: 844px; position: relative; background: #DFFEE6"">"

badIconMedal ← "<div style=""width: 35px; height: 35px; left: 48px; top: 803px; position: absolute"">
    <div style=""width: 35px; height: 17.50px; left: 0px; top: 0px; position: absolute"">
      <div style=""width: 24.47px; height: 19.25px; left: -0.24px; top: -0.88px; position: absolute"">
        <div style=""width: 22.47px; height: 17.50px; left: 23.47px; top: 0.88px; position: absolute; transform: rotate(180deg); transform-origin: 0 0; background: #3B3B3B""></div>
        <div style=""width: 24.47px; height: 19.25px; left: 24.47px; top: 0px; position: absolute; transform: rotate(180deg); transform-origin: 0 0; background: black""></div>
        <div style=""width: 5.50px; height: 7.66px; left: 7.24px; top: 1.31px; position: absolute; transform: rotate(180deg); transform-origin: 0 0; background: black""></div>
        <div style=""width: 9.37px; height: 5.36px; left: 5.96px; top: 1.61px; position: absolute"">
          <div style=""width: 1.25px; height: 1.12px; left: 4.28px; top: 0.14px; position: absolute; background: black""></div>
          <div style=""width: 1.55px; height: 1.39px; left: 1.78px; top: 0.14px; position: absolute; background: black""></div>
          <div style=""width: 1.55px; height: 1.39px; left: 3.72px; top: 2.13px; position: absolute; background: black""></div>
          <div style=""width: 0.78px; height: 0.70px; left: 6.28px; top: 1.53px; position: absolute; background: black""></div>
          <div style=""width: 0.78px; height: 0.70px; left: 2.17px; top: 2.13px; position: absolute; background: black""></div>
          <div style=""width: 0.78px; height: 0.70px; left: 0px; top: 0px; position: absolute; background: black""></div>
          <div style=""width: 0.78px; height: 0.70px; left: 5.89px; top: 3.96px; position: absolute; background: black""></div>
          <div style=""width: 0.78px; height: 0.70px; left: 3.89px; top: 4.31px; position: absolute; background: black""></div>
          <div style=""width: 1.27px; height: 1.13px; left: 7.28px; top: 2.83px; position: absolute; background: black""></div>
          <div style=""width: 0.78px; height: 0.70px; left: 8.59px; top: 4.66px; position: absolute; background: black""></div>
        </div>
      </div>
      <div style=""width: 22.47px; height: 17.50px; left: 11.76px; top: 0px; position: absolute; background: #3B3B3B""></div>
      <div style=""width: 24.47px; height: 19.25px; left: 10.76px; top: -0.88px; position: absolute; background: black""></div>
      <div style=""width: 5.50px; height: 7.66px; left: 18.50px; top: 0.44px; position: absolute; background: black""></div>
    </div>
    <div style=""width: 27px; height: 23.62px; left: 4px; top: 11.38px; position: absolute; justify-content: center; align-items: center; display: inline-flex"">
      <div style=""width: 29px; height: 25.38px; position: relative"">
        <div style=""width: 27px; height: 23.62px; left: 1px; top: 0.88px; position: absolute; background: black""></div>
        <div style=""width: 29px; height: 25.38px; left: 0px; top: 0px; position: absolute; background: black""></div>
        <div style=""width: 13.50px; height: 11.81px; left: 15px; top: 13.12px; position: absolute; transform: rotate(-180deg); transform-origin: 0 0; background: black""></div>
        <div style=""width: 13.50px; height: 11.81px; left: 14px; top: 12.25px; position: absolute; background: black""></div>
        <div style=""width: 20px; height: 17.50px; left: 4.50px; top: 3.94px; position: absolute; background: #484848""></div>
        <div style=""width: 22px; height: 19.25px; left: 3.50px; top: 3.06px; position: absolute; background: black""></div>
        <div style=""width: 10px; height: 8.75px; left: 24px; top: 21px; position: absolute; transform: rotate(-180deg); transform-origin: 0 0; background: black""></div>
        <div style=""width: 10px; height: 8.75px; left: 5px; top: 4.38px; position: absolute; background: black""></div>
      </div>
    </div>
  </div>"

badIconLogo1 ← {
  Context ← "<img style=""width: 400px; height: 399px; left: -5px; top: -57px; position: absolute"" src="""⊸∾∾⟜""" />"
  Context¨ "https://via.placeholder.com/400x399" ‿ "logo.png"
}

badIconLogo2 ← {
  Context ← "<img style=""width: 130px; height: 130px; left: 10px; top: 10px; position: absolute"" src="""⊸∾∾⟜""" />"
  Context¨ "https://via.placeholder.com/130x130" ‿ "logo.png"
}

goodIconMedal ← "<img style=""width: 35px; height: 35px; left: 53px; top: 810px; position: absolute"" src=""Group1167.svg"" />"

map ← ⍉[
  badIconLogo1
  badIconLogo2
  badIconMedal‿goodIconMedal
  ⟨
    "<div class=""Line1Stroke"" style=""width: 10.84px; height: 11.98px; transform: rotate(90deg); transform-origin: 0 0; border: 2px #DFFEE6 solid""></div>"
    "<img style=""left:-1px; top:-2px; width: 23px; height: 23px; position: absolute;"" src=""Done_fill.svg"" />"
  ⟩
  ⟨
    "<div class=""Group1205"" style=""width: 150px; height: 150px; left: 120px; top: 140px; position: absolute"">
    <img class=""Unavngivet110"" style=""width: 130px; height: 130px; left: 10px; top: 10px; position: absolute"" src=""https://via.placeholder.com/130x130"" />
    <div class=""Ellipse1833"" style=""width: 150px; height: 150px; left: 0px; top: 0px; position: absolute; background: #225941; border-radius: 9999px""></div>
  </div>"
    "<img class=""Unavngivet110"" style=""width: 150px; height: 150px; left: 120px; top: 140px; position: absolute"" src=""Group 1206.png"" />"
  ⟩
  ⟨
    "<div class=""ChieldCheckFill"" style=""width: 45px; height: 45px; padding-top: 6.12px; padding-bottom: 8.36px; padding-left: 9.38px; padding-right: 9.38px; left: 303px; top: 54px; position: absolute; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); justify-content: center; align-items: center; display: inline-flex"">
      <img class=""Subtract"" style=""width: 26.25px; height: 30.52px"" src=""https://via.placeholder.com/26x31"" />
    </div>"
    "<div class=""ChieldCheckFill"" style=""width: 45px; height: 45px; left: 303px; top: 54px; position: absolute; justify-content: center; align-items: center; display: inline-flex"">
      <img class=""Subtract"" src=""Chield_check_fill.svg"" />
    </div>"
  ⟩
  ⟨
    "<div class=""HomeFill"" style=""width: 45px; height: 45px; padding-top: 9.28px; padding-bottom: 5.63px; padding-left: 9.38px; padding-right: 9.38px; left: 172px; top: 52px; position: absolute; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); justify-content: center; align-items: center; display: inline-flex"">
      <img class=""Subtract"" style=""width: 26.25px; height: 30.09px"" src=""https://via.placeholder.com/26x30"" />
    </div>"
    "<div class=""HomeFill"" style=""width: 45px; height: 45px; left: 172px; top: 52px; position: absolute; justify-content: center; align-items: center; display: inline-flex"">
      <img class=""Subtract"" src=""Home_fill.svg"" />
    </div>"
  ⟩
  ⟨
    "<div style=""width: 45px; height: 45px; padding: 5px; left: 172px; top: 795px; position: absolute; justify-content: center; align-items: center; display: inline-flex"">
    <div style=""width: 35px; height: 35px; position: relative"">
      <div style=""width: 35px; height: 35px; left: 0px; top: 0px; position: absolute; background: black; border-radius: 9999px""></div>
      <div style=""width: 13px; height: 23px; left: 11px; top: 6px; position: absolute; color: black; font-size: 20px; font-family: Inter; font-weight: 900; word-wrap: break-word"">$</div>
    </div>"
    "<img style=""width: 45px; height: 45px; left: 183px; top: 801px; position: absolute"" src=""Group 1198.svg"" />"
  ⟩
] ∾ { # badCheckIcons
  BadContext ← "<div style=""width: 20px; height: 20px; padding-top: 4.47px; padding-bottom: 4.69px; padding-left: 3.67px; padding-right: 4.36px; left: 59px; top: "⊸∾∾⟜"px; position: absolute; justify-content: center; align-items: center; display: inline-flex"">
    <div style=""width: 10.84px; height: 11.98px; transform: rotate(90deg); transform-origin: 0 0; border: 2px #DFFEE6 solid""></div>
  </div>"
  GoodContext ← "<img style=""width: 20px; height: 20px; left: 59px; top: "⊸∾∾⟜"px; position: absolute"" src=""Done_fill.svg"" />"
  (BadContext⋈GoodContext)∘⊑˘•Repr¨562‿510‿536
}

r ← map ReplaceAll •FChars "old.html"

r (¯1+`≠↑begins⊸⍷)⊸⊔↩

r ∾¨˜ ↩ <"<!DOCTYPE html>
<head>
  <link rel=""stylesheet"" href=""https://fonts.googleapis.com/css?family=Inter"">
  <script>
    /*to prevent Firefox FOUC, this must be here*/
    let FF_FOUC_FIX;
  </script>
</head>
"

r•FChars˜¨("new"•file.At".html"∾˜•Repr)¨↕≠r

# open all html files in firefox
# link ← "file:///mnt/0AD47A53D47A414D/Users/brian/Persinal/Scripts/JSScripts/sparas-kodu/html-v2/new/"
# (•SH "firefox"⋈link⊸∾)¨∧(".html"≢¯5⊸↑)⊸/ •file.List "old"

