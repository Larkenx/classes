from PIL import Image
from scipy import signal
from pylab import *
# load the image
img = Image.open('empire.jpg')
eye_img = Image.open('eye.png')
# Crop the image and save it
cropped_img = img.crop((100, 100, 400, 400)).resize((128, 128))
cropped_img.save('empire_cropped.jpg')
# Resize the cropped image and save it
cropped_img.rotate(45).save('empire_cropped_rotated.jpg')
# Save a grayscale version of the empire img
img.convert('L').save('empire_gray.jpg')

# Using matplotlib, we can now do some stuff with our image
original = array(img)
cropped = array(img.crop((100, 100, 400, 400)))
cropped_resized = array(cropped_img)


def grayscale(arr):
    result = np.zeros(shape=(arr.shape[0], arr.shape[1]))
    for i in range(0, arr.shape[0]):
        for j in range(0, arr.shape[1]):
            pix = arr[i,j]
            result[i,j] = average(pix)
            # result[i,j] = (pix[0] * 299/1000 + pix[1] * 587/1000 + pix[2] * 114/1000) / 3

    return result

# Build grayscale image from array (returns array)
# grayscaled_img_arr = grayscale(original)
# Convert into an image
# grayscaled_img = Image.fromarray(grayscaled_img_arr).convert('RGB')
# Save image
# grayscaled_img.save('empire_gray_yours.jpg')

# Show images
# imshow(grayscaled_img_arr, cmap=matplotlib.cm.Greys_r)
# imshow(original)
# imshow(cropped)
# imshow(cropped_resized)
# show()

# def cross_correlate(img, filter, k):
#     # Iterate through all of the pixels of the image
#     for i in range(0, img.shape[0]):
#         for j in range(0, img.shape[1]):
#             pix = img[i,j]
#             new_pix = 0
#             # For that particular image, lookup the weights in the filter
#             for hi in range(-1*k, k):
#                 for hj in range(-1*k, k - 1):
#                     index = hi < 0 ?
#                     new_pix = arr[i+hi]*filter[hi,hj]

# My correlate function
def mcorrelate(img, filter):
    arr = array(img)
    return signal.correlate2d(arr, filter, boundary='fill', mode='valid')

def convolute(img, filter):
    new_filter = filter[::-1]
    return mcorrelate(img, new_filter)

## Box Filters
# 3x3
af1 = ones(shape=(3,3))
# 10x10
af2 = ones(shape=(10, 10))
#20x20
af3 = ones(shape=(20,20))
# Impulse Filter
impulsef = [[0,0,0], [0,10,0], [0,0,0]]
# Gaussian Filter
gaussianf = [[1, 2, 1], [2, 4, 2], [1, 2, 1]]


"""
# Drawing the blurred images side by side with original
fig = figure()
fig.add_subplot(1, 2, 1)
imshow(eye_img.convert('L'), cmap=matplotlib.cm.Greys_r)

fig.add_subplot(1, 2, 2)
blurred_img = convolute(eye_img.convert('L'), af2)
imshow(blurred_img, cmap=matplotlib.cm.Greys_r)
"""
show()
