function getCurrentMoney(){
  fetch("http://localhost:3000/", {
    method: "GET",
    headers: {
      "Content-type": "application/json"
    }
  })
  .then((response) => response.json())
  .then((json) => {money=json.data.userAcc});
}

function moveServerMoney(amount) {
  fetch("http://localhost:3000/", {
    method: "POST",
    body: `${amount}`,
    headers: {
      "Content-type": "application/json"
    }
  });
}

function setText() {
  console.log(money)
  let dispMoney = Math.round(money%500)
  krtxt.textContent = `${dispMoney}kr`
  progressBar[0].style = `width: ${Math.ceil(dispMoney*0.60)}px;`
}
function onButtonClick() {
  money += amountPerClick
  setText()
  moveServerMoney(amountPerClick)
}

let progressBar = document.getElementsByClassName("rectangle-2")
let krtxt = document.getElementById("krtxt");
let max = 500
let money = 0
let amountPerClick = 20
setText()

const button = document.querySelector('button');
button.addEventListener('click', onButtonClick);