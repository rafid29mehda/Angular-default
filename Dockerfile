# Use the official Node.js image as the base image for the build stage
#FROM node:20-alpine as angular

# Set the working directory in the container
#WORKDIR /app

# Copy package.json and package-lock.json to the container
#COPY package*.json ./

# Install project dependencies
#RUN npm install

# Install Angular CLI globally
# RUN npm install -g @angular/cli

# Copy the entire project to the container
#COPY . .

# Build the Angular app for production
#RUN npm run build

# Use a smaller, production-ready Nginx image as the final image
#FROM nginx:alpine
# WORKDIR /usr/local/apache2/htdocs
# Copy the production-ready Angular app to the Nginx webserver's root directory
#COPY --from=angular /app/dist /usr/share/nginx/html/my-app

# Expose port 80
#EXPOSE 80

# Start Nginx
#CMD ["nginx", "-g", "daemon off;"]

#FROM httpd:alpine

# Copy the production-ready Angular app to the Apache web server's root directory
#COPY --from=angular /app/dist/ /usr/local/apache2/htdocs/

# Expose port 80
#EXPOSE 80

# Start Apache HTTP Server
#CMD ["httpd", "-D", "FOREGROUND"]
#hello



FROM node:alpine

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install -g @angular/cli

RUN npm install

CMD ["ng", "serve", "--host", "0.0.0.0"]