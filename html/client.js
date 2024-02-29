function getCurrentMoney(){
  fetch("http://192.168.1.161:3000/")
  .then((response) => response.json())
  .then((json) => money=json.data.userAcc);
}



// fetch("https://bar.other/doc", {
//   method: "POST",
//   mode: "cors",
//   headers: {
//     "Content-Type": "text/xml",
//     "X-PINGOTHER": "pingpong",
//   },
//   body: "<person><name>Arun</name></person>",
// });


function moveServerMoney(amount) {
  fetch("http://192.168.1.161:3000/", {
    method: "POST",
    mode: "cors",
    body: `{\"moved\":${amount}}`,
    headers: {
//      "X-PINGOTHER": "pingpong",
    },
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