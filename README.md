# Sagemaker-SenseVoice

SenseVoice Porting for AWS Sagemaker, which could be a replacement for [Amazon Transcribe](https://aws.amazon.com/cn/transcribe/)

# Usage

## Build Image

After clone this repo:

```bash
cd Sagemaker-SenseVoice

# login AWS ECR
aws ecr get-login-password | sudo /usr/bin/docker login --username AWS --password-stdin 111111111111.dkr.ecr.some-region-code.amazonaws.com


sudo docker build -t 111111111111.dkr.ecr.some-region-code.amazonaws.com/tag:version .
sudo docker push 111111111111.dkr.ecr.some-region-code.amazonaws.com/tag:version
```

Then, create **Models**, **Endpoint configurations**, **Endpoints** in AWS Sagemaker.

## Call Endpoint

refer to `test.py`, to call this Sagemaker Endpoint.

# Thanks to

- [FunAudioLLM Sense Voice](https://github.com/FunAudioLLM/SenseVoice)
- [SenseVoice Models](https://www.modelscope.cn/models/iic/SenseVoiceSmall)
