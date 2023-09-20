FROM node:20-alpine AS development
ENV NODE_ENV development

 

# Add a work directory
WORKDIR /app

 

# Cache and Install dependencies
COPY package*.json ./
COPY package-lock.json .  # Use package-lock.json for npm
RUN npm install           # Use npm to install dependencies

 

# Copy app files
COPY . .

 

# Expose port
EXPOSE 4000

 

# Start the app
CMD [ "npm", "start" ]
