home ← "/home/brian/"
#home ↩ "/mnt/0AD47A53D47A414D/Users/brian/Persinal/Scripts/BQN/"
⟨rf⇐rayffi⋄draw⋄window⋄color⋄key⟩ ← r ← •Import home•file.At"rayed-bqn/raylib.bqn"
rg ← •Import home•file.At"rayed-bqn/ffi/raygui.bqn"
json ← •Import home•file.At"rayed-bqn/src/imports/bqn-libs/json.bqn"
⟨Get,Post⟩ ← •Import "bqn-curl/curl.bqn"
⟨httpURL⋄delay⇐dataRefreshRate⟩ ← •Import "settings.bqn"
⟨
  guiControl
  guiControlProperty
  guiScrollBarProperty
  guiSliderProperty
  guiListViewProperty
⟩ ← rg

panelContentRec ← 0‿0‿340‿340
panelView       ← 4⥊0
panelScroll     ← 99‿¯20‿0‿0

drawState ← { # Draw and process scroll bar style edition controls
  scrollbarSide  ⇐ 0
}


x‿y‿width‿height ← ↕4 # indecies of rectangle
panelRec ← 20‿40‿200‿150

kr ← 20

# Draw and process scroll bar style edition controls
DrawStyleEditControls ← {𝕊⟨·⟩:
  # ScrollPanel style controls
  #----------------------------------------------------------
  ·‿⟨scrolled⟩ ← rg.GuiToggleRef⟨560‿110‿200‿35, " kr"∾˜•Repr 20, ⋈0⟩
  ⟨scrolled⟩
}


PerFrame ← {𝕊frame‿text‿bal‿panelScroll‿panelView‿drawState:
  newBal ← bal+key.IsPressed 'H'
  •term.Flush@
  textNew ← {𝕤
    code‿content← ⟨
      "Content-Type: application/json"
    ⟩ Post ⟨
      httpURL∾"/get"
      •Repr newBal
    ⟩
    !code≡200
    {"data"‿x:{[⟨"test"⟩⋄⟨s⟩]:s;!𝕩}x}2⊏˘json.Parse '{'∾content∾'}'
  }⍟(0=(⌈60×delay)|frame)text

  {𝕤
    rf.DrawText⟨𝕨⋄30⋄30+𝕩⋄30⋄color.darkgreen⟩ # text posX posY fontSize color                                     # Draw text (using default font)
  }¨⟜(30×↕∘≠)(@+10) ((⊢-˜+`×¬)∘=⊔⊢) (@+13)⊸≠⊸/textNew

  rf.DrawText⟨{𝕊a‿b:a∾", "∾b}'-'⍟('¯'⊸=)¨∘•Repr¨ 2↑panelScroll, 4, 4, 20, color.red⟩

  {𝕤
    rg.GuiGridRef⟨(panelRec+○(2⊸↑)panelScroll)∾2↓panelContentRec, "", 16, 3, ⋈0‿0⟩
  } draw._withinRectangle +`2‿2⥊panelView


  newDrawState ← DrawStyleEditControls drawState

  ⟨1+frame⋄textNew⋄newBal⋄panelScroll⋄panelView⋄newDrawState⟩
} draw._withCanvas_ color.lightgreen

window.Setsize 0.5
window.Open "user"
window.SetPos 2÷˜r.monitor.Size@
rg.GuiSetStyle ⟨guiControl.default⋄guiControlProperty.borderWidth⋄2⟩
PerFrame •_While_(¬window.ShouldClose) 0‿""‿0‿panelScroll‿panelView‿drawState
window.Close@