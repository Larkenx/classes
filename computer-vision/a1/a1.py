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

img1 = Image.open('seam_carving_input1.jpg')
img2 = Image.open('seam_carving_input2.jpg')
img3 = Image.open('seam_carving_input3.jpg')
test_img = Image.open('box.png')

def energy_image(img):
    gimg = double(array(img.convert('L')))
    result = double(copy(gimg))
    # x_gradient = convolve(gimg, array([[-1, 1]]))
    x_gradient = sobel(gimg,0)
    # y_gradient = convolve(gimg, array([[-1], [1]]))
    y_gradient = sobel(gimg,1)
    # Image.fromarray(x_gradient).show()
    # Image.fromarray(y_gradient).show()
    for y in range(0, gimg.shape[1]):
        for x in range(0, gimg.shape[0]):
            energy_val = 0
            if y == 0 or y == gimg.shape[1] or x == 0 or x == gimg.shape[0]:
                result[x,y] = energy_val
                continue

            energy_val = sqrt(x_gradient[x,y]**2 + y_gradient[x,y]**2)
            result[x,y] = energy_val

    return result

def cumulative_minimum_energy_map(img, dir):
    # print("Shapes")
    # print(img.shape)
    # print(rot90(img).shape)
    # print(img[0,0])
    # print(rot90(img)[0, img.shape[1] - 1])
    if dir: # flip for horizontal
        lookup_img = deepcopy(transpose(img))
    else:
        lookup_img = deepcopy(img)

    table = empty_like(lookup_img, dtype='double')
    for y in range(0, lookup_img.shape[1]):
        for x in range(0, lookup_img.shape[0]):
            if y == 0:
                table[x,y] = lookup_img[x,y]
                print table[x,y]
            else:
                # Need to find the minimum of the three above this pixel
                for k in range(-1, 2):
                    min_result = inf
                    if x+k >= 0 and x + k <= lookup_img.shape[0] - 1: # if in bounds
                        possible_result = table[x + k, y - 1]
                        if min_result > possible_result:
                            min_result = possible_result

                # Create a new entry for this particular result
                table[x,y] = min_result + lookup_img[x,y]

    if dir:
        return transpose(table)

    return table

def vertical_seam(cimg):
    seam = []
    last_row = cimg[:,cimg.shape[1]-1]
    min_cost = inf
    smallest_location = (-1, -1)
    for x in range(0, cimg.shape[0]):
        curr = last_row[x]
        # print curr
        if curr < min_cost:
            smallest_location = (x, cimg.shape[1]-1)
            min_cost = curr

    # smallest = argmin(last_row)
    # smallest_pix = smallest[0] if isinstance(smallest, types.ListType) else smallest
    current_pix = smallest_location

    while current_pix[1] >= 0:
        seam.append(current_pix) # record the current step in the seam
        # find the min position above it
        x = current_pix[0]
        y = current_pix[1]
        for k in range(-1, 2):
            min_cost = inf
            min_pix_posn = (-1, -1)
            if x+k >= 0 and x + k <= cimg.shape[0]: # if in bounds
                possible_result = cimg[x + k, y - 1]
                if min_cost > possible_result:
                    min_cost = possible_result
                    min_pix_posn = (x + k, y - 1)

        current_pix = min_pix_posn

    return seam

def color_seam(img):
    aimg = array(img)
    seam = vertical_seam(cumulative_minimum_energy_map(energy_image(img), 0))
    for i,j in seam:
        aimg[i,j] = [255,0,0]

    return aimg

imshow(color_seam(img1))
show()

# eimg1 = energy_image(img1)
# eimg2 = energy_image(img2)
# eimg3 = energy_image(img3)
#
# # Testing
# ctest_img = cumulative_minimum_energy_map(energy_image(test_img))
# test_seam = vertical_seam(ctest_img)
#
# # Energy Images
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
