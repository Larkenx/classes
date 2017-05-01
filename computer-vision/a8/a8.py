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
    # frames = sorted(fnames, key = lambda x: int(x.split('_')[1].split('.')[0]))
    return label, stack([cv2.imread(os.path.join(sequence_dir,f)) for f in fnames])

def get_HOG_of_frame(frame):
    """Extracts histogram of gradients for a single frame. Divide the frame into 5-by-5 spatial regions,
    and then count the number of pixels (in each region) belonging to each of 9 gradient orientation bins."""
    HOGS = []
    im = float32(frame) / 255.0
    gx = cv2.Sobel(im, cv2.CV_32F, 1, 0, ksize=1)
    gy = cv2.Sobel(im, cv2.CV_32F, 0, 1, ksize=1)
    mag, angle = cv2.cartToPolar(gx, gy, angleInDegrees=True)
    angle = uint8(angle)

    # Create 5x5 spatial regions
    v_offset = int(ceil(angle.shape[1] / 5))
    h_offset = int(ceil(angle.shape[0] / 5))
    for i in range(0, angle.shape[1], v_offset):
        for j in range(0, angle.shape[0], h_offset):
            x_window = i+v_offset
            y_window = j+h_offset
            if i+v_offset >= angle.shape[1]:
                x_window = angle.shape[1]
            if j+h_offset >= angle.shape[0]:
                y_window = angle.shape[0]
            region = angle[i:x_window, j:y_window]
            # For this region, calculate gradient directions and store in HOG
            HOG = zeros_like(arange(9), dtype=uint8)
            for dir in region.flatten():
                if dir > 180:
                    dir = dir % 180
                bin = int(floor(dir / 20))
                if bin == 9:
                    HOG[bin-1] += 1
                else:
                    HOG[bin] += 1

            HOGS.append(HOG)

    result = array(HOGS).flatten()
    return result

def video_HOG_average(sequence_dir):
    label, frames = xyt(sequence_dir)
    average_HOG = zeros_like(arange(255))
    i = 0
    for f in frames:
        print "Processing frame {0}".format(i)
        averaged_HOG =+ get_HOG_of_frame(f)
        i += 1

    return label, averaged_HOG / frames.shape[0]

jpl_path = project_dir + "jpl/"
video_HOG_average(jpl_path + "1_1")

# sequence_directories = [jpl_path + dir for dir in listdir(jpl_path) if dir != '.DS_Store']
# activity_ids = []
# averaged_videos = []
# for i in range(0, len(sequence_directories)):
#     print "Processing directory {0}".format(sequence_directories[i])
#     label, avg_HOG = video_HOG_average(sequence_directories[i])
#     activity_ids.append(label)
#     averaged_videos.append(avg_HOG)
#
# averaged_videos = array(averaged_videos)
# savetxt("averaged_video_hogs", averaged_videos)

