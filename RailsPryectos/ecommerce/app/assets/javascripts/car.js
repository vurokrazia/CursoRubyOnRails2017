var data = {
  product: null,
  btn: null
}
var actions = {
  addCar (e){
    data.product = e;
    data.btn = e;
    data.btn.classList.add('hidden-card');
  },
  addFav (e){
    data.product = e;
    data.btn = e;
    data.btn.classList.add('hidden-card');
  }
}
$(document).ready(function(){
  if( document.getElementById('has_tool_id') != null ){
    
  }
});