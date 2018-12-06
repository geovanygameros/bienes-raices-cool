function setPropertiesHeight(){
    var screenHeight = window.innerHeight;
    var searchHeight = document.getElementById("properties-search-form").offsetHeight;
    document.getElementById("properties-wrapper").style.maxHeight = screenHeight-searchHeight-180 + "px";
}