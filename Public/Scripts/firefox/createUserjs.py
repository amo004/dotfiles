import sys
import pathlib
import os 

def setting(param,value):
    return 'user_pref("' + param + '",' + value + ");\n"

def create(bg,fg,uv,vs):
    background = setting("browser.display.background_color",bg)
    foreground = setting("browser.display.foreground_color",fg)
    unvisited  = setting("browser.anchor_color", uv)
    visited    = setting("browser.visited_color",vs)
    return background + foreground + unvisited + visited

def get_colors():
    home = str(pathlib.Path.home())
    with open(home + '/.cache/wal/colors','r') as f:
        colors = f.readlines()
        for x in range(len(colors)):
            colors[x] = '"' + colors[x].strip('\n') + '"'
        return colors

def create_file(filename,i,j,k,l):
    with open(filename,'w') as f:
        colors = get_colors()
        f.write(create(colors[i],colors[j],colors[k],colors[l]))

if __name__ == "__main__":
    create_file(sys.argv[1],int(sys.argv[2]),int(sys.argv[3]),int(sys.argv[4]),int(sys.argv[5]))
