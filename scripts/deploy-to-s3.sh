#!/bin/bash

BUCKET_NAME=$(aws cloudformation describe-stacks --stack-name dennis-stack-s3 --query 'Stacks[0].Outputs[?OutputKey==`WebsiteBucketName`].OutputValue' --output text)

# Copy all other files
aws s3 sync . s3://$BUCKET_NAME/

# Get CloudFront URL
CLOUDFRONT_URL=$(aws cloudformation describe-stacks --stack-name dennis-stack-s3 --query 'Stacks[0].Outputs[?OutputKey==`CloudFrontURL`].OutputValue' --output text)
echo "Deployed! Your site should be available at: $CLOUDFRONT_URL"

