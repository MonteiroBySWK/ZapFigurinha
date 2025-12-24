# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Install FFmpeg, libvips, and build tools for Sharp
RUN apk add --no-cache ffmpeg vips-dev build-base python3

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Create necessary directories
RUN mkdir -p temp auth_info

# Expose any ports if needed (none for this app)
EXPOSE 80

# Set environment variables (can be overridden)
ENV NODE_ENV=production

# Command to run the app
CMD ["npm", "run", "both"]