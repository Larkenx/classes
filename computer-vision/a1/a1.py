from PIL import Image
from scipy import signal
from pylab import *
from scipy.ndimage import *
from scipy.ndimage.filters import convolve
from math import sqrt
from math import pow
from copy import deepcopy
import types

inf = float("inf")
test_img = Image.open('pyramids.png')
img1 = Image.open('seam_carving_input1.jpg')
img2 = Image.open('seam_carving_input2.jpg')
img3 = Image.open('seam_carving_input3.jpg')

def energy_image(img):
    gimg = double(array(img.convert('L')))
    result = double(copy(gimg))
    # x_gradient = convolve(gimg, array([[-1, 1]]))
    x_gradient = sobel(gimg,0)
    # y_gradient = convolve(gimg, array([[-1], [1]]))
    y_gradient = sobel(gimg,1)
    for y in range(0, gimg.shape[0]):
        for x in range(0, gimg.shape[1]):
            energy_val = 0
            # if y == 0 or y == gimg.shape[1] or x == 0 or x == gimg.shape[0]:
            #     result[x,y] = energy_val
            #     continue
            energy_val = sqrt(x_gradient[y,x]**2 + y_gradient[y,x]**2)
            result[y,x] = energy_val

    return result

def cumulative_minimum_energy_map(original_img, dir=0):
    img = deepcopy(original_img)
    if not dir:
        img = transpose(img)

    result = empty_like(img, dtype='double')
    for row in range(0, img.shape[0]):
        for cell in range(0, img.shape[1]):
            if row == 0:
                result[row, cell] = 0
            else:
                min_cost = inf
                for k in range(-1,2):
                    if cell + k >= 0 and cell + k <= img.shape[1] - 1: # if in bounds
                        current_cost = result[row - 1, cell + k]
                        if current_cost < 0 or current_cost == None:
                            print "Cost lookup was NULL or negative..."
                            raise ValueError
                        if current_cost <= min_cost:
                            min_cost = current_cost

                if min_cost == inf:
                    print "Final min_cost was infinity!"
                    raise ValueError

                # Recording table cost + its current cost
                result[row,cell] = min_cost + img[row,cell]

    return result

def find_seam(img):
    seam = []
    last_row = img[img.shape[0] - 1]
    current = argmin(last_row)
    row = img.shape[0] - 1
    while row >= 0:
        seam.append(current) # record the current index
        # find the min position above it
        min_cost = inf
        min_cell = -1
        for k in range(-1, 2):
            if current + k >= 0 and current + k <= img.shape[1] - 1: # if in bounds
                possible_result = img[row - 1, current + k]
                if min_cost > possible_result:
                    min_cost = possible_result
                    min_cell = current + k

        current = min_cell
        row -= 1

    return seam

def display_seam(img, dir):
    aimg = array(img)
    seam = find_seam(cumulative_minimum_energy_map(energy_image(img), dir))
    if not dir:
        row = aimg.shape[1] - 1
        for i in seam:
            aimg[i, row] = [255,0,0]
            row -= 1
    else:
        row = aimg.shape[0] - 1
        for i in seam:
            aimg[row, i] = [255,0,0]
            row -= 1

    return aimg

def resize(img, energy_img, dir):
    if dir == 2: # resize both directions
        raise ValueError
    else:
        seam = find_seam(cumulative_minimum_energy_map(energy_img, dir))
        mask = ones((img.shape[0], img.shape[1]), dtype=bool)
        mask[range(img.shape[0]), seam] = False
        resized = img[mask].reshape(img.shape[0], img.shape[1]-1, 3)
        # print resized
        return resized

        #
        # if not dir: # horizontal
        #     for i,j in seam:
        #         aimg[j].pop(i)
        #     # print aimg
        #     return aimg
        # else:
        #     for i,j in seam:
        #         aimg[i].pop(j)
        #     return aimg

# # Energy Images
# eimg1 = energy_image(img1)
# eimg2 = energy_image(img2)
# eimg3 = energy_image(img3)
# Image.fromarray(uint8(eimg1)).save('energy_image1.jpg')
# Image.fromarray(uint8(eimg2)).save('energy_image2.jpg')
# Image.fromarray(uint8(eimg3)).save('energy_image3.jpg')
#
# # Vertical Cumulative images
# cem_v1 = cumulative_minimum_energy_map(eimg1)
# cem_v2 = cumulative_minimum_energy_map(eimg2)
# cem_v3 = cumulative_minimum_energy_map(eimg3)
# Image.fromarray(uint8(cem_v1)).save('cem_vertical1.jpg')
# Image.fromarray(uint8(cem_v2)).save('cem_vertical2.jpg')
# Image.fromarray(uint8(cem_v3)).save('cem_vertical3.jpg')
#
# # Horizontal Cumulative images
# cem_h1 = cumulative_minimum_energy_map(eimg1, 1)
# cem_h2 = cumulative_minimum_energy_map(eimg2, 1)
# cem_h3 = cumulative_minimum_energy_map(eimg3, 1)
# Image.fromarray(uint8(cem_h1)).save('cem_horizontal1.jpg')
# Image.fromarray(uint8(cem_h2)).save('cem_horizontal2.jpg')
# Image.fromarray(uint8(cem_h3)).save('cem_horizontal3.jpg')
#
# # Displaying the horizontal seams
# Image.fromarray(uint8(display_seam(img1,0))).save('seam_h1.jpg')
# Image.fromarray(uint8(display_seam(img2,0))).save('seam_h2.jpg')
# Image.fromarray(uint8(display_seam(img3,0))).save('seam_h3.jpg')
#
# # Displaying the vertical seams
# Image.fromarray(uint8(display_seam(img1,1))).save('seam_v1.jpg')
# Image.fromarray(uint8(display_seam(img2,1))).save('seam_v2.jpg')
# Image.fromarray(uint8(display_seam(img3,1))).save('seam_v3.jpg')
# 1076 seconds
resized_img = resize(array(img1), energy_image(img1), 1)
for i in range(100):
    e_img = energy_image(Image.fromarray(resized_img))
    resized_img = resize(resized_img, e_img, 1)

Image.fromarray(uint8(resized_img)).save('output_width1.jpg')

resized_img = resize(array(img2), energy_image(img2), 1)
for i in range(100):
    e_img = energy_image(Image.fromarray(resized_img))
    resized_img = resize(resized_img, e_img, 1)

Image.fromarray(uint8(resized_img)).save('output_width2.jpg')

fig = figure()
fig.add_subplot(121, title='original')
# Showing original
imshow(img1)
# Showing resized
fig.add_subplot(122, title='resized')
imshow(resized_img)
show()

# resized_img = array(resize(img1, 0))
# print array(test_img)
# print resized_img
# imshow(resized_img)
# show()
# for i in range(0, 101):
#     new_resize = resize(resized_img,0)
#     Image.fromarray(uint8(new_resize))

# Image.fromarray(uint8(resized_img)).save('output_height1.jpg')
