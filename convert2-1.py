from PIL import Image

def rgb323(r,g,b):
    nR = int(round(r*7.0/255.0))
    nG = int(round(g*7.0/255.0))
    nB = int(round(b*3.0/255.0))
    return (nR<<5)+(nB<<3)+nG

name = 'porteria'
path_imagen = 'porteria.jpg'

img = Image.open(path_imagen)
pix = img.load()
output = '\n'
output += '.data'+'\n'
output += '.align 2'+'\n'+'\n'
output += '.global '+name+'Height'+'\n'
output += ''+name+'Height: .word '+str(img.size[1])+'\n'
output += '.global '+name+'Width'+'\n'
output += ''+name+'Width: .word ' +str(img.size[0])+'\n'
output += '.global '+name+'\n'+'\n'
output += ''+name+':\n'

for j in range(img.size[1]):
    list_ = []
    for i in range(img.size[0]):
        if len(pix[i,j])==3:
            r,g,b = pix[i,j]
        elif len(pix[i,j])==4:
            r,g,b,a = pix[i,j]
        else:
            print "Error"
            break
        newRGB = rgb323(r,g,b) # convert to 8 bits
        list_.append(newRGB)
    output += '    .word '+', '.join([str(a) for a in list_])+'\n'

# save the file
open(name+'.s','w').write(output)

