let selectedvideo=1

function up(){
  if (selectedvideo == 1){
    document.getElementById(1).classList.remove("selected") 
    document.getElementById(3).classList.add("selected") 
    selectedvideo = 3
  } else {
    selectedvideo = selectedvideo - 1
    document.getElementById(selectedvideo+1).classList.remove("selected") 
    document.getElementById(selectedvideo).classList.add("selected") 
  }
}

function down(){
  if (selectedvideo == 3){
    document.getElementById(3).classList.remove("selected") 
    document.getElementById(1).classList.add("selected") 
    selectedvideo = 1
  } else {
    selectedvideo = selectedvideo + 1
    document.getElementById(selectedvideo-1).classList.remove("selected") 
    document.getElementById(selectedvideo).classList.add("selected") 
  }
}

function getSelectedVideo(){
  return selectedvideo
}
