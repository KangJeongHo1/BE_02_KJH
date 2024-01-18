//제출 이벤트 받기 (이벤트 핸들링)

//제출된 입력 값들을 참조

//입력값에 문제가 있는 경우 감지한다.

//가입환영 인사

const form = document.getElementById("form")

form.addEventListener("submit", function(event){
    event.preventDefault() //기존 기능 차단 (새로고침)

    let userId = event.target.id.value
    let userPw1 = event.target.pw1.value
    let userPw2 = event.target.pw2.value
    let userName = event.target.name.value
    let userPhone = event.target.phone.value
    let userPosition = event.target.position.value
    let userGender = event.target.gender.value
    let userEmail = event.target.email.value
    let userIntro = event.target.intro.value


    if(userId.length < 6){
        alert("아이디가 너무 짧습니다. 6자이상 입력해주세요.")
        return
    }

    if(userPw1 !== userPw2){
        alert("비밀번호가 일치하지 않습니다.")
        return
    }

    //가입이 잘 되었습니다 환영합니다.
    document.body.innerHTML = ""
    document.write(`<h1>${userName}님 환영합니다.</h1>`)
    document.write("<h2>회원가입시 입력한 내용은 다음과 같습니다.</h2>")
    
    document.write(`<ul>
                        <li>아이디 : ${userId}</li>
                        <li>이름 : ${userName}</li>
                        <li>전화번호 : ${userPhone}</li>
                        <li>원하는 직무 : ${userPosition}</li>
                    </ul>`)
})