# Step 1: Using Node 20 LTS for stability across the team
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Parcel build command
RUN npx parcel build src/*.html --dist-dir dist --public-url ./

# Step 2: Nginx to serve static files
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]