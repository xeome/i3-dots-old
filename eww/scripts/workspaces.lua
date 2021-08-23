local function capture(cmd)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    return s
end
--print(capture("echo $XDG_SESSION_TYPE"))
if not string.find(capture("echo $XDG_SESSION_TYPE"),"wayland") then

local workspacelistraw = capture("wmctrl -d")
local clean = workspacelistraw:gsub(" DG: N/A  VP: 0,0  WA: N/A  %d","")
local getactiveworkspace = function ()
    local s = clean:match("%d  %*") -- find active workspace
    local numberonly = s:gsub("%D","") -- delete whatever is not a number
    return numberonly
end
local activeworkspace = getactiveworkspace()
local count = string.len(clean)/5 --workspace count
local label_focused = ""
local label_unfocused = ""
local final = "   "..string.rep(label_unfocused.."   ",activeworkspace)..label_focused.."   "..string.rep(label_unfocused.."   ",count-activeworkspace-1)
print(final)
else
local workspacelistraw = capture("swaymsg -t get_workspaces")
local clean = workspacelistraw:match('"name": "%d"',3)
print(clean)
end
--[[
[
  {
    "id": 4,
    "type": "workspace",
    "orientation": "horizontal",
    "percent": null,
    "urgent": false,
    "marks": [
    ],
    "layout": "splith",
    "border": "none",
    "current_border_width": 0,
    "rect": {
      "x": 10,
      "y": 10,
      "width": 1260,
      "height": 1004
    },
    "deco_rect": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "window_rect": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "geometry": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "name": "1",
    "window": null,
    "nodes": [
    ],
    "floating_nodes": [
    ],
    "focus": [
      9
    ],
    "fullscreen_mode": 1,
    "sticky": false,
    "num": 1,
    "output": "DVI-I-1",
    "representation": "H[discord]",
    "focused": false,
    "visible": false
  },
  {
    "id": 39,
    "type": "workspace",
    "orientation": "horizontal",
    "percent": null,
    "urgent": false,
    "marks": [
    ],
    "layout": "splith",
    "border": "none",
    "current_border_width": 0,
    "rect": {
      "x": 10,
      "y": 10,
      "width": 1260,
      "height": 1004
    },
    "deco_rect": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "window_rect": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "geometry": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "name": "2",
    "window": null,
    "nodes": [
    ],
    "floating_nodes": [
    ],
    "focus": [
      43
    ],
    "fullscreen_mode": 1,
    "sticky": false,
    "num": 2,
    "output": "DVI-I-1",
    "representation": "H[Brave-browser]",
    "focused": false,
    "visible": false
  },
  {
    "id": 37,
    "type": "workspace",
    "orientation": "horizontal",
    "percent": null,
    "urgent": false,
    "marks": [
    ],
    "layout": "splith",
    "border": "none",
    "current_border_width": 0,
    "rect": {
      "x": 10,
      "y": 10,
      "width": 1260,
      "height": 1004
    },
    "deco_rect": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "window_rect": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "geometry": {
      "x": 0,
      "y": 0,
      "width": 0,
      "height": 0
    },
    "name": "4",
    "window": null,
    "nodes": [
    ],
    "floating_nodes": [
    ],
    "focus": [
      36
    ],
    "fullscreen_mode": 1,
    "sticky": false,
    "num": 4,
    "output": "DVI-I-1",
    "representation": "H[code-oss]",
    "focused": true,
    "visible": true
  }
]
]]