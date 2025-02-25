FROM node:12

# Create app directory
WORKDIR /ud-annotatrix

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
RUN npm run build

# Bundle app source
COPY . .

EXPOSE 5316
CMD [ "npm", "run", "dev-server" ]
