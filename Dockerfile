# Build phase-1
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

# Build folder will be /app/build
RUN npm run build

#Build phase-2
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Default command for nginx base image is to run nginx
