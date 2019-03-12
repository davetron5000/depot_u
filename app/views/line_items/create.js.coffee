cart = document.getElementById("cart")
cart.innerHTML = "<%= j render(@cart) %>"

# START_HIGHLIGHT
notice = document.getElementById("notice")
if notice
  notice.style.display = "none"
# END_HIGHLIGHT
