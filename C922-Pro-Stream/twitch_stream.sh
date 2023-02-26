CAM_RES="1920x1080"   # camera resolution
VIDEO_RES="1920x1080" # stream resolution
FPS="30"              # target FPS
GOP="60"              # i-frame interval, should be double of FPS,
GOPMIN="30"           # min i-frame interval, should be equal to fps,
THREADS="8"           # max 6
CBR="3000k"           # constant bitrate (should be between 1000k - 3000k)
QUALITY="ultrafast"   # one of the many FFMPEG preset
AUDIO_RATE="44100"
STREAM_KEY="$1"
SERVER="prg03"  # https://stream.twitch.tv/ingests/

ffmpeg -f v4l2 -s "$CAM_RES" -r "$FPS" -i /dev/video0 \
  -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
  -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR \
  -pix_fmt yuv420p -s $VIDEO_RES -preset $QUALITY -tune film -acodec libmp3lame \
  -threads $THREADS -strict normal -bufsize $CBR \
  "rtmp://${SERVER}.contribute.live-video.net/app/$STREAM_KEY"
