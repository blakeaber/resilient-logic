import numpy as np
from scipy.spatial import distance

# directed_hausdorff is robust to missing points!!!
# implies points below confidence threshold should be removed


def preprocess_coords(image, flip=False):
    data = image.json()['body']['data']
    coords = np.array(data['keypoints'][0])

    xmin, ymin, xmax, ymax = data['bounding-boxes'][0][0]
    xrange = xmax - xmin
    yrange = ymax - ymin
    
    if flip:
        coords[:, 0] = ((coords[:, 0] - xmax) / xrange) + 1
    else:
        coords[:, 0] = 1 - ((coords[:, 0] - xmin) / xrange)
        
    coords[:, 1] = 1 - ((coords[:, 1] - ymin) / yrange)

    return coords


def preprocess_confidence(image):
    data = image.json()['body']['data']
    confidences = np.array(data['confidence'][0]).flatten()
    total_confidence = np.array([confidences.sum()])
    return np.append(confidences, total_confidence)


def confidence_adjusted_coordinates(image, confidence_override=None, confidence_threshold=0.5):
    coords = preprocess_coords(image)

    if confidence_override is not None:
        confidences = confidence_override
    else:
	    confidences = preprocess_confidence(image)

    low_confidence_indices = np.where(confidences <= confidence_threshold)
    for coord in low_confidence_indices:
        coords[coord, :] = np.zeros(2)
    
    return coords


def get_match_similarity(*args, **kwargs):
    return distance.directed_hausdorff(*args, **kwargs)


