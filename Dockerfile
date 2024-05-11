FROM node:14
WORKDIR /home/ubuntu/Jenkins/workspace/Job1/Shark-Secure-Pipeline/
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "app.js"]