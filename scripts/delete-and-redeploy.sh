#!/bin/bash

# Get bucket name
BUCKET_NAME=$(aws cloudformation describe-stacks --stack-name dennis-stack-s3 --query 'Stacks[0].Outputs[?OutputKey==`WebsiteBucketName`].OutputValue' --output text)

echo "Emptying bucket $BUCKET_NAME..."
aws s3 rm s3://$BUCKET_NAME --recursive

echo "Deleting stack..."
aws cloudformation delete-stack --stack-name dennis-stack-s3

echo "Waiting for stack deletion..."
aws cloudformation wait stack-delete-complete --stack-name dennis-stack-s3

echo "Redeploying stack..."
aws cloudformation deploy --template-file cloudfront-s3.yml --stack-name dennis-stack-s3 --capabilities CAPABILITY_IAM

echo "Done!"

