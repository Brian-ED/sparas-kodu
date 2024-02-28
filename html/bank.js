function getCurrentMoney(){
  fetch("http://192.168.1.57:3000/", {
    method: "GET",
    mode: "cors",
    headers: {
      host: '192.168.1.57:3000',
      'user-agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0',
      accept: '*/*',
      'accept-language': 'en-GB,en;q=0.5',
      'accept-encoding': 'gzip, deflate',
      referer: 'http://brian-e.online/',
      'content-type': 'application/json',
      origin: 'http://brian-e.online',
      dnt: '1',
      connection: 'keep-alive'
    }
  })
  .then((response) => response.json())
  .then((json) => {
    console.log(json.data.userAcc)
    userMoney    = json.data.userAcc
    savingsMoney = json.data.savingsAcc
    setText()
  });
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