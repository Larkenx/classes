from scipy.cluster.vq import *
from scipy.ndimage.filters import gaussian_filter
from scipy.signal import convolve2d
from scipy.spatial.distance import euclidean
from numpy.random import randn
from pylab import *
from PIL import Image

class1 = 2.0 * randn(100, 2)
class2 = randn(100,2) + array([5,5])
class3 = randn(100,2) + array([5,0])
features = vstack((class1, class2, class3))
centroids, variance = kmeans(features, 3)
code, distance = vq(features, centroids)
print code
figure()
ndx = where(code==0)[0]
plot(features[ndx,0],features[ndx,1],"*")
ndx = where(code==1)[0]
plot(features[ndx,0],features[ndx,1],"r.")
ndx = where(code==2)[0]
plot(features[ndx,0],features[ndx,1],"c.")
plot(centroids[:,0],centroids[:,1],"go")
axis("off")
show()

# Use reshape to convert image to 2D matrix of...
# [[RGB], [RGB]]
