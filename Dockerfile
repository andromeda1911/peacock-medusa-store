# Use an official Node.js 18 runtime as a parent image
FROM node:18.17.0

# Set the working directory in the container
WORKDIR /usr/src/app

# Install PostgreSQL client tools
RUN apt-get update && apt-get install -y postgresql-client

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN yarn install

# Bundle your app's source code inside the Docker image
COPY . .

# Expose the port your app runs on
EXPOSE 7000 9000

# Command to run your app using yarn
CMD ["yarn", "dev"]
