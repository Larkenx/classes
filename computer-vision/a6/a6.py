from skimage.io import imread
from scipy.cluster.vq import *
import matplotlib.pyplot as plt
from numpy.random import rand

from pylab import *
import sift

""" Functions from  Prof Ryoo"""
def appendimages(im1, im2):
    # select the image with the fewest rows and fill in enough empty rows
    rows1 = im1.shape[0]
    rows2 = im2.shape[0]
    if rows1 < rows2:
        im1 = np.concatenate((im1, np.zeros((rows2 - rows1, im1.shape[1]))), axis=0)
    elif rows1 > rows2:
        im2 = np.concatenate((im2, np.zeros((rows1 - rows2, im2.shape[1]))), axis=0)
    # if none of these cases they are equal, no filling needed.
    return np.concatenate((im1, im2), axis=1)

def plot_matches(im1, im2, locs1, locs2):
    im3 = appendimages(im1, im2)
    add = im1.shape[1]
    plt.imshow(im3)
    cols1 = im1.shape[1]

    for i in range(len(locs1)):
        rows = [locs1[i][0], locs2[i][0]]
        cos = [locs1[i][1], locs2[i][1] + add]


    plt.plot(cos, rows, 'k-', lw=1)

path = "/Users/larken/class/computer-vision/a6/"
img1 = imread(path + "cluttered_desk.png", 1)
img2 = imread(path + "staple_remover_model.png", 1)
img3 = imread(path + "elephant_model.png", 1)

# sift.process_image("cluttered_desk.png", 'tmp1.sift')
# sift.process_image("staple_remover_model.png", 'tmp2.sift')
# sift.process_image("elephant_model.png", 'tmp3.sift')

l1, d1 = sift.read_features_from_file('tmp1.sift')
l2, d2 = sift.read_features_from_file('tmp2.sift')
l3, d3 = sift.read_features_from_file('tmp3.sift')

k = 50
keypoints = vstack((l1, l2, l3)) # locations of keypoints on input images
features = vstack((d1, d2, d3)) # concatenated 128D vectors
centroids, variance = kmeans(features, k) # cluster the descriptors/features
code, distance = vq(features, centroids) # associate features with centroids
colors = [rand(3) for j in range(0, k)]
l1_codes = code[:l1.shape[0]] # use mapping of code to keypoints to color circled features
l2_codes = code[l1.shape[0]:l2.shape[0]+l1.shape[0]]
l3_codes = code[l2.shape[0]+l1.shape[0]:]

def plot_features(im, locs, code, colors):
    """Show image with features. input: im (image as array), locs (row, col, scale, orientation of each feature). """
    def draw_circle(c,r,color):
        t = arange(0,1.01,.01)*2*pi
        x = r*cos(t) + c[0]
        y = r*sin(t) + c[1]
        plot(x,y,color=color)

    imshow(im)
    axis("off")

    for i in range(0, len(locs)):
        draw_circle(locs[i][:2],locs[i][2], colors[code[i]])

# plot_features(img1, l1, l1_codes, colors)
# savefig("cluttered_desk_bow.png", bbox_inches=None)
# show()
#
# plot_features(img2, l2, l2_codes, colors)
# savefig("stapler_remover_model_bow.png", bbox_inches=None)
# show()
#
# plot_features(img3, l3, l3_codes, colors)
# savefig("elephant_model_bow.png", bbox_inches=None)
# show()

# stapler remover and cluttered_desk
matches = []
# Go through every descriptor for cluttered desk
for i in range(0, len(l1_codes)):
    current = l1_codes[i]
    current_loc = l1[i][:2] # x,y




