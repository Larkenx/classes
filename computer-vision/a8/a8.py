from numpy import *
from os import listdir
from os.path import isfile, join
import os
import cv2

project_dir = "/Users/larken/class/computer-vision/a8/"

def draw_flow(im,flow,step=16):
    """ Plot optical flow at sample points
    spaced step pixels apart. """
    h,w = im.shape[:2]
    y,x = mgrid[step/2:h:step,step/2:w:step].reshape(2,-1)
    fx,fy = flow[y,x].T
    # create line endpoints
    lines = vstack([x,y,x+fx,y+fy]).T.reshape(-1,2,2)
    lines = int32(lines)
    # create image and draw
    vis = cv2.cvtColor(im,cv2.COLOR_GRAY2BGR)
    for (x1,y1),(x2,y2) in lines:
        cv2.line(vis,(x1,y1),(x2,y2),(0,255,0),1)
        cv2.circle(vis,(x1,y1),1,(0,255,0), -1)
    return vis

# Generating optical flow Dog frames
'''
dog_path = "/Users/larken/class/computer-vision/a8/dog/"
dog_frames = [f for f in listdir(dog_path)]
flow_dog_path = "/Users/larken/class/computer-vision/a8/flow_dog/"
first_dog_frame = cv2.imread(dog_path + dog_frames[0])
prev_gray = cv2.cvtColor(first_dog_frame, cv2.COLOR_BGR2GRAY)

for f in dog_frames:
    im = cv2.imread(dog_path + f)
    gray = cv2.cvtColor(im,cv2.COLOR_BGR2GRAY)
    flow = cv2.calcOpticalFlowFarneback(prev_gray,gray,0.5,1,3,15,3,5,1)
    prev_gray = gray
    flow_viz = draw_flow(gray,flow)
    cv2.imwrite(flow_dog_path + f, flow_viz)
'''

# Generating optical flow Thomas frames
'''
thomas_path = "/Users/larken/class/computer-vision/a8/jpl_thomas/"
thomas_frames = [f for f in listdir(thomas_path) if not f == ".DS_Store"]
flow_thomas_path = "/Users/larken/class/computer-vision/a8/flow_thomas/"
first_thomas_frame = cv2.imread(thomas_path + thomas_frames[0])

prev_gray = cv2.cvtColor(first_thomas_frame, cv2.COLOR_BGR2GRAY)

for f in thomas_frames:
    im = cv2.imread(thomas_path + f)
    gray = cv2.cvtColor(im,cv2.COLOR_BGR2GRAY)
    flow = cv2.calcOpticalFlowFarneback(prev_gray,gray,0.5,1,3,15,3,5,1)
    prev_gray = gray
    flow_viz = draw_flow(gray,flow)
    cv2.imwrite(flow_thomas_path + f, flow_viz)
'''

def xyt(sequence_dir):
    fnames = os.listdir(sequence_dir)
    label = int(sequence_dir.split('_')[1])
    frames = sorted(fnames, key = lambda x: int(x.split('_')[1].split('.')[0]))
    return label, np.stack([cv2.imread(os.path.join(sequence_dir,f)) for f in frames])

def get_HOG_of_frame(frame):
    """Extracts histogram of gradients for a single frame. Divide the frame into 5-by-5 spatial regions,
    and then count the number of pixels (in each region) belonging to each of 9 gradient orientation bins."""
    HOGS = []
    im = float32(frame) / 255.0

    # Create 5x5 spatial regions
    for r in hsplit(im, 5):
        for region in vsplit(r,5):
            # For this region, calculate gradient directions and store in HOG
            HOG = zeros_like(arange(9), dtype=uint8)
            gx = cv2.Sobel(region, cv2.CV_32F, 1, 0, ksize=1)
            gy = cv2.Sobel(region, cv2.CV_32F, 0, 1, ksize=1)
            mag, angle = cv2.cartToPolar(gx, gy, angleInDegrees=True)
            for dir in angle.flatten():
                if dir > 180:
                    dir = dir % 180
                bin = int(floor(dir / 20))
                if bin == 9:
                    HOG[bin-1] += 1
                else:
                    HOG[bin] += 1

            HOGS.append(HOG)

    return array(HOGS).flatten()

def video_HOG_average(sequence_dir):
    labels, frames = xyt(sequence_dir)
    average_HOG = zeros_like(arange(255))
    for f in frames:
        averaged_HOG =+ get_HOG_of_frame(f)




jpl_path = project_dir + "jpl/"

video_HOG_average(jpl_path + "1_1")