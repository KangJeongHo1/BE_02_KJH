let currentInput = ``           //현재 입력된 숫자 저장
let currentOperator = null      //현재 입력된 연산자 저장
let previousInput = null        //이전에 입력한 숫자 저장

function appendNum(number){     //숫자 버튼을 클릭할 때 cerrentInput에 추가한 뒤 화면에 업데이트
    currentInput += number
    updateDisplay()
}

function setOperator(operator){             //현재까지 입력된 숫자와 연산자를 저장하고 currentInput을 초기화
    if(currentOperator !== null){
        calculate()
    }
    currentOperator = operator
    previousInput = currentInput
    currentInput = ``
    updateDisplay()
}

function calculate(){
    if (currentOperator !== null && previousInput !== null && currentInput !== ``){
        const num1 = parseInt(previousInput)
        const num2 = parseInt(currentInput)
        switch(currentOperator){
            case '+':
                currentInput = num1 + num2
                break
            case '-':
                currentInput = num1 - num2
                break
            case '*':
                currentInput = num1 * num2
                break
            case '/':
                currentInput = num1 / num2
                break
            }
            currentOperator = null
            previousInput = null
            updateDisplay()
        }
}

function clear(){
    currentInput = ``
    currentOperator = null
    previousInput = null
    updateDisplay()
}

function updateDisplay() {
    document.getElementById('result').innerText = `${previousInput || ''} ${currentOperator || ''} ${currentInput || ''}`;
}

document.getElementById('btn7')
.addEventListener('click', function(){appendNum('7'); })

document.getElementById('btn8')
.addEventListener('click', function(){appendNum('8'); })

document.getElementById('btn9')
.addEventListener('click', function(){appendNum('9'); })

document.getElementById('btn*')
.addEventListener('click', function(){setOperator('*'); })

document.getElementById('btn4')
.addEventListener('click', function(){appendNum('4'); })

document.getElementById('btn5')
.addEventListener('click', function(){appendNum('5'); })

document.getElementById('btn6')
.addEventListener('click', function(){appendNum('6'); })

document.getElementById('btn/')
.addEventListener('click', function(){setOperator('/'); })

document.getElementById('btn1')
.addEventListener('click', function(){appendNum('1'); })

document.getElementById('btn2')
.addEventListener('click', function(){appendNum('2'); })

document.getElementById('btn3')
.addEventListener('click', function(){appendNum('3'); })

document.getElementById('btn-')
.addEventListener('click', function(){setOperator('-'); })

document.getElementById('btnC')
.addEventListener('click', clear)

document.getElementById('btn0')
.addEventListener('click', function(){appendNum('0'); })

document.getElementById('btn+')
.addEventListener('click', function(){setOperator('+')})

document.getElementById('btn=')
.addEventListener('click', calculate)
