const button = document.getElementById("checked");
const p = document.getElementById("resultAns");
const input = document.getElementById("choice");

button.addEventListener("click", playGame);

function playGame(){
    const userChoice = input.value;
    const computerChoice = getComputerChoice();
    const result = Winner(userChoice, computerChoice);
    displayResult(result, computerChoice, userChoice);
}

function getComputerChoice(){
    const choices = ["가위", "바위", "보"];
    const random = Math.floor(Math.random() * 3);
    return choices[random];
}

function Winner(user, computer){
    if(user === computer){
        return "비겼습니다.";
    } else if((user === "가위" && computer ==="보") 
    || (user === "바위" && computer === "가위") 
    || (user === "보" && computer === "주먹")){
        return "이겼습니다.";
    } else{
        return "졌습니다.";
    }
}

function displayResult(result, computerChoice, userChoice){
    p.textContent = `당신의 선택 : ${userChoice}/ 컴퓨터의 선택 : ${computerChoice}/ 결과 : ${result}`;
}
