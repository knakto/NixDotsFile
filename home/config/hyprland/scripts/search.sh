#!/home/knakto/.nix-profile/bin/bash

input=$(fuzzel -d --lines 0)

declare -A BOOKMARKS=(
    ["yt"]="https://www.youtube.com/"
    ["gh"]="https://github.com/"
    ["wk"]="https://en.wikipedia.org/wiki/"
    ["map"]="https://maps.google.com/"
	["gm"]="https://gemini.google.com"
	["c"]="https://chatgpt.com/"
    # Add more bookmarks here: ["name"]="url_or_domain"
)

# Split the input into a potential command/bookmark and the rest of the query
# Example: "yt best songs" -> command="yt", query="best songs"
# Example: "youtube.com" -> command="youtube.com", query=""
# Example: "https://example.com" -> command="https://example.com", query=""
IFS=' ' read -r command query <<< "$input"

url=""

# --- 2. Check for Bookmark Match ---
if [[ -v BOOKMARKS["$command"] ]]; then
    base_url="${BOOKMARKS["$command"]}"
    
    if [ -z "$query" ]; then
        # Case 1: Bookmark used with no query (e.g., just "yt")
        url="$base_url"
    else
        # Case 2: Bookmark used with a query (e.g., "yt best songs")
        # If the base_url ends with a slash, we append the query for searching/lookup.
        if [[ "$base_url" == */ ]]; then
            # Append the query to the URL, using '+' instead of spaces
            # This is standard for search-type bookmarks (like Wikipedia lookup)
            url="${base_url}$(echo "$query" | tr ' ' '+')"
        else
            # If the URL is fixed (like a homepage), just open the base URL
            url="$base_url"
        fi
    fi

# --- 3. Check for URL/Domain ---
elif [[ "$input" =~ ^https?:// ]] || [[ "$input" =~ \.[a-z]{2,}$ ]]; then
    # Direct URL or domain entry (e.g., "https://example.com" or "example.com")
    
    if [[ "$input" =~ ^https?:// ]]; then
        url="$input"
    else
        url="https://$input"
    fi

# --- 4. Default to Google Search ---
else
    # Everything else is a general search query
    url="https://www.google.com/search?q=$input"
fi

# Open the determined URL in Firefox
firefox $new "$url" &
#
# if [ -z "$input" ]; then
# 	exit
# fi
#
# if [ -z "$1" ]; then
# 	new=""
# else
# 	new="-new-window"
# fi
#
# if [[ "$input" =~ ^https?:// ]] || [[ "$input" =~ \.[a-z]{2,}$ ]]; then
#     if [[ "$input" =~ ^https?:// ]]; then
#         url="$input"
#     else
#         url="https://$input"
#     fi
# 	firefox $new "$url" &
# else
#     firefox $new "https://www.google.com/search?q=$input" &
# fi

#
# # ถ้า query ไม่ว่าง
# if [ -n "$query" ]; then
#     # เปิด browser search
#     # firefox "https://www.google.com/search?q=$query" &
# 	firefox "https://www.$query" &
# fi
