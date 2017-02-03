from PIL import Image
from scipy import signal
from pylab import *
from scipy.ndimage import *
from scipy.ndimage.filters import convolve
from math import sqrt
from math import pow

img1 = Image.open('seam_carving_input1.jpg')
img2 = Image.open('seam_carving_input2.jpg')
img3 = Image.open('seam_carving_input3.jpg')
test_img = Image.open('pyramids.png')

def energy_image(img):
    gimg = float64(array(img.convert('L'))) # very important
    result = float64(copy(gimg))
    x_gradient = convolve(gimg, array([[-1, 1]]))
    # x_gradient = sobel(gimg,0)
    y_gradient = convolve(gimg, array([[-1], [1]]))
    # y_gradient = sobel(gimg,1)
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

class Result:

    def __init__(self, cost, x, y, next):
        self.cost = cost
        self.x = x
        self.y = y
        self.next = next

    def string(self):
        return "Cost: {0} Position: ({1},{2})".format(self.cost, self.x, self.y)

def cumulative_minimum_energy_map(img, dir=0):
    table = [([None]*img.shape[0]) for y in range(0, img.shape[1])]
    best_yet = Result(256, None, None, None)
    for y in range(img.shape[1] - 1, 0, -1):
        for x in range(0, img.shape[0] - 1):
            if y == img.shape[1] - 1:
                table[y][x] = Result(img[x,y], x, y, None)
            else:
                # Need to find the minimum of the three above this pixel
                for k in range(-1, 1):
                    min_result = Result(256, None, None, None)
                    if x+k >= 0 and x + k <= img.shape[0]: # if in bounds
                        possible_result = table[y + 1][x + k]
                        if min_result.cost > possible_result.cost:
                            min_result = possible_result

                # Create a new entry for this particular result
                table[y][x] = Result(img[x,y] + min_result.cost, x, y, min_result)

            # Finally, update our lowest costing column if we're at the last one
            if y == 0 and table[y][x].cost < best_yet.cost:
                best_yet = table[y][x]

    # Now we know where to start on the top row, since we have the best_yet.
    # We're ready to backtrack from the top->down
    seam = []
    current = best_yet
    print best_yet.string()
    while not current == None:
        seam.append((current.x, current.y)) # tuples of x,y coords for pixels
        current = current.next

    return seam

eimg1 = energy_image(test_img)
print cumulative_minimum_energy_map(eimg1)
# Image.fromarray(uint8(eimg1)).show()
# eimg2 = energy_image(img2)
# eimg3 = energy_image(img3)
# Image.fromarray(uint8(eimg1)).save('energy_image1.jpg')
# Image.fromarray(uint8(eimg2)).save('energy_image2.jpg')
# Image.fromarray(uint8(eimg3)).save('energy_image3.jpg')
