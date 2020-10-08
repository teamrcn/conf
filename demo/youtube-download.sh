base_url="https://www.youtube.com/user/abcd/"

# youtube-dl -g $base_url
#quality_flags="-f bestvideo[height=1080]+bestaudio --merge-output-format mkv"
quality_flags="-f bestvideo"
youtube-dl $quality_flags --ignore-errors --write-auto-sub -o 'youtube.com/%(upload_date)s_%(duration)s_%(title)s_%(id)s.%(ext)s' $base_url
