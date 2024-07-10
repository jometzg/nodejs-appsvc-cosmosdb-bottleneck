# Use the official Node.js 14 image.
# https://hub.docker.com/_/node
FROM node:14.16

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . .

# Set the environment variable to make the app run on port 8092.
ENV PORT 8092

# Connection string to Cosmos
ENV CONNECTION_STRING="AccountEndpoint=https://<your-account-name>.documents.azure.com:443/;AccountKey"

# Expose port 8092 to the Docker host, so we can access it
# from the outside.
EXPOSE 8092

# Run the web service on container startup.
CMD [ "node", "server.js" ]
