
echo "Enter filename (no extentions)"
read filename
filename="${filename}.html"

echo "Enter blog title"
read title
postTitle="${title}"

echo "Save - CTRL + D"
input_text=$(cat)

formatted_text=""
while IFS= read -r line; do
    formatted_text+="<h3>${line}</h3>\n"
done <<< "$input_text"

formatted_title=""
while IFS= read -r line; do
    formatted_title+="<h1>${line}</h1>\n"
done <<< "$postTitle"



{
    echo "<!DOCTYPE html>"
    echo "<html>"
    echo "<head><link rel=\"icon\" href=\"Dangrain.ico\" type=\"image/x-icon\"><title>${postTitle}</title>"
    echo '<meta property="og:description" content="Dan'\''s incoherent website, where he rambles about opensource stuff and not even he knows what else.">'
    echo '<meta property="og:site_name" content="Redditlike">'
    echo '<meta property="og:image" content="//dangrain.top/Dangrain.jpg">'
    echo "</head>"
    echo "<body>"
    echo -e "$formatted_title"
    echo -e "$formatted_text"
    echo "<a href="Redditlike.HTML">Home</a>"
    echo "</body>"
    echo "</html>"
} > "$filename"
