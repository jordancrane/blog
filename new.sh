function newmicropost() {
    local year=`date +%Y`
    local month=`date +%m`
    local day=`date +%d`
    local time=`date +%H%M%S`
    local file="microposts/${year}/${month}/${day}/${time}.md"

    vim `hugo new ${file} | cut -d ' ' -f 1`
}

# $1 The name of the file to create
function newpost() {
    local year=`date +%Y`
    local month=`date +%m`
    local day=`date +%d`
    local time=`date +%H%M%S`
    local file="posts/${year}/${month}/${day}/${time}.md"

    vim `hugo new ${file} | cut -d ' ' -f 1`
}

# $1 The name of the file to create
function newphotopost() {
  local year=`date +%Y`
  local month=`date +%m`
  local day=`date +%d`
  local time=`date +%H%M%S`
  local file="photos/${year}/${month}/${day}/${time}.md"

	vim `hugo new ${file} | cut -d ' ' -f 1`
}
