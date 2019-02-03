var info = {
  nombre: "jesus",
  appe: "sadasdas",
  p: null,
  q: null,
  user: {}
}
var metodos = {
  showAll(){
    fetch('https://jsonplaceholder.typicode.com/todos/1')
    .then(response => {
      return response.json()
    })
    .then(json => {
      info.user = json
      info.p.innerText = info.user.id
      info.q[0].innerText = info.user.title
      info.q[1].innerText = info.user.userId
    })
  }
}
$(document).ready(function(){
  info.p = document.getElementById('ejemplo')
  info.q = document.getElementsByClassName('ejemplo')
  metodos.showAll()
})