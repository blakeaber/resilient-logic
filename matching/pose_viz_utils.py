import numpy as np
import matplotlib.pyplot as plt


body_part_names = [
    'nose', 'left_eye', 'right_eye', 'left_ear', 
    'right_ear', 'left_shoulder', 'right_shoulder', 
    'left_elbow', 'right_elbow', 'left_wrist', 'right_wrist', 
    'left_hip', 'right_hip', 'left_knee', 'right_knee', 
    'left_ankle', 'right_ankle'
]


body_part_labels = np.array([
    'face',
    'face',
    'face',
    'face',
    'face',
    'left arm',
    'right arm',
    'left arm',
    'right arm',
    'left arm',
    'right arm',
    'left leg',
    'right leg',
    'left leg',
    'right leg',
    'left leg',
    'right leg'
])


body_part_colors = {
    'face': 'green', 
    'left arm': 'blue', 
    'right arm': 'cyan',
    'left leg': 'red', 
    'right leg': 'magenta'
}


def plot_keypoint_data(data, labels=body_part_labels, colors=body_part_colors):
    fig, ax = plt.subplots()
    for part in np.unique(labels):
        ix = np.where(labels == part)
        ax.scatter(
            data[ix, 0], 
            data[ix, 1], 
            c=colors[part], 
            label=part, 
            s=100
    )
    ax.legend()
    plt.show()




