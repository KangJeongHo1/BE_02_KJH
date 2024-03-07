let secretNumber = Math.floor(Math.random() * 100) +1


function checkguess() {
    const userInput = document.getElementById('user-input').value;
    const hintElement = document.getElementById('hint');

    if (isNaN(userInput) || userInput < 1 || userInput > 100) {
        hintElement.textContent = '1에서 100 사이의 숫자를 입력하세요.';
    } else {
        if (userInput == secretNumber) {
            hintElement.textContent = `축하합니다! 정답은 ${secretNumber}입니다.`;
            hintElement.style.color = 'green';
            document.getElementById('user-input').disabled = true;
        } else if (userInput < secretNumber) {
            hintElement.textContent = 'UP! 더 큰 숫자를 입력하세요.';
            hintElement.style.color = 'red';
        } else {
            hintElement.textContent = 'DOWN! 더 작은 숫자를 입력하세요.';
            hintElement.style.color = 'blue';
        }
    }
}