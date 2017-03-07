# Pictorial-Information_Project2

Execute Wrapper.m will load a video from 'videoPath' and produce a video with 'Out' appended follow the original name
Definition of parameter:

swapFace: true if you want to swap faces in the same frame
wrapMethed: the method for wrapping 'tri' -> triangulation, 'TPS' -> This Plate Spline
faceDetector.name: choose which face detector to use 'Zhu' -> X. Zhu method, 'DLib' -> Dlib
videoPath: path of the input video
sourceImg: the source image for wraping a face (only for swapFace = 0)