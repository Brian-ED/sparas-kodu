function getCurrentMoney(){
  a = fetch("http://www.brian-e.online:3000/")
  b = a.then((response) => response.json())
  b.then((json) => {
    userMoney    = json.data.userAcc
    savingsMoney = json.data.savingsAcc
    setText()
  });
}

function setText() {
  let dispUserMoney    = Math.round(userMoney*100)/100
  let dispSavingsMoney = Math.round(savingsMoney*100)/100
  userAccEl   .textContent = `${dispUserMoney}kr`
  savingsAccEl.textContent = `${dispSavingsMoney}kr`
}
let userAccEl    = document.getElementById("userAcc");
let savingsAccEl = document.getElementById("savingAcc");
let max          = 500
let userMoney    = 0
let savingsMoney = 0
let amountPerClick = 20

getCurrentMoney()

let intervalID = window.setInterval(getCurrentMoney, 500);