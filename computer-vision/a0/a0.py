from PIL import Image
from pylab import *
# load the image
img = Image.open('empire.jpg')
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

print array(img)[20]

# def grayscale(arr):
#     result = full_like(arr, ["float32"])

# grayscale(original)


# print grayscale(original)


# Plot the image
imshow(original)
imshow(cropped)
imshow(cropped_resized)
# Show the image
# show()
