# Railway Deployment Guide for novnc-remmina

## Prerequisites
- Railway account
- GitHub account (for connecting the repository)

## Deployment Steps

1. **Fork or push this repository to your GitHub account**

2. **Create a new project on Railway**
   - Go to https://railway.app
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your novnc-remmina repository

3. **Configure Environment Variables**
   In Railway dashboard, add these environment variables:
   - `VNC_PASSWORD`: Your desired VNC password (default: mypassword)
   - `PORT`: Leave this unset - Railway will automatically set it

4. **Deploy**
   - Railway will automatically build and deploy using the Dockerfile
   - The deployment will use port 6081 internally
   - Railway will map this to port 443 on your domain

5. **Access your deployment**
   - Once deployed, access your noVNC instance at: https://novnc-remmina-production.up.railway.app
   - Enter your VNC password when prompted
   - You can now use Remmina from the web browser to connect to RDP/VNC/SSH sessions

## Port Configuration
- Internal port: 6081 (configured in Dockerfile)
- External port: 443 (HTTPS, handled by Railway)
- The Dockerfile is configured to dynamically use Railway's PORT environment variable

## Volumes (Optional)
For persistent configuration, you can use Railway's volume feature:
- Mount volume at `/root/.config/remmina` for Remmina configuration
- Mount volume at `/root/.local/share/remmina` for connection information

## Troubleshooting
- If the deployment fails, check the Railway logs
- Ensure the VNC_PASSWORD environment variable is set
- The container needs a few seconds to start up completely before accessing