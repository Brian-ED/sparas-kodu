function getCurrentMoney(){
  a = fetch("http://192.168.1.161:3000/")
  console.log(a)
  b = a.then((response) => {console.log(response);return response.json()})
  console.log(b)
  c = b.then((json) => {
    console.log(json)
    userMoney    = json.data.userAcc
    savingsMoney = json.data.savingsAcc
    setText()
  });
  console.log(c)
}

function setText() {
  let dispUserMoney    = Math.round(userMoney*100)/100
  let dispSavingsMoney = Math.round(savingsMoney*100)/100
  console.log(userMoney)
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