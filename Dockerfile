# Stage 1: Build stage
FROM node:16 AS build
COPY /. /node/
WORKDIR /node
RUN npm install
RUN npm run build

# Stage 2: Production stage
FROM nginx
COPY --from=build /node/build/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
