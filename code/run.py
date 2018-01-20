import rasterio
import numpy as np
from scipy import ndimage
import matplotlib.pyplot as plt
import scipy

dataset1 = rasterio.open('../data/image_sakhalin_1.tif')
dataset2 = rasterio.open('../data/image_sakhalin_2.tif')

img_1 = dataset1.read(1)[:,:-1]
img_2 = dataset2.read(1)[:,:]

img_1[img_1<0.001]=0.001
img_1 = 10*np.log10(img_1)

img_2[img_2<0.001]=0.001
img_2 = 10*np.log10(img_2)

img_diff_2 = img_1 - img_2

img_thresh_2 = img_diff_2.copy()
img_thresh_2[img_thresh_2<15] = 0
img_thresh_2[img_thresh_2>=15] = 255

opening = ndimage.binary_opening(img_thresh_2, structure=np.ones((2,2)), iterations=2)
lbls = scipy.ndimage.label(opening)[0]

index = np.unique(lbls)[1:]

centroids_2 = ndimage.measurements.center_of_mass(opening, lbls,index)

# Getting small patches from images with centroids coordinates in the center
patches_2 = []
h,w = img_1.shape
for centroid in centroids_2:
    x, y = int(round(centroid[0])), int(round(centroid[1]))
    
    x_1 = np.clip(x-250, 0, h-250) 
    x_2 = np.clip(x+250, 250, h)
    y_1 = np.clip(y-250, 0, w-250)
    y_2 = np.clip(y+250, 250, w)
    patch = img_1[x_1:x_2, y_1:y_2]+30
    patches_2.append(patch)

plt.imsave('../latex/fig/ship.png', patches_2[4])

