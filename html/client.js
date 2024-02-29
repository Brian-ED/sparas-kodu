function getCurrentMoney(){
  fetch("http://www.brian-e.online:3000/")
  .then((response) => response.json())
  .then((json) => money=json.data.userAcc);
}

let sessionStorage = window.sessionStorage

// Get saved data from sessionStorage
function getTimesPressed() {
  let data = sessionStorage.getItem("timesPressed");
  if (data == null) data = "0"
  return Number(data)
}
// Save data to sessionStorage
function add1TimesPressed() {
  amount = getTimesPressed()
  sessionStorage.setItem("timesPressed", amount+1);
  return amount+1
}

function moveServerMoney(amount) {
  fetch("http://www.brian-e.online:3000/", {
    method: "POST",
    mode: "cors",
    body: `{\"moved\":${amount}}`,
    headers: {}
  });
}

function setText() {
  // console.log(money)
  let dispMoney = Math.round(money%500)
  krtxt.textContent = `${dispMoney}kr`
  progressBar[0].style = `width: ${Math.ceil(dispMoney*0.60)}px;`
}
function onButtonClick() {
  money += amountPerClick
  add1TimesPressed()
  setText()
  moveServerMoney(amountPerClick)
}

let progressBar = document.getElementsByClassName("rectangle-2")
let krtxt = document.getElementById("krtxt");
let max = 500
let money = 20 *getTimesPressed()
let amountPerClick = 20
setText()

const button = document.querySelector('button');
button.addEventListener('click', onButtonClick);