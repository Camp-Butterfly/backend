from __future__ import print_function

import grpc
import numpy as np
import requests
import tensorflow as tf
import os

from tensorflow_serving.apis import predict_pb2
from tensorflow_serving.apis import prediction_service_pb2_grpc
from tensorflow.keras.preprocessing import image

tf.compat.v1.app.flags.DEFINE_string('server', '173.255.119.154:80', 
				'PredictionService host:port')
tf.compat.v1.app.flags.DEFINE_string('image', '','path to image in JPEG format')

FLAGS = tf.compat.v1.app.flags.FLAGS

#IMAGE_PATH = 'test_image_ringlet.JPEG'

if os.environ.get('https_proxy'):
 del os.environ['https_proxy']
if os.environ.get('http_proxy'):
 del os.environ['http_proxy']

def main(_):
  #Download image 
  img = image.load_img("test_image_ringlet.JPEG", target_size=(150,150))
  img_tensor = image.img_to_array(img)
  img_tensor = np.expand_dims(img_tensor, axis=0)
  data = img_tensor

  print(data)  

  channel = grpc.insecure_channel(FLAGS.server)
  stub = prediction_service_pb2_grpc.PredictionServiceStub(channel)
  #send request
  request = predict_pb2.PredictRequest()
  request.model_spec.name = 'test2'
  request.model_spec.signature_name = 'serving_default'
  request.inputs['input_image'].CopyFrom(
	tf.make_tensor_proto(data,shape=[1,150,150,3])
  )
  result = stub.Predict(request,10.0)
  print(result)

if __name__ == '__main__':
  tf.compat.v1.app.run()

