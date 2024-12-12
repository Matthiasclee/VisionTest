let selectedvideo=1
let selectedvideomax=3

function svup(){
  if (selectedvideo == 1){
    document.getElementById(1).classList.remove("selected") 
    document.getElementById(selectedvideomax).classList.add("selected") 
    selectedvideo = selectedvideomax
  } else {
    selectedvideo = selectedvideo - 1
    document.getElementById(selectedvideo+1).classList.remove("selected") 
    document.getElementById(selectedvideo).classList.add("selected") 
  }
}

function svdown(){
  if (selectedvideo == selectedvideomax){
    document.getElementById(selectedvideomax).classList.remove("selected") 
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

function start_video_playback(){
  video = document.getElementById("videofeed")
  video_name = location.href.split("#")[1] 

  video.src = `videos/${video_name}`
  video.play()
}

function toggle_playback(){
  video = document.getElementById("videofeed")

  if (video.paused) {
    video.play()
  } else {
    video.pause()
  }
}

function skip_back(){
  video = document.getElementById("videofeed")
  video.currentTime -= 10
}

function skip_ahead(){
  video = document.getElementById("videofeed")
  video.currentTime += 10
}
