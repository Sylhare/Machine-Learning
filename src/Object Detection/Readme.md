# Object Detection model

Create an object detection model for your application.

Object detection is a field in computer vision.
Basically dealing with identification (=detection) and localisation.

## Steps

- Define the task
  - Assumptions (size? Light? Orientation?)
  - Constraints (Real time? False positive?)
- Create the dataset, annotate, clean
- Find the deep learning model
- Train the model
- Export and use the trained model

## Detection algorithm

Detection with convolution. Open cv with matchTemplate.
 - Fails on template variation
 
Viola and Jones detector: haartraining, CascadeClassifier.
 - To use multiple filter

Sift descriptors (scale invariant feature transform).
 - Advanced template matching from multiple angles.
 
 
## Datasets for object detection

- COCO: 200k labeled images
- Pascal VOC: 11k images

Coco is used in Tensorflow and pytorch. It's a well known json format:
```json
{
    "info": {},
    "licenses": [],
    "images": [],
    "annotations": [],
    "categories": []
}
``` 

## Prepare the data

### Labelling

Usually not made manually.
- labellmg: Simple to use, only bounding boxes, YOLO and VOC formats.
- Rectlabel on Mac OSX


Mobile images have a metadata indicating the inclination.
You can fix it for librairies to rotate using:
```bash
exiftran -ai *.jpeg
```

Otherwise it will be ignored by your python librairies and might mess up your dataset
Use the cocosynth tool to rotate your image

## Detection algorithm

[YOLO](https://github.com/pjreddie/darknet/wiki/YOLO:-Real-Time-Object-Detection) Object detection 
with OpenCV won an award for its speed and accuracy.
It uses "Darknet".Darknet is an open source neural network framework written in C and CUDA. 
t is fast, easy to install, and supports CPU and GPU computation.

YOLO is a CNN (Convutional neural network). It will give a tensor with probability of object in each coordinates.

## Training the model

### Guidance

- Use GPU to enhance speed.
- Split the data between train, validation and tests.
- Get anchor boxes for your dataset (size of detection)
- Monitor loss (loss of training and validation dataset)
- Save your points of your trained model in time.

If you over train your model on your sets, you might lose its generality. It gets too used of your data.

## Export your model

ONNX: to export your model to export it to a model.
Often your model won't be running directly in your dev device.
It will need to be deployed in a device (IoT, camera, tv, ...).

To export as a library or framework you can use:
 -  COreML
 - TuiCreate + TuriAnnotate

## Librairies

- OpenCV: focus for real time apps
- scikit-image: Collection of algorithms for image processing

Install requirements:

```bash
 pip3 install -r requirements.txt 
```