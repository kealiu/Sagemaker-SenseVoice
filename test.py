import json
import boto3

from urllib3 import encode_multipart_formdata

test_region='region-code-1'
endpoint_name="endpoint-name"

runtime_sm_client = boto3.client(region_name=test_region, service_name='sagemaker-runtime')

#Endpoint invocation
with open('sample/zh.mp3', mode='rb') as f:
    file_content = f.read()

payload, header = encode_multipart_formdata({"file": ("zh.mp3", file_content)})
response = runtime_sm_client.invoke_endpoint(
    EndpointName=endpoint_name,
    ContentType=header,
    Body=payload)

#Parse results
result = json.loads(response['Body'].read().decode())
print(result['text'])