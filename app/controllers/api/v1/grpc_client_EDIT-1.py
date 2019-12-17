#from __future__ import print_function

import grpc
import numpy as np
import requests
import tensorflow as tf
import os

from tensorflow_serving.apis import predict_pb2
from tensorflow_serving.apis import prediction_service_pb2_grpc
from tensorflow.keras.preprocessing import image

def main(channel):

  # Download image 
    img = image.load_img("cabbage.jpg", target_size=(150,150))
  # map to tensor array
    img_tensor = image.img_to_array(img)
  # Assign dimensions
    img_tensor = np.expand_dims(img_tensor, axis=0)
  # pass into workable variable
    data = img_tensor
  # mapped image
    print(data)  
  
  # establish channel to docker image container
    # local container
    #channel = grpc.insecure_channel('192.168.99.100:8500') #local
    #channel = grpc.insecure_channel('34.68.117.217:8500') #test2
    channel = grpc.insecure_channel('35.193.112.218:8500') #model
    grpc.channel_ready_future(channel).result()
  # create variable for service that sends object to channel
    stub = prediction_service_pb2_grpc.PredictionServiceStub(channel)
  # assign values to props of request
    request = predict_pb2.PredictRequest()
    # local container
    #request.model_spec.name = 'testmodel'
    #request.model_spec.name = 'test2'
    request.model_spec.name = 'model'
    request.model_spec.signature_name = 'serving_default'
    request.inputs['conv2d_input'].CopyFrom(
  	tf.make_tensor_proto(data,shape=[1,150,150,3])
    )
    #send request to docker image container
    result = stub.Predict(request,10.0)
  # response from model
    print(result)


# creates python executable
if __name__ == '__main__':
  tf.compat.v1.app.run()

