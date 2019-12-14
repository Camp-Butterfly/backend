from __future__ import print_function

import grpc
import numpy as np
import requests
import tensorflow as tf
import os

from tensorflow_serving.apis import predict_pb2
from tensorflow_serving.apis import prediction_service_pb2_grpc
from tensorflow.keras.preprocessing import image
 
def main(channel):
  #Download image 
  img = image.load_img("cabbage.jpg", target_size=(150,150))
  img_tensor = image.img_to_array(img)
  img_tensor = np.expand_dims(img_tensor, axis=0)
  data = img_tensor

  print(data)  

  options = [('grpc.min_reconnect_backoff_ms', 100)]
  channel = grpc.insecure_channel('192.168.99.100:8500', options=options)
  grpc.channel_ready_future(channel).result()
  stub = prediction_service_pb2_grpc.PredictionServiceStub(channel)
  #send request
  request = predict_pb2.PredictRequest()
  request.model_spec.name = 'testmodel'
  request.model_spec.signature_name = 'serving_default'
  request.inputs['input_image'].CopyFrom(
  tf.make_tensor_proto(data,shape=[1,150,150,3])
  )
  result = stub.Predict(request, 100.0)
  #channel.close()
  print(result)

  print('\n')

  print(floats)
  floats = np.array(list(result.outputs['dense_1/Softmax:0'].float_val)) 
  max_ = 0
  for i in range(0,3):
    if floats[i] > floats[max_]:
      max_ = i
  print(max_)

  return channel

if __name__ == '__main__':
  tf.compat.v1.app.run()

