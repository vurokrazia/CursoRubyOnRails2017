$(document).ready(function () {
  var p = document.getElementById("ejemplo")
  p.innerText = 0
  p.addEventListener("click", function () {
    enviarTexto()
  })
})

function enviarTexto() {
  var p = document.getElementById("ejemplo")
  var temporal_n = parseInt(p.innerText)
  p.innerText = temporal_n + 1
}