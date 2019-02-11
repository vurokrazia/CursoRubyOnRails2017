var datos = {
  token: document.getElementsByName('csrf-token')[0].content,
  product: null,
  btn: null,
  message: "",
  cart: null,
  status: 0,
  response: null,
  element: null,
  total: null
}
var actions = {
  addCart (e){
    datos.product = e.getAttribute("product");
    datos.btn = e;
    fetch('/my_shopping_carts/',
      {
        method: 'POST',
        headers: {           
          'X-CSRF-Token': datos.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
          JSON.stringify(
            {
              "product_id":datos.product
            }
          )
      }
    )
    .then( response => {
      datos.status = response.clone().status
      return response.json()
    })
    .then( response => {
      datos.response = response 
      if(datos.status == 200){
        document.getElementById('mycart').textContent = response.cart;
        ap_accions.toast_alert("success", datos.response.response, 2000)
      } else {
        ap_accions.toast_alert("error", response.products[0] , 2000)
      }
    })
    .catch(console.log)
  },
  addFav (e){
    datos.product = e.getAttribute("product");
    datos.btn = e;
    fetch('/favorites/',
      {
        method: 'POST',
        headers:{
          'X-CSRF-Token': datos.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(
          {
            "product_id":datos.product 
          }
        )
      },
    ).then( result => {
      datos.status = result.clone().status // 200 o 400
      return result.json()
    })
    .then( result => {
      datos.result = result 
      if(datos.status == 200){
        ap_accions.toast_alert("success", datos.result.response, 2000)
      } else {
        ap_accions.toast_alert("error", result.favorites[0], 2000)
      }
    })
    .catch(console.log)
  },
  deleteItem(e,fila){
    
  },
  deleteFavorite(e,fila){
    datos.product = parseInt(e.getAttribute("product"))
    datos.element = document.getElementById("p_" + fila)
    fetch('/favorites/' + fila,
      {
        method: 'DELETE',
        headers: {           
          'X-CSRF-Token': datos.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      }
    )
    .then( response => {
      datos.status = response.clone().status
      return response.json()
    })
    .then( result => {
      if(datos.status == 200){
        ap_accions.toast_alert("success", result.response, 1000)
        datos.element.style.display = "none"
      } else {
        alert(result.products[0])
        ap_accions.toast_alert("error", result.products[0], 1000)
      }
    })
    .catch(console.log)
  }
}

$(document).ready(function(){
  datos.cart = parseInt(document.getElementById('mycart').textContent)  
})