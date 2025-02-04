# Simple Web Game Server

This repository contains a simple HTML5 game exported from Godot Engine. The main file is `dennis.html`, which is actually an HTML file containing the game's web player.

Demo: [Link](https://dennis.debene.xyz/)

## Contents


- `dennis.html`: The main HTML file containing the game's web player.
- `dennis.js`: JavaScript file for the game.
- `dennis.wasm`: WebAssembly file containing the game's core logic.
- `dennis.pck`: Godot game data package.
- `dennis.png`: Splash image for the game.
- `dennis.apple-touch-icon.png`: Icon for iOS devices.
- `dennis.icon.png`: Favicon for the web page.

## How to Run on the IDE

To run this game locally using the Godot IDE, follow these steps:

1. **Open the Project in Godot**:
   - Launch the Godot Editor.
   - Open the project containing your game files.

2. **Configure the Export Settings**:
   - Go to `Project > Export` in the top menu.
   - Add a new preset for `HTML5` (if not already added).
   - Ensure all required files (e.g., `dennis.html`, `.js`, `.wasm`) are properly configured in the export settings.

3. **Run the Game Locally**:
   - In the Godot Editor, click on the **Play** button ▶ (or press `F5`).
   - Godot will automatically serve the HTML5 version of your game and open it in your default web browser.

4. **Test the Game**:
   - The game will run directly in the browser without the need for additional setup. 
   
   
A detailed guide on how to deploy a simple environment on AWS is included in the next section.

---

# Deploying a Godot HTML5 Game to AWS (S3 + CloudFront)

## Overview
This guide automates the deployment of your Godot HTML5 game to AWS using:
- **S3** for file hosting.
- **CloudFront** for fast global distribution.
- **CloudFormation** for infrastructure setup.
- **Shell scripts** to handle (re-)deployment.

---

## Quick Setup
### 0️⃣ Clone this repo via `git clone git@github.com:felipedbene/ah-ah-denis.git`


### 1️⃣ Edit `scripts/deploy-to-s3.sh`
- Open `deploy-to-s3.sh` and set your **bucket name** and **CloudFormation stack name**.

---

### 2️⃣ Deploy Everything
Run the following command to deploy the infrastructure and upload game files:

```bash
bash scripts/deploy-to-s3.sh
```

This will:
	-	Create an S3 bucket and configure permissions.
	-	Deploy a CloudFront distribution using CloudFormation.
	-	Upload your Godot-exported game files.

3️⃣ Get CloudFront URL

Once the deployment is complete, get the CloudFront URL to access your game:
```bash
aws cloudformation describe-stacks --stack-name my-cloudfront-stack \
  --query "Stacks[0].Outputs[?OutputKey=='CloudFrontURL'].OutputValue" --output text
```
Open the provided URL in your browser to play the game.

Updating or Redeploying

If you need to delete and redeploy everything, use:
```bash
bash delete-and-redeploy.sh
```
This will:
	-	Destroy the existing S3 bucket and CloudFront distribution.
	-	Recreate the infrastructure and re-upload files.

Notes
	-	CloudFront caching: If updates don’t appear, invalidate the cache:

`aws cloudfront create-invalidation --distribution-id <DISTRIBUTION_ID> --paths "/*"`


	-	Ensure AWS CLI is configured (aws configure).
	-	Use a modern browser (Chrome, Firefox) for best performance.


🚀 Your Godot HTML5 game is now hosted and accessible via CloudFront!


This README provides a brief overview of the contents, explains how to run the server using the Python command, and includes some notes about potential issues and limitations. You can adjust it as needed based on any specific details about your game or additional setup requirements.
