# Use the official Node.js image as the base image for the build stage
FROM node:20 as angular

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the entire project to the container
COPY . .

# build the app
RUN npm run ng -- build

# Use a smaller, production-ready Nginx image as the final image
FROM nginx

# Copy the production-ready Angular app to the Nginx webserver's root directory
COPY --from=angular /app/dist/my-app /usr/share/nginx/html/my-app

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
