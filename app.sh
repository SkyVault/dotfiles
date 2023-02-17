#!/bin/bash

# A script for turning commands into launch scripts, scripts that can be used in dmenu

cmd="$1"
name="$2"

echo -e "#!/bin/bash\n$cmd" > "$HOME/Applications/$2"
chmod +x "$HOME/Applications/$2"
