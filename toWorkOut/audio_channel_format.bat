ffprobe -v error -select_streams a:0 -show_entries stream=channel_layout -of csv=s=x:p=0 <input.mp4>