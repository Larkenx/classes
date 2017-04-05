from pylab import *
from numpy import *
from PIL import Image
import sift

def generate_sift_image(imname):
    im = array(Image.open(imname))
    removed_ext = imname[0:imname.index(".")]
    sift.process_image(imname, removed_ext + '.sift')
    l1,d1 = sift.read_features_from_file(removed_ext + '.sift')
    print d1.shape

    figure()
    gray()
    sift.plot_features(im, l1, circle=True)
    savefig(removed_ext + "_sift.png", bbox_inches="tight")
    show()

# Exercise 1
# generate_sift_image("box.png")
# generate_sift_image("box_in_scene.png")

# Exercise 2
def dist(v1, v2):
    """Finds the Euclidean distance between two vectors. """
    sum = 0
    for i in range(0, v1.shape[0]):
        sum += (v1[i] - v2[i])**2

    return sqrt(sum)

# Exercise 3
def pairwise_dist(im1, im2):
    """Generates a distance matrix of f1.shape[0] by f2.shape[0],
    comparing the pairwise distance between every feature from im1 to im2 """
    D = empty(shape=(im1.shape[0], im2.shape[0]))
    for i in range(0, im1.shape[0]):
        v1 = im1[i]
        for j in range(0, im2.shape[0]):
            v2 = im2[j]
            D[i,j] = dist(v1, v2)

    return D

# Exercise 4
def plot_local_feats(imname1, imname2):
    aim1 = array(Image.open(imname1).convert('L'))
    aim2 = array(Image.open(imname2).convert('L'))
    offset = aim2.shape[1] - aim1.shape[1]
    aim1 = concatenate((aim1, zeros((aim1.shape[0], offset))), axis=1)
    # We have to add a black padding/border to make the two images
    # the same size so they can be plotted together

    sift.process_image(imname1, 'tmp1.sift')
    sift.process_image(imname2, 'tmp2.sift')
    l1,d1 = sift.read_features_from_file('tmp1.sift')
    l2, d2 = sift.read_features_from_file('tmp2.sift')

    # Now we have the two features, we can build the distance matrix
    D = pairwise_dist(d1, d2)
    # for each feature in d1, find the minimum distance in d2 features that matches
    for i in range(0, D.shape[0]):
        D[i]



    plot_img = concatenate((aim1, aim2), axis=0)



    imshow(plot_img)
    show()

plot_local_feats("box.png", "box_in_scene.png")























