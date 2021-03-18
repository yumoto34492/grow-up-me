function show (){
  const delOpen = document.getElementById("modalOpen")
  delOpen.addEventListener("click", function() {
    document.getElementById("modal").classList.add("active");
    document.getElementById("mask").classList.add("active");
  });
  const delClose = document.getElementById("modalClose")
  delClose.addEventListener("click", function() {
    document.getElementById("modal").classList.remove("active");
    document.getElementById("mask").classList.remove("active");
  });
  const maskClose = document.getElementById("mask")
  maskClose.addEventListener("click", function() {
    document.getElementById("modal").classList.remove("active");
    document.getElementById("mask").classList.remove("active");
  });
}
window.addEventListener('load', show);
