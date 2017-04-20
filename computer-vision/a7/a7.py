from scipy.spatial.distance import euclidean
from scipy.cluster.vq import *
from PIL import Image
from pylab import *
import sift
import operator
from shutil import copyfile
from os import listdir
from os.path import isfile, join

# Problem Two: Image retrieval using Bag-of-words
categories = ["airplanes", "camera", "chair", "crab", "crocodile", "elephant", "headphone", "pizza", "soccer_ball", "starfish"]
image_to_sift = []
path = "/Users/larken/class/computer-vision/a7/object_categories/"
sift_path = "/Users/larken/class/computer-vision/a7/sift_features/"
# Generating sift files for every image, stored under sift_features/*.sift
for c in categories:
    cat_path = path + c + '/'
    images = [f for f in listdir(cat_path) if isfile(join(cat_path, f))]
    suffix = 1
    for f in images:
        sift.process_image(join(cat_path, f), "{0}{1}_{2}.sift".format(sift_path, c, suffix))
        suffix += 1
# Reading sift features from files to do k-means clustering. Only using the first image for each category
all_kps, all_feats = [], []
sift_files = [f for f in listdir(sift_path) if isfile(join(sift_path, f))]

for f in sift_files:
    keypoints, descriptors = sift.read_features_from_file(sift_path + f)
    all_kps.append(keypoints)
    all_feats.append(descriptors)

features = vstack(all_feats)
centroids, variance = kmeans(features, 200)
code, distance = vq(features, centroids)  # associate features with centroids
histograms = empty((..., 200))
h_index = -1
for cat in categories:
    for i in range(1,801):
        # print i
        # Read in the feature for the current image. We need to go through all n 128D vectors,
        # and compare each descriptor to all centroids. We take the argmin and update the histogram with the min
        suffix = ("0" * (4 - len(str(i)))) + str(i)
        file_name = "{0}{1}_{2}.sift".format(sift_path, cat, suffix)
        print file_name
        current_location, current_feats = sift.read_features_from_file(file_name)
        # Grab each feature from the images' features
        for f in current_feats:
            # Compare this feature to all centroids
            distance_mapping = [euclidean(f, c) for c in centroids] # mapping of distance to each centroid index
            closest_centroid = argmin(distance_mapping)
            histograms[h_index + i, closest_centroid] += 1 # update the count for this centroid

    h_index += 800

savetxt("complete_histograms.txt", histograms.astype(int))

# Now that we've generated the histogram and saved it to the disk as "complete_histograms.txt", we can easily load it
# into our program. We're ready to start querying images.

# The easiest way to go about this is to create a dictionary that maps filenames to their respective histogram
# The histograms are currently indexed alpha-numerically, but it would be easier to recall what files go with what
# if we can sort them by minimal Euclidean distance.
'''
histograms = loadtxt("complete_histograms.txt")
image_file_paths = []
for c in categories:
    cat_path = path + c + '/'
    for i in range(1, 10):
        image_file_paths.append("{0}image_000{1}.jpg".format(cat_path, i))
    image_file_paths.append(cat_path + "image_0010.jpg")

image_histos = dict(zip(image_file_paths, histograms))

def query_image(imname, h):
    D = h.copy()
    query_hist = D[imname]
    # Set every value in the copied dictionary to be the distance between the query image and the image bank
    for k, v in D.iteritems():
        if k == imname:
            D[k] = float('inf') # if this is the exact image as the query image, we want to exclude it
        else:
            D[k] = euclidean(query_hist, v)

    sorted_D = sorted(D.items(), key=operator.itemgetter(1)) # http://stackoverflow.com/questions/613183/sort-a-python-dictionary-by-value
    # Sort them ascending (lower values mean more similar images based on histogram)
    return sorted_D

# query_image(image_file_paths[0], image_histos)
save_query_path = "/Users/larken/class/computer-vision/a6/queries/"
for i in range(0,100, 10):
    query_name = image_file_paths[i]
    current_category = categories[i / 10]
    matched_images = query_image(query_name, image_histos)
    matched_file_names = [i[0] for i in matched_images[:5]]
    f_index = 1
    for f in matched_file_names:
        copyfile(f, "{0}{1}_query_result{2}.jpg".format(save_query_path, current_category, f_index))
        f_index += 1

'''











