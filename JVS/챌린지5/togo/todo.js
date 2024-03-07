const todoList = document.getElementById("todo-list")
const todoForm = document.getElementById("todo-form")
let todoArr = []


//할일 수정하기
function handleTodoItem(cilckedId){
    todoArr = todoArr.map(function(aTodo){
        if(aTodo.todoId === cilckedId){
            return {
                ...aTodo, tododone: !aTodo.tododone
            }
        } else{
            return aTodo
        }
    })
    displayTodo()
    saveTodos()
}

//로컬 저장소에 저장하기
function saveTodos(){
    const todoStr = JSON.stringify(todoArr)
    localStorage.setItem("myTodos", todoStr)
}

//로컬 저장소에서 가져오기
function loadTodos(){
    const myTodos = localStorage.getItem("myTodos")
    if(myTodos !== null){
        todoArr = JSON.parse(myTodos)
        displayTodo()
    }
}
loadTodos()



//할일 삭제하기
function hadleTodoDel(cilckedId){
    todoArr = todoArr.filter(function(aTodo){
        return aTodo.todoId !== cilckedId
    })
    displayTodo()
    saveTodos()
}


//할일 보여주기
function displayTodo(){
    todoList.innerHTML = ""
    todoArr.forEach(function(aTodo){
        const todoItem = document.createElement("li")
        const todoDel = document.createElement("span")
        todoDel.textContent = "x"
        todoItem.textContent = aTodo.todoText
        todoItem.title = "클릭하면 완료됨"
        if(aTodo.tododone){
            todoItem.classList.add("done")
        } else{
            todoItem.classList.add("yet")
        }
        todoDel.title = "클릭하면 삭제됨"

        todoItem.addEventListener("click", function(){
            handleTodoItem(aTodo.todoId)
        })

        todoDel.addEventListener("click", function(){
            hadleTodoDel(aTodo.todoId)
        })
        
        todoItem.appendChild(todoDel)
        todoList.appendChild(todoItem)
    })
}


//할일 추가하기
todoForm.addEventListener("submit", function(e){
    e.preventDefault()
    const tobeAdd = {
        todoText : todoForm.todo.value,
        todoId : new Date().getTime(),
        todoDone : false
    }
    todoForm.todo.value = ""
    todoArr.push(tobeAdd)
    displayTodo()
    saveTodos()
})

